import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xafe/app/categories/presentation/screens/categories_screen.dart';
import 'package:xafe/src/res/res.dart';
import 'package:xafe/src/res/values/assets/svgs/svgs.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

import 'app/budget/presentation/screens/budgets_screen.dart';
import 'app/home/presentation/screens/home_screen.dart';

enum BottomNavigationItem {
  Home,
  Categories,
  Budget,
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ValueNotifier<BottomNavigationItem> _bottomNavigationItem =
      ValueNotifier(BottomNavigationItem.Home);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _bottomNavigationItem,
        builder: (context, value, child) {
          return Scaffold(
            bottomNavigationBar: IntrinsicHeight(
              child: Container(
                color: kColorWhite,
                padding: context.insetsOnly(
                  top: 7.5,
                  bottom: 5.5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BottomItem(
                      title: 'Home',
                      svgPath: kHomeIcon,
                      selected: value == BottomNavigationItem.Home,
                      onPressed: () {
                        _bottomNavigationItem.value = BottomNavigationItem.Home;
                      },
                    ),
                    const XMargin(43),
                    BottomItem(
                      title: 'Categories',
                      svgPath: kCategoryIcon,
                      selected: value == BottomNavigationItem.Categories,
                      onPressed: () {
                        _bottomNavigationItem.value =
                            BottomNavigationItem.Categories;
                      },
                    ),
                    const XMargin(43),
                    BottomItem(
                      title: 'Budget',
                      svgPath: kBudgetIcon,
                      selected: value == BottomNavigationItem.Budget,
                      onPressed: () {
                        _bottomNavigationItem.value =
                            BottomNavigationItem.Budget;
                      },
                    ),
                  ],
                ),
              ),
            ),
            body: value == BottomNavigationItem.Home
                ? HomeScreen()
                : value == BottomNavigationItem.Categories
                    ? CategoriesScreen()
                    : BudgetsScreen(),
          );
        });
  }
}

class BottomItem extends StatelessWidget {
  const BottomItem({
    Key key,
    this.selected,
    this.title,
    this.svgPath,
    this.onPressed,
  }) : super(key: key);

  final bool selected;
  final String title;
  final String svgPath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          SvgPicture.asset(
            svgPath,
            height: context.scaleY(19),
            color: selected ? kColorAppBlack : kColorAppGrey,
          ),
          Text(
            title,
            style: TextStyle(
              color: selected ? kColorAppBlack : kColorAppGrey,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
