import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/album.dart';
import '../../../models/album.dart';
import 'thumbnail_view.dart';

class AlbumItemView extends HookConsumerWidget {
  final Album item;
  const AlbumItemView(this.item, {Key? key}) : super(key: key);
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

    return ListTile(
        leading: ThumbnailView(item.artworkUrl100),
        title: Text(item.collectionName),
        subtitle: Text(item.artistName),
        trailing: FutureBuilder<bool>(
            future: item.isLiked(),
            builder: (_, snapshot) => IconButton(
                icon: Icon(snapshot.data ?? false
                    ? Icons.bookmark
                    : Icons.bookmark_outline),
                onPressed: () async {
                  //logic to open POPUP window

                  if (snapshot.hasError) {
                    await showDialog(
                        context: context,
                        builder: (_) => Container(
                            child: const Center(
                                child: const Text('Please retry'))));
                    return;
                  }

                  if (snapshot.data == null) {
                    print(null);
                    return;
                  }
                  updateLiked(snapshot.data ?? false);
                })));
  }
}
