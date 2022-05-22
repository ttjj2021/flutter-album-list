import 'package:flutter/material.dart';
import 'package:flutter_album_list/widgets/app_component.dart';
import 'package:flutter_album_list/widgets/image_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/album.dart';

class DetailPage extends StatelessWidget {
  final Album item;
  const DetailPage(this.item, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
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
            ],
          )),
    );
  }
}
