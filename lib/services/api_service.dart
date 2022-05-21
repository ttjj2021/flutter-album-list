import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:jiffy/jiffy.dart';
import '../models/album.dart';

class ApiService {
  Future<List<Album>> getAlbums() async {
    String endpoint =
        "https://itunes.apple.com/search?term=jack+johnson&entity=album";
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['results'];
      return result.map(((e) => Album.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  // /v2/snapshot/locale/global/markets/crypto/tickers
}

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());
