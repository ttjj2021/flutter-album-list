import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/album.dart';
import '../../widgets/app_component.dart';
import '../../widgets/bottom_bar.dart';
import '../../widgets/error_view.dart';
import '../../widgets/loading_view.dart';
import 'components/item_view.dart';

class ListPage extends HookConsumerWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumListPvd = ref.watch(albumListProvider);

    return RefreshIndicator(
        onRefresh: () async => ref.refresh(albumListProvider),
        child: albumListPvd.when(
            data: (data) => ListView.separated(
                  itemCount: data.length,
                  itemBuilder: (_, index) => AlbumItemView(data[index]),
                  separatorBuilder: (_, __) => const Divider(),
                ),
            loading: () => const LoadingView(),
            error: (err, __) => ErrorView(
                  err,
                  onRefresh: () => ref.refresh(albumListProvider),
                )));
  }
}
