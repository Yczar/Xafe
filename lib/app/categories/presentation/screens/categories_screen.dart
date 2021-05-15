import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xafe/app/categories/data/model/category_model.dart';
import 'package:xafe/app/categories/domain/usecases/listen_to_categories.dart';
import 'package:xafe/app/categories/presentation/screens/add_spending_category_screen.dart';
import 'package:xafe/core/config/di_config.dart';
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
                    const YMargin(8.12),
                    StreamBuilder<List<CategoryModel>>(
                        stream: locator<ListenToCategories>().call(
                          uid: FirebaseAuth.instance.currentUser.uid,
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data.isEmpty) {
                              return const Expanded(
                                child: Center(
                                  child: Text(
                                    'No spending categories added yet',
                                  ),
                                ),
                              );
                            } else {
                              return Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: context.insetsOnly(left: 20.0),
                                      child: Text(
                                        // ignore: lines_longer_than_80_chars
                                        '${snapshot.data.length} spending categories',
                                        style: const TextStyle(
                                          color: kColorAppBlack,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
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
                                                      .categoryEmoji,
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
                                                          .categoryName,
                                                      style: const TextStyle(
                                                        color: kColorAppBlack,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    const Text(
                                                      '03/12/20',
                                                      style: TextStyle(
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
                                                        const Color(0xFFFF8514)
                                                            .withOpacity(0.12),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  child: const Text(
                                                    'remove',
                                                    style: TextStyle(
                                                      color: Color(0xFFFF8514),
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
                        })
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
