import 'package:flutter/material.dart';
import 'package:xafe/app/categories/presentation/screens/add_spending_category_screen.dart';
import 'package:xafe/src/res/res.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBlue,
      body: SafeArea(
        child: Column(
          children: [
            const YMargin(56.02),
            Padding(
              padding: context.insetsSymetric(horizontal: 20.0,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '‍💻 Categories',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: kColorWhite,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      navigate(
                        context,
                        AddSpendingCategoryScreen(),
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: kColorWhite.withOpacity(0.12),
                      radius: context.scaleY(24),
                      child: Icon(
                        Icons.add,
                        size: context.scaleY(21),
                        color: kColorWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const YMargin(17.28),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: kColorWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const YMargin(26.07),
                    Center(
                      child: Container(
                        width: context.scaleY(50),
                        height: context.scaleY(5),
                        decoration: BoxDecoration(
                          color: kColorBlackish.withOpacity(0.1),
                        ),
                      ),
                    ),
                    const YMargin(39.63),
                    Padding(
                      padding: context.insetsOnly(left: 20.0),
                      child: const Text(
                        '4 spending categories',
                        style: TextStyle(
                          color: kColorAppBlack,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const YMargin(8.12),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: context.insetsSymetric(
                              vertical: 20.0,
                              horizontal: 21.48,
                            ),
                            child: Row(
                              children: [
                                Image.network(
                                  '',
                                  width: context.scaleY(36),
                                  height: context.scaleY(36),
                                ),
                                const XMargin(12.68),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Food',
                                      style: TextStyle(
                                        color: kColorAppBlack,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const Text(
                                      '03/12/20',
                                      style: TextStyle(
                                        color: kColorAppGrey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  padding: context.insetsSymetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        const
                                        Color(0xFFFF8514).withOpacity(0.12),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Text(
                                    'remove',
                                    style: TextStyle(
                                      color: Color(0xFFFF8514),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (_, __) => Divider(
                          height: 0,
                          color: const Color(0xFF9A96A4).withOpacity(0.1),
                        ),
                        itemCount: 5,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
