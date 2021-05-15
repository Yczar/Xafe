import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:xafe/app/categories/data/model/category_model.dart';
import 'package:xafe/app/categories/domain/usecases/create_category.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';

class CreateCategoryViewmodel extends BaseViewModel {
  CreateCategoryViewmodel(
    this._createCategory,
  );

  final CreateCategory _createCategory;

  Future createCategory({
    CategoryModel params,
    BuildContext context,
  }) {
    setBusy(true);
    return _createCategory(params)
      ..then(
        (result) {
          result.fold(
            (failure) {},
            (data) {
              popView(context);
            },
          );
        },
      );
  }
}
