import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_component.dart';

class ErrorView extends StatelessWidget {
  final dynamic err;
  final double? paddingTop;
  final VoidCallback? onRefresh;
  final bool isShowIcon;

  const ErrorView(this.err,
      {Key? key, this.paddingTop, this.onRefresh, this.isShowIcon = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: EdgeInsets.all(12.sp),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    err.toString(),
                    textAlign: TextAlign.center,
                  ),
                  if (onRefresh != null) ...[
                    SizedBox(height: 20.sp),
                    AppButton(title: 'Retry', onPressed: onRefresh)
                  ]
                ])));
  }
}
