import 'package:flutter/material.dart';
import 'package:xafe/src/res/res.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

enum BottomNavigationItem {
  Home,
  Categories,
  Budget,
}

class MainScreen extends StatelessWidget {
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
                      title: 'Homr',
                      selected: value == BottomNavigationItem.Home,
                      onPressed: () {
                        _bottomNavigationItem.value = BottomNavigationItem.Home;
                      },
                    ),
                    const XMargin(43),
                    BottomItem(
                      title: 'Categories',
                      selected: value == BottomNavigationItem.Categories,
                      onPressed: () {
                        _bottomNavigationItem.value =
                            BottomNavigationItem.Categories;
                      },
                    ),
                    const XMargin(43),
                    BottomItem(
                      title: 'Budget',
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
            body: Column(),
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
          const Icon(
            Icons.home,
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
