import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/album.dart';
import '../../models/album.dart';
import '../../widgets/app_component.dart';
import '../../widgets/error_view.dart';
import '../../widgets/image_view.dart';
import '../../widgets/like_button.dart';
import '../../widgets/loading_view.dart';

class DetailPage extends HookConsumerWidget {
  final Album item;
  const DetailPage(this.item, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumListPvd = ref.watch(albumListProvider);

    return Scaffold(
      appBar: buildAppBar(),
      body: albumListPvd.when(
          data: (data) {
            return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 12.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 12.sp),
                    Center(
                        child: ImageView(
                      item.artworkUrl100,
                      width: 300.sp,
                      height: 300.sp,
                    )),
                    SizedBox(height: 24.sp),
                    Text(
                      item.collectionName,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.headline1,
                    ),
                    SizedBox(height: 12.sp),
                    Text(
                      item.artistName,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.headline2,
                    ),
                    SizedBox(height: 12.sp),
                    Text(
                      item.copyright,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12.sp),
                    LikeButton(item, hasText: true),
                  ],
                ));
          },
          loading: () => const LoadingView(),
          error: (err, _) =>
              ErrorView(err, onRefresh: () => ref.refresh(albumListProvider))),
    );
  }
}
