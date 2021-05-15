import 'package:firebase_auth/firebase_auth.dart';
import 'package:xafe/app/categories/data/datasource/categories_datasource.dart';
import 'package:xafe/app/categories/data/model/category_model.dart';
import 'package:xafe/core/config/firebase/firebase.dart';

@override
class CategoriesDataSourceImpl extends CategoriesDataSource {
  CategoriesDataSourceImpl(this.xafeFireStoreService);

  final XafeFireStoreService xafeFireStoreService;

  @override
  Future<void> createCategory(CategoryModel params) {
    final response = xafeFireStoreService.createInnerDocument(
      collectionName: 'users',
      docId: FirebaseAuth.instance.currentUser.uid,
      innerCollectionName: 'categories',
      innerDocId: params.categoryId,
      data: params.toJson(),
    );
    return response;
  }

  @override
  Stream<List<CategoryModel>> listenToCategories(String uId) {
    return xafeFireStoreService
        .listenToInnerCollection(
          collectionName: 'users',
          docId: FirebaseAuth.instance.currentUser.uid,
          innerCollectionName: 'categories',
        )
        .map(
          (snapshot) => snapshot.docs
              .map(
                (docSnapshot) => CategoryModel.fromJson(
                  docSnapshot.data(),
                ),
              )
              .toList(),
        );
  }

  @override
  Future<void> deleteCategory(String categoryId) {
    final response = xafeFireStoreService.deleteInnerDocument(
      docId: FirebaseAuth.instance.currentUser.uid,
      collectionName: 'users',
      innerCollectionName: 'categories',
      innerDocId: categoryId,
    );
    return response;
  }
}
