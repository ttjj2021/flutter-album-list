import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme.dart';
import '../../widgets/app_component.dart';
import '../../widgets/bottom_bar.dart';
import '../favourite/favourite_page.dart';
import '../list/list_page.dart';

List<String> titles = ['menu.list', 'menu.favourite'];

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final currentPage = useState<int>(0);
    return Scaffold(
        appBar: buildAppBar(
            title: titles[currentPage.value].tr(), centerTitle: false),
        body: SafeArea(
          top: false,
          child: IndexedStack(
            index: currentPage.value,
            children: const [ListPage(), FavouritePage()],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 24.sp,
            unselectedLabelStyle: appTheme.textTheme.caption,
            selectedLabelStyle: appTheme.textTheme.subtitle2,
            backgroundColor: appTheme.cardColor,
            unselectedItemColor: appTheme.snackBarTheme.backgroundColor,
            items: AppPage.values.map(parseBarItem).toList(),
            currentIndex: currentPage.value,
            selectedItemColor: Color(0xFFE81E62),
            onTap: (int idx) async {
              currentPage.value = idx;
            }));
  }
}
