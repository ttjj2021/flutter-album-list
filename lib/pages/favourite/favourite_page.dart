import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/album.dart';
import '../../widgets/error_view.dart';
import '../../widgets/loading_view.dart';
import '../list/components/item_view.dart';

class FavouritePage extends HookConsumerWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumListPvd = ref.watch(favAlbumListProvider);

    return RefreshIndicator(
        onRefresh: () async => ref.refresh(favAlbumListProvider),
        child: albumListPvd.when(
            data: (data) => ListView.separated(
                  itemCount: data.length,
                  itemBuilder: (_, index) => AlbumItemView(data[index]),
                  separatorBuilder: (_, __) => const Divider(),
                ),
            loading: () => const LoadingView(),
            error: (err, __) => ErrorView(
                  err,
                  onRefresh: () => ref.refresh(favAlbumListProvider),
                )));
  }
}
