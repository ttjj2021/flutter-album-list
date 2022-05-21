import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  AppButton({this.onPressed, required this.title});

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
