import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xafe/app/budget/data/models/budget_model.dart';
import 'package:xafe/app/budget/domain/usecases/listen_to_budgets.dart';
import 'package:xafe/app/budget/presentation/logic/notifiers/budget_notifier.dart';
import 'package:xafe/core/config/di_config.dart';
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
              StreamBuilder<List<BudgetModel>>(
                  stream: locator<ListenToBudgets>().call(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.isNotEmpty) {
                        return ViewModelBuilder<BudgetNotifier>.reactive(
                            viewModelBuilder: () => BudgetNotifier(),
                            builder: (_, model, __) {
                              return Expanded(
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: context.scaleY(11),
                                    mainAxisSpacing: context.scaleY(14),
                                    childAspectRatio: context.scaleY(180.97) /
                                        context.scaleY(113),
                                  ),
                                  itemCount: snapshot.data.length + 1,
                                  itemBuilder: (_, index) {
                                    if (index == snapshot.data.length) {
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
                                            borderRadius:
                                                BorderRadius.circular(15),
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
                                          BudgetDetailsScreen(
                                            budgetModel: snapshot.data[index],
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: context.insetsSymetric(
                                          horizontal: 20,
                                          vertical: 21.25,
                                        ),
                                        decoration: BoxDecoration(
                                          color: kColorWhite,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data[index].budgetName,
                                              style: const TextStyle(
                                                color: Color(0xFF898A8D),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              '\$${snapshot.data[index].budgetAmount}/${snapshot.data[index].budgetInterval}',
                                              style: const TextStyle(
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
                                                    color:
                                                        const Color(0xFF52ACFF)
                                                            .withOpacity(0.12),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                ),
                                                Container(
                                                  height: context.scaleY(11),
                                                  width: context.scaleY(101),
                                                  decoration: BoxDecoration(
                                                    color: model
                                                        .colorRandom(index),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
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
                              );
                            });
                      } else {
                        return const Expanded(
                          child: Center(
                            child: Text(
                              'No spending categories added yet',
                            ),
                          ),
                        );
                      }
                    } else if (snapshot.hasError) {
                      return Expanded(
                        child: Center(
                          child: Text(
                            'Error: ${snapshot.error}',
                          ),
                        ),
                      );
                    } else {
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
