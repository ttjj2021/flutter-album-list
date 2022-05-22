import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Widget loadingIndicator = kIsWeb
    ? const CircularProgressIndicator()
    : Platform.isIOS
        ? const CupertinoActivityIndicator()
        : const CircularProgressIndicator();

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => LayoutBuilder(
      builder: (builderContext, constraint) => Container(
          color: const Color.fromRGBO(255, 255, 255, 0.33),
          alignment: Alignment.center,
          height: constraint.maxHeight.isInfinite
              ? MediaQuery.of(context).size.height
              : constraint.maxHeight,
          width: double.infinity,
          child: loadingIndicator));
}
