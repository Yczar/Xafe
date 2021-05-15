import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xafe/core/config/firebase/utils/firebase_utils.dart';
import 'package:xafe/core/error/helpers/helpers.dart';

class XafeFireStoreService with XafeFirestoreUtils {
  Future<QuerySnapshot> queryCOllection({
    String collectionName,
  }) async {
    return await firebaseInterceptor(
        () => xafeQueryCollection(collectionName: collectionName).get());
  }

  Stream<QuerySnapshot> listenToComparedCollection({
    String collectionName,
    String comparedField,
    String field,
  }) =>
      xafeCollectionRef(collectionPath: collectionName)
          .where(
            field,
            isEqualTo: comparedField,
          )
          .snapshots();

  Stream<QuerySnapshot> listenToCollection({
    String collectionName,
  }) =>
      xafeCollectionRef(collectionPath: collectionName).snapshots();

  Stream<DocumentSnapshot> listenToDocument(
          {String collectionName, String docId}) =>
      xafeDocumentRef(collectionPath: collectionName, documentPath: docId)
          .snapshots();

  Stream<QuerySnapshot> listenToInnerCollection({
    String collectionName,
    String docId,
    String innerCollectionName,
  }) =>
      xafeCollectionRef(collectionPath: collectionName)
          .doc(docId)
          .collection(innerCollectionName)
          .snapshots();

  Stream<QuerySnapshot> listenToDeeperInnerCollection({
    String collectionName,
    String docId,
    String innerDocId,
    String deeperInnerCollection,
    String innerCollectionName,
  }) =>
      xafeCollectionRef(collectionPath: collectionName)
          .doc(docId)
          .collection(innerCollectionName)
          .doc(innerDocId)
          .collection(deeperInnerCollection)
          .snapshots();

  Future<QuerySnapshot> whereQueryCollection({
    String collectionName,
    dynamic comparedField,
    String field,
  }) async {
    return await firebaseInterceptor(
        () => xafeQueryCollection(collectionName: collectionName)
            .where(
              field,
              isEqualTo: comparedField,
            )
            .get());
  }
Future<QuerySnapshot> whereQueryTwiceCollection({
    String collectionName,
    dynamic comparedField,
    dynamic secondComparedField,
    String field,
    String secondField,
  }) async {
    return await firebaseInterceptor(
        () => xafeQueryCollection(collectionName: collectionName)
            .where(
              field,
              isEqualTo: comparedField,
            ).where(secondField, isEqualTo: secondComparedField)
            .get());
  }

  Future<QuerySnapshot> queryInnerCOllection(
      {String collectionName, String innerCollectionName, String docId}) async {
    return await firebaseInterceptor(() => xafeQueryInnerCollection(
          collectionName: collectionName,
          docid: docId,
          innerCollectionName: innerCollectionName,
        ).get());
  }

  Future<QuerySnapshot> queryOrderedInnerCOllection({
    String collectionName,
    String innerCollectionName,
    String docId,
    String orderBy,
  }) async {
    return await firebaseInterceptor(() => xafeQueryInnerCollection(
          collectionName: collectionName,
          docid: docId,
          innerCollectionName: innerCollectionName,
        )
            .orderBy(
              orderBy,
              descending: true,
            )
            .get());
  }

  Future<QuerySnapshot> queryDeepInnerCollection({
    String collectionName,
    String innerCollectionName,
    String docId,
    String innerDocId,
    String deepInnerCollection,
  }) async {
    return await firebaseInterceptor(() => xafeQueryDeepInnerCollection(
          collectionName: collectionName,
          docid: docId,
          innerCollectionName: innerCollectionName,
          innerDocId: innerDocId,
          deepInnerCollectionName: deepInnerCollection,
        ).get());
  }

  Future<void> createDocument({
    String collectionName,
    String docId,
    Map<String, dynamic> data,
  }) async {
    return await firebaseInterceptor(() =>
        xafeCollectionRef(collectionPath: collectionName)
            .doc(docId)
            .set(data));
  }

  Future<void> createInnerDocument({
    String collectionName,
    String docId,
    Map<String, dynamic> data,
    String innerDocId,
    String innerCollectionName,
  }) async {
    return await firebaseInterceptor(() =>
        xafeCollectionRef(collectionPath: collectionName)
            .doc(docId)
            .collection(innerCollectionName)
            .doc(innerDocId)
            .set(data));
  }

  Future<void> createDeepInnerDocument({
    String collectionName,
    String docId,
    Map<String, dynamic> data,
    String innerDocId,
    String innerCollectionName,
    String deepCollectionName,
    String deepDocId,
  }) async {
    return await firebaseInterceptor(() =>
        xafeCollectionRef(collectionPath: collectionName)
            .doc(docId)
            .collection(innerCollectionName)
            .doc(innerDocId)
            .collection(deepCollectionName)
            .doc(deepDocId)
            .set(data));
  }

  Future<void> updateDeepInnerDocument({
    String collectionName,
    String docId,
    Map<String, dynamic> data,
    String innerDocId,
    String innerCollectionName,
    String deepCollectionName,
    String deepDocId,
  }) async {
    return await firebaseInterceptor(() =>
        xafeCollectionRef(collectionPath: collectionName)
            .doc(docId)
            .collection(innerCollectionName)
            .doc(innerDocId)
            .collection(deepCollectionName)
            .doc(deepDocId)
            .update(data));
  }

  Future<Map<String, dynamic>> getDocument({
    String collectionName,
    String docId,
  }) async {
    return await firebaseInterceptor(() async {
      final response =
          await xafeCollectionRef(collectionPath: collectionName)
              .doc(docId)
              .get();

      return response.data();
    });
  }

  Future<void> addDocument({
    String collectionName,
    Map<String, dynamic> data,
  }) async {
    return await firebaseInterceptor(
        () => xafeCollectionRef(collectionPath: collectionName).add(data));
  }

  Future<void> addInnerDocument({
    String collectionName,
    Map<String, dynamic> data,
    String innerCollectionName,
    String docid,
  }) async {
    return await firebaseInterceptor(() =>
        xafeCollectionRef(collectionPath: collectionName)
            .doc(docid)
            .collection(innerCollectionName)
            .add(data));
  }

  Future<void> updateDocument({
    String collectionName,
    String docId,
    Map<String, dynamic> data,
  }) async {
    return await firebaseInterceptor(
      () => xafeCollectionRef(collectionPath: collectionName)
          .doc(docId)
          .update(data),
    );
  }

  Future<void> updateInnerDocument({
    String collectionName,
    String innerCollectionName,
    String docId,
    String innerDocId,
    Map<String, dynamic> data,
  }) async {
    return await firebaseInterceptor(
      () => xafeCollectionRef(collectionPath: collectionName)
          .doc(docId)
          .collection(innerCollectionName)
          .doc(innerDocId)
          .update(data),
    );
  }

  Future<void> deleteDocument({
    String collectionName,
    String docId,
  }) async {
    return await firebaseInterceptor(
      () => xafeCollectionRef(collectionPath: collectionName)
          .doc(docId)
          .delete(),
    );
  }
}
