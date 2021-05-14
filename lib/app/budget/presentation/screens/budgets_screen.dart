import 'package:flutter/material.dart';
import 'package:xafe/src/res/res.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

import 'budget_details_screen.dart';
import 'create_a_budget_screen.dart';

class BudgetsScreen extends StatefulWidget {
  @override
  _BudgetsScreenState createState() => _BudgetsScreenState();
}

class _BudgetsScreenState extends State<BudgetsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBlue,
      body: SafeArea(
        child: Padding(
          padding: context.insetsSymetric(
            horizontal: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YMargin(56.02),
              const Text(
                '‍💻 Budgets',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: kColorWhite,
                ),
              ),
              const YMargin(53.77),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: context.scaleY(11),
                    mainAxisSpacing: context.scaleY(14),
                    childAspectRatio:
                        context.scaleY(180.97) / context.scaleY(113),
                  ),
                  itemCount: 5,
                  itemBuilder: (_, index) {
                    if (index == 4) {
                      return InkWell(
                        onTap: () {
                          navigate(
                            context,
                            CreateABudgetScreen(),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: kColorWhite.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            Icons.add,
                            size: context.scaleY(18.67),
                            color: kColorWhite,
                          ),
                        ),
                      );
                    }
                    return InkWell(
                      onTap: () {
                        navigate(
                          context,
                          BudgetDetailsScreen(),
                        );
                      },
                      child: Container(
                        padding: context.insetsSymetric(
                          horizontal: 20,
                          vertical: 21.25,
                        ),
                        decoration: BoxDecoration(
                          color: kColorWhite,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Groceries',
                              style: TextStyle(
                                color: Color(0xFF898A8D),
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            const Text(
                              r'$40/month',
                              style: TextStyle(
                                color: kColorBlack,
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                            const YMargin(12),
                            Stack(
                              children: [
                                Container(
                                  height: context.scaleY(11),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF52ACFF)
                                        .withOpacity(0.12),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                Container(
                                  height: context.scaleY(11),
                                  width: context.scaleY(101),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF52ACFF),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
