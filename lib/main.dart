import 'package:flutter/material.dart';
import 'package:flutter_album_list/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'pages/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        title: 'Album List',
        theme: appTheme,
        home: HomePage(),
      ),
    );
  }
}
