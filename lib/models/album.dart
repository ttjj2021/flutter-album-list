import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'album.freezed.dart';
part 'album.g.dart';

extension AlbumExtension on Album {
  Future<bool> isLiked() async {
    final prefs = await SharedPreferences.getInstance();

    final List<String> collectionIds = prefs.getStringList('liked_list') ?? [];

    return collectionIds.any((element) => element == collectionId.toString());
  }
}

@freezed
class Album with _$Album {
  factory Album({
    @Default(0) int artistId,
    @Default(0) int collectionId,
    @Default(0) int amgArtistId,
    @Default(0) double collectionPrice,
    @Default(0) int trackCount,
    @Default('') String wrapperType,
    @Default('') String collectionType,
    @Default('') String artistName,
    @Default('') String collectionName,
    @Default('') String collectionViewUrl,
    @Default('') String artistViewUrl,
    @Default('') String artworkUrl60,
    @Default('') String artworkUrl100,
    @Default('') String collectionExplicitness,
    @Default('') String copyright,
    @Default('') String country,
    @Default('') String currency,
    @Default('') String primaryGenreName,
    DateTime? releaseDate,
  }) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}
