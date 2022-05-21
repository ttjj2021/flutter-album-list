import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/global.dart';
import '../theme.dart';

enum AppPage { list, favourite }

class BottomBar extends HookConsumerWidget {
  final AppPage currentPage;

  const BottomBar({required this.currentPage, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(AppState.provider);

    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 24.sp,
        unselectedLabelStyle: appTheme.textTheme.caption,
        selectedLabelStyle: appTheme.textTheme.subtitle2,
        backgroundColor: appTheme.cardColor,
        unselectedItemColor: appTheme.snackBarTheme.backgroundColor,
        items: AppPage.values.map(parseBarItem).toList(),
        currentIndex: AppPage.values.indexOf(currentPage),
        selectedItemColor: Color(0xFFE81E62),
        onTap: (int idx) async {
          appState.menuId = AppPage.values.asMap().entries.toList()[idx].value;
        });
  }
}

BottomNavigationBarItem parseBarItem(AppPage item) {
  switch (item) {
    case AppPage.list:
      return BottomNavigationBarItem(
          icon: const Icon(Icons.bar_chart_outlined), label: tr('menu.list'));
    case AppPage.favourite:
      return BottomNavigationBarItem(
          icon: const Icon(Icons.account_circle_outlined),
          label: tr('menu.favourite'));
  }
}
