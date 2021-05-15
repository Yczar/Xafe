import 'package:dartz/dartz.dart';
import 'package:xafe/app/home/data/datasource/home_datasource.dart';
import 'package:xafe/app/home/data/models/expense_model.dart';
import 'package:xafe/app/home/domain/repository/home_repo.dart';
import 'package:xafe/core/error/failures.dart';
import 'package:xafe/core/error/helpers/helpers.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl(this._dataSource);

  final HomeDataSource _dataSource;

  @override
  Future<Either<Failure, void>> addAnExpense(ExpenseModel params) {
    return successFailureInterceptor(
      () => _dataSource.addAnExpense(params),
    );
  }

  @override
  Stream<List<ExpenseModel>> listenToExpenses() {
    return _dataSource.listenToExpenses();
  }
}
