// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Album _$$_AlbumFromJson(Map<String, dynamic> json) => _$_Album(
      artistId: json['artistId'] as int? ?? 0,
      collectionId: json['collectionId'] as int? ?? 0,
      amgArtistId: json['amgArtistId'] as int? ?? 0,
      collectionPrice: (json['collectionPrice'] as num?)?.toDouble() ?? 0,
      trackCount: json['trackCount'] as int? ?? 0,
      wrapperType: json['wrapperType'] as String? ?? '',
      collectionType: json['collectionType'] as String? ?? '',
      artistName: json['artistName'] as String? ?? '',
      collectionName: json['collectionName'] as String? ?? '',
      collectionViewUrl: json['collectionViewUrl'] as String? ?? '',
      artistViewUrl: json['artistViewUrl'] as String? ?? '',
      artworkUrl60: json['artworkUrl60'] as String? ?? '',
      artworkUrl100: json['artworkUrl100'] as String? ?? '',
      collectionExplicitness: json['collectionExplicitness'] as String? ?? '',
      copyright: json['copyright'] as String? ?? '',
      country: json['country'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      primaryGenreName: json['primaryGenreName'] as String? ?? '',
      releaseDate: json['releaseDate'] == null
          ? null
          : DateTime.parse(json['releaseDate'] as String),
    );

Map<String, dynamic> _$$_AlbumToJson(_$_Album instance) => <String, dynamic>{
      'artistId': instance.artistId,
      'collectionId': instance.collectionId,
      'amgArtistId': instance.amgArtistId,
      'collectionPrice': instance.collectionPrice,
      'trackCount': instance.trackCount,
      'wrapperType': instance.wrapperType,
      'collectionType': instance.collectionType,
      'artistName': instance.artistName,
      'collectionName': instance.collectionName,
      'collectionViewUrl': instance.collectionViewUrl,
      'artistViewUrl': instance.artistViewUrl,
      'artworkUrl60': instance.artworkUrl60,
      'artworkUrl100': instance.artworkUrl100,
      'collectionExplicitness': instance.collectionExplicitness,
      'copyright': instance.copyright,
      'country': instance.country,
      'currency': instance.currency,
      'primaryGenreName': instance.primaryGenreName,
      'releaseDate': instance.releaseDate?.toIso8601String(),
    };
