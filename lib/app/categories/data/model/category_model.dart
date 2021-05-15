import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  CategoryModel({
    this.categoryName,
    this.categoryEmoji,
    this.categoryId,
    this.categoryTimestamp,
  });

  CategoryModel.fromJson(Map<String, dynamic> data)
      : categoryName = data['category_name'],
        categoryEmoji = data['category_emoji'],
        categoryTimestamp = data['category_timestamp'],
        categoryId = data['category_id'];
  final String categoryName;
  final String categoryEmoji;
  final String categoryId;
  final Timestamp categoryTimestamp;

  Map<String, dynamic> toJson() {
    return {
      'category_name': categoryName,
      'category_emoji': categoryEmoji,
      'category_id': categoryId,
      'category_timestamp': DateTime.now()
    };
  }
}
