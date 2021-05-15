import 'package:stacked/stacked.dart';
import 'package:xafe/app/categories/domain/usecases/delete_category.dart';

class DeleteCategoryViewmodel extends BaseViewModel {
  DeleteCategoryViewmodel(
    this._deleteCategory,
  );

  final DeleteCategory _deleteCategory;

  Future deleteCategory({
    String categoryId,
  }) {
    setBusy(true);
    return _deleteCategory(categoryId)
      ..then(
        (result) {
          result.fold(
            (failure) {},
            (data) {},
          );
        },
      );
  }
}
