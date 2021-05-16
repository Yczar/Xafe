import 'package:firebase_auth/firebase_auth.dart';
import 'package:xafe/app/budget/data/datasource/budget_datasource.dart';
import 'package:xafe/app/budget/data/models/budget_model.dart';
import 'package:xafe/app/home/data/models/expense_model.dart';
import 'package:xafe/core/config/firebase/firebase.dart';

class BudgetDataSourceImpl extends BudgetDataSource {
  BudgetDataSourceImpl(this.xafeFireStoreService);

  final XafeFireStoreService xafeFireStoreService;

  @override
  Future<void> createBudget(BudgetModel params) {
    final response = xafeFireStoreService.createInnerDocument(
      collectionName: 'users',
      docId: FirebaseAuth.instance.currentUser.uid,
      innerCollectionName: 'budgets',
      innerDocId: params.budgetId,
      data: params.toJson(),
    );
    return response;
  }

  @override
  Future<void> createBudgetExpense(ExpenseModel params, String budgetId,) {
    final response = xafeFireStoreService.createDeepInnerDocument(
      collectionName: 'users',
      innerCollectionName: 'budgets',
      deepDocId: params.expenseId,
      data: params.toJson(),
      deepCollectionName: 'expenses',
      docId: FirebaseAuth.instance.currentUser.uid,
      innerDocId: budgetId,
    );
    return response;
  }

  @override
  Future<void> deleteBudget(String budgetId) {
    final response = xafeFireStoreService.deleteInnerDocument(
      collectionName: 'users',
      innerCollectionName: 'budgets',
      docId: FirebaseAuth.instance.currentUser.uid,
      innerDocId: budgetId,
    );
    return response;
  }

  @override
  Future<void> editBudget(BudgetModel params) {
    final response = xafeFireStoreService.updateInnerDocument(
      collectionName: 'users',
      innerCollectionName: 'budgets',
      docId: FirebaseAuth.instance.currentUser.uid,
      innerDocId: params.budgetId,
      data: params.toJson(),
    );
    return response;
  }

  @override
  Stream<List<ExpenseModel>> listenToBudgetExpenses(String budgetId) {
    return xafeFireStoreService
        .listenToDeeperInnerCollection(
          collectionName: 'users',
          docId: FirebaseAuth.instance.currentUser.uid,
          innerCollectionName: 'budgets',
          deeperInnerCollection: 'expenses',
          innerDocId: budgetId,
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

  @override
  Stream<List<BudgetModel>> listenToBudgets() {
    return xafeFireStoreService
        .listenToInnerCollection(
          collectionName: 'users',
          docId: FirebaseAuth.instance.currentUser.uid,
          innerCollectionName: 'budgets',
        )
        .map(
          (snapshot) => snapshot.docs
              .map(
                (docSnapshot) => BudgetModel.fromJson(
                  docSnapshot.data(),
                ),
              )
              .toList(),
        );
  }
}
