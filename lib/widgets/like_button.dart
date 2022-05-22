import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/album.dart';
import '../models/album.dart';

class LikeButton extends HookConsumerWidget {
  final Album item;
  const LikeButton(this.item, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMounted = useIsMounted();

    void updateLiked(bool isLiked) async {
      try {
        final prefs = await SharedPreferences.getInstance();
        final likedList = prefs.getStringList('liked_list') ?? [];

        if (isLiked) {
          likedList.removeWhere(
              (element) => element == item.collectionId.toString());
        } else {
          likedList.insert(0, item.collectionId.toString());
        }

        await prefs.setStringList('liked_list', likedList);
        if (!isMounted()) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(isLiked ? 'Unliked!' : 'Liked!'),
        ));
        ref.refresh(albumListProvider);
        if (!isMounted()) return;
        ref.refresh(favAlbumListProvider);
      } catch (err) {
        if (!isMounted()) return;
        showDialog(
            context: context,
            builder: (_) => const Center(child: Text('Please retry')));
      }
    }

    return FutureBuilder<bool>(
        future: item.isLiked(),
        builder: (_, snapshot) => IconButton(
            icon: Icon(
              snapshot.data ?? false ? Icons.favorite : Icons.favorite_outline,
              color: snapshot.data ?? false ? Colors.pink : null,
            ),
            onPressed: () async {
              if (snapshot.hasError || snapshot.data == null) {
                await showDialog(
                    context: context,
                    builder: (innerContext) => AlertDialog(
                          title: Column(children: [
                            Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                    padding: EdgeInsets.all(8.sp),
                                    onPressed: () =>
                                        Navigator.of(innerContext).pop(),
                                    icon: const Icon(Icons.close))),
                            const Text('Please retry'),
                            SizedBox(height: 24.sp)
                          ]),
                        ));
                return;
              }

              updateLiked(snapshot.data ?? false);
            }));
  }
}
