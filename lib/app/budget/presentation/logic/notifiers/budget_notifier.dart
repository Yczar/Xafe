import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xafe/app/budget/data/models/budget_model.dart';
import 'package:xafe/app/budget/presentation/screens/add_a_budget_expense_screen.dart';
import 'package:xafe/app/budget/presentation/screens/edit_a_budget_screen.dart';
import 'package:xafe/app/home/presentation/logic/viewmodels/home_screen_viewmodel.dart';
import 'package:xafe/src/res/res.dart';
import 'package:xafe/src/res/values/assets/svgs/svgs.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

class BudgetNotifier extends BaseViewModel {
  List<Color> hexColor = [
    const Color(0xFF52ACFF),
    const Color(0xFFFF529B),
    const Color(0xFF02B474),
    const Color(0xFFFF8514),
  ];

  Color colorRandom(int currentIndex) {
    if (currentIndex < hexColor.length) {
      return hexColor[currentIndex];
    } else {
      return hexColor[currentIndex % hexColor.length];
    }
  }

  void showBottomSheet(
    BuildContext context,
    BudgetModel budgetModel,
  ) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return IntrinsicHeight(
          child: Container(
            padding: context.insetsSymetric(
              horizontal: 20,
            ),
            decoration: const BoxDecoration(
              color: kColorWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                const YMargin(22.16),
                Container(
                  width: context.scaleY(50),
                  height: context.scaleY(5),
                  decoration: BoxDecoration(
                    color: kColorBlackish.withOpacity(0.1),
                  ),
                ),
                const YMargin(40.66),
                InkWell(
                  onTap: () {
                    popView(context);
                    navigate(
                      context,
                      AddABudgetExpenseScreen(
                        budgetId: budgetModel.budgetId,
                      ),
                    );
                  },
                  child: const BottomSheetItem(
                    svgPath: kAddExpenseIcon,
                    title: 'Add an Expense',
                  ),
                ),
                Padding(
                  padding: context.insetsOnly(
                    left: 40.0,
                    top: 25,
                  ),
                  child: const Divider(
                    height: 0,
                  ),
                ),
                const YMargin(25),
                InkWell(
                  onTap: () {
                    popView(context);
                    navigate(
                      context,
                      EditABudgetScreen(
                        budgetModel: budgetModel,
                      ),
                    );
                  },
                  child: const BottomSheetItem(
                    title: 'Edit budget',
                    svgPath: kCreateBudgetIcon,
                  ),
                ),
                Padding(
                  padding: context.insetsOnly(left: 40.0, top: 25),
                  child: const Divider(
                    height: 0,
                  ),
                ),
                const YMargin(25),
                InkWell(
                  onTap: () {
                    popView(context);
                    // navigate(
                    //   context,
                    //   AddSpendingCategoryScreen(),
                    // );
                  },
                  child: const BottomSheetItem(
                    title: 'Delete budget',
                    svgPath: kAppDeleteIcon,
                  ),
                ),
                Padding(
                  padding: context.insetsOnly(left: 40.0, top: 20),
                  child: const Divider(
                    height: 0,
                  ),
                ),
                const YMargin(128.62),
              ],
            ),
          ),
        );
      },
    );
  }
}
