import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme.dart';

AppBar buildAppBar({
  String? title,
  bool centerTitle = true,
}) =>
    AppBar(
      title: title != null ? Text(title) : null,
      centerTitle: centerTitle,
    );

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  const AppButton({Key? key, this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
            elevation: 0,
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24.sp)))),
        onPressed: onPressed,
        child: Text(title));
  }
}

class RecordTile extends StatelessWidget {
  final String title;
  final String? value;

  const RecordTile({required this.title, this.value, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 4.sp),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title,
              style: appTheme.primaryTextTheme.caption
                  ?.copyWith(color: Colors.black, height: 1.32)),
          SizedBox(width: 16.sp),
          Flexible(child: Text(value ?? ''))
        ]));
  }
}
