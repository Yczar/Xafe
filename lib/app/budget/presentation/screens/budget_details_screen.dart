import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:xafe/app/budget/data/models/budget_model.dart';
import 'package:xafe/app/budget/domain/usecases/listen_to_budget_expenses.dart';
import 'package:xafe/app/budget/presentation/logic/notifiers/budget_notifier.dart';
import 'package:xafe/app/home/data/models/expense_model.dart';
import 'package:xafe/core/config/di_config.dart';
import 'package:xafe/src/res/res.dart';
import 'package:xafe/src/res/values/assets/svgs/svgs.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

class BudgetDetailsScreen extends StatelessWidget {
  const BudgetDetailsScreen({
    Key key,
    this.budgetModel,
  }) : super(key: key);

  final BudgetModel budgetModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BudgetNotifier>.reactive(
        viewModelBuilder: () => BudgetNotifier(),
        builder: (_, model, __) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: kColorBlue,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const YMargin(70.47),
                  Padding(
                    padding: context.insetsSymetric(
                      horizontal: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                popView(context);
                              },
                              child: SvgPicture.asset(
                                kBackArrowIcon,
                                height: context.scaleY(19),
                                color: kColorWhite,
                              ),
                            ),
                            Text(
                              budgetModel.budgetName,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: kColorWhite,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                model.showBottomSheet(
                                  context,
                                  budgetModel,
                                );
                              },
                              child: CircleAvatar(
                                backgroundColor: kColorWhite.withOpacity(0.12),
                                radius: context.scaleY(24),
                                child: SvgPicture.asset(
                                  kAppAddIcon,
                                  height: context.scaleY(21),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const YMargin(42.58),
                        RichText(
                          text: const TextSpan(
                            text: r'$ 200.00 ',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 32,
                              color: kColorWhite,
                              fontFamily: 'EuclidaCircular',
                            ),
                            children: [
                              TextSpan(
                                text: 'spent',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: kColorWhite,
                                  fontFamily: 'EuclidaCircular',
                                ),
                              )
                            ],
                          ),
                        ),
                        const YMargin(10),
                        Stack(
                          children: [
                            Container(
                              height: context.scaleY(11),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                color: kColorWhite.withOpacity(0.12),
                              ),
                            ),
                            Container(
                              height: context.scaleY(11),
                              width: context.scaleY(199.85),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                color: kColorWhite,
                              ),
                            ),
                          ],
                        ),
                        const YMargin(17),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: context.insetsAll(10),
                            decoration: BoxDecoration(
                              color: kColorWhite.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Text(
                              '\$${budgetModel.budgetAmount}/${budgetModel.budgetInterval}',
                              style: const TextStyle(
                                color: kColorWhite,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const YMargin(40.16),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: kColorWhite,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                      ),
                      child: StreamBuilder<List<ExpenseModel>>(
                          stream: locator<ListenToBudgetExpenses>()
                              .call(budgetModel.budgetId),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data.isNotEmpty) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const YMargin(26.07),
                                    Container(
                                      width: context.scaleY(50),
                                      height: context.scaleY(5),
                                      decoration: BoxDecoration(
                                        color: kColorBlackish.withOpacity(0.1),
                                      ),
                                    ),
                                    const YMargin(39.63),
                                    const Text(
                                      'Expense History',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: kColorAppBlack,
                                      ),
                                    ),
                                    const YMargin(8),
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
                                                Text(
                                                  snapshot.data[index]
                                                          .categoryEmoji ??
                                                      '',
                                                  style: const TextStyle(
                                                    fontSize: 36,
                                                  ),
                                                ),
                                                const XMargin(12.68),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      // ignore: lines_longer_than_80_chars
                                                      snapshot.data[index]
                                                          .expenseName,
                                                      style: const TextStyle(
                                                        color: kColorAppBlack,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(
                                                      snapshot.data[index]
                                                          .expenseDate,
                                                      style: const TextStyle(
                                                        color: kColorAppGrey,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                Container(
                                                  padding:
                                                      context.insetsSymetric(
                                                    horizontal: 10,
                                                    vertical: 5,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFF0F0627)
                                                            .withOpacity(0.04),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  child: Text(
                                                    // ignore: lines_longer_than_80_chars
                                                    '\$${snapshot.data[index].expenseAmount}',
                                                    style: const TextStyle(
                                                      color: Color(0xFF0F0627),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        separatorBuilder: (_, __) => Divider(
                                          height: 0,
                                          color: const Color(0xFF9A96A4)
                                              .withOpacity(0.1),
                                        ),
                                        itemCount: snapshot.data.length,
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return const Expanded(
                                  child: Center(
                                    child: Text(
                                      'No new budget added yet',
                                    ),
                                  ),
                                );
                              }
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text(
                                  'Error: ${snapshot.error}',
                                ),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
