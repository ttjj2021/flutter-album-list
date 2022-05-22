import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;

  const ImageView(
    this.url, {
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return url.isNotEmpty
        ? CachedNetworkImage(
            imageUrl: url,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
            width: width,
            height: height,
          )
        : const SizedBox();
  }
}
