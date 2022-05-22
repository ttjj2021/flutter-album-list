import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme.dart';
import '../../widgets/app_component.dart';
import '../favourite/favourite_page.dart';
import '../list/list_page.dart';

class AppPage {
  final String title;
  final Widget page;
  final IconData icon;
  AppPage({this.title = '', required this.page, required this.icon});
}

List<AppPage> titles = [
  AppPage(page: const ListPage(), icon: Icons.list, title: 'List'),
  AppPage(page: const FavouritePage(), icon: Icons.favorite, title: 'Favourite')
];

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final currentPage = useState<int>(0);
    return Scaffold(
        appBar: buildAppBar(title: titles[currentPage.value].title),
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
            items: titles
                .map((e) =>
                    BottomNavigationBarItem(icon: Icon(e.icon), label: e.title))
                .toList(),
            currentIndex: currentPage.value,
            onTap: (int idx) async {
              currentPage.value = idx;
            }));
  }
}
