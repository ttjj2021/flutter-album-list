import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/album.dart';
import '../../models/album.dart';
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
            data: (data) {
              final list = data..sortBy((element) => element.collectionName);
              return AlbumListPage(list);
            },
            loading: () => const LoadingView(),
            error: (err, __) => ErrorView(
                  err,
                  onRefresh: () => ref.refresh(albumListProvider),
                )));
  }
}

class ArtistPage extends StatelessWidget {
  final List<Album> albums;
  const ArtistPage(this.albums, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mappedList =
        albums.groupListsBy((ele) => ele.artistName).entries.toList();
    return ListView.separated(
      itemCount: mappedList.length,
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 8.sp),
      itemBuilder: (_, index) {
        final artistName = mappedList[index].key;
        final artistViewUrl = mappedList[index].value.first.artistViewUrl;
        return ListTile(
          title: Text(artistName),
          onTap: () => Navigator,
          trailing: IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
        );
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}

class AlbumListPage extends StatelessWidget {
  final List<Album> albums;
  const AlbumListPage(this.albums, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: albums.length,
      padding: EdgeInsets.only(top: 8.sp),
      itemBuilder: (_, index) => AlbumItemView(albums[index]),
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}
