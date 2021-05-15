import 'package:firebase_auth/firebase_auth.dart';
import 'package:xafe/app/home/data/datasource/home_datasource.dart';
import 'package:xafe/app/home/data/models/expense_model.dart';
import 'package:xafe/core/config/firebase/firebase.dart';

class HomeDataSourceImpl extends HomeDataSource {
  HomeDataSourceImpl(this.xafeFireStoreService);

  final XafeFireStoreService xafeFireStoreService;

  @override
  Future<void> addAnExpense(ExpenseModel params) {
    final response = xafeFireStoreService.createInnerDocument(
      collectionName: 'users',
      docId: FirebaseAuth.instance.currentUser.uid,
      innerCollectionName: 'expenses',
      innerDocId: params.expenseId,
      data: params.toJson(),
    );
    return response;
  }

  @override
  Stream<List<ExpenseModel>> listenToExpenses() {
    return xafeFireStoreService
        .listenToInnerCollection(
          collectionName: 'users',
          docId: FirebaseAuth.instance.currentUser.uid,
          innerCollectionName: 'expenses',
        )
        .map(
          (snapshot) => snapshot.docs
              .map(
                (docSnapshot) => ExpenseModel.fromJson(
                  docSnapshot.data(),
                ),
              )
              .toList(),
        );
  }
}
