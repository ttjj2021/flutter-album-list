import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThumbnailView extends StatelessWidget {
  final String url;
  const ThumbnailView(this.url, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return url.isNotEmpty
        ?
        // CachedNetworkImage(
        //     imageUrl: url,
        //     placeholder: (context, url) => const CircularProgressIndicator(),
        //     errorWidget: (context, url, error) => const Icon(Icons.error),
        //     width: 20.sp,
        //     height: 20.sp,
        //     fit: BoxFit.cover,
        //   )
        Image.network(url)
        : const SizedBox();
  }
}
