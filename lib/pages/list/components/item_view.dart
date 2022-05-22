import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/album.dart';
import '../../../widgets/image_view.dart';
import '../../../widgets/like_button.dart';
import '../../detail/detail_page.dart';

class AlbumItemView extends HookConsumerWidget {
  final Album item;
  const AlbumItemView(this.item, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
        minVerticalPadding: 4.sp,
        leading: ImageView(item.artworkUrl100),
        title: Text(item.collectionName),
        subtitle: Text(item.artistName),
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => DetailPage(item))),
        trailing: LikeButton(item));
  }
}
