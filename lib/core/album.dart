import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/album.dart';
import '../services/api_service.dart';

final albumListProvider = FutureProvider.autoDispose<List<Album>>((ref) async {
  final albums = await ref.read(apiServiceProvider).getAlbums();
  return albums;
});

final favAlbumListProvider =
    FutureProvider.autoDispose<List<Album>>((ref) async {
  final albums = await ref.read(apiServiceProvider).getAlbums();

  final prefs = await SharedPreferences.getInstance();
  final likedList = prefs.getStringList('liked_list') ?? [];
  return likedList
      .map((ele) => albums
          .firstWhere((element) => element.collectionId == int.parse(ele)))
      .toList();
});
