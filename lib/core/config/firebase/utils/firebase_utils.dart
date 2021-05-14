import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class XafeFirestoreUtils {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  FirebaseFirestore get instance => _instance;

  Query xafeQueryCollection({
    String collectionName,
  }) =>
      _instance.collection(collectionName);

  Query xafeQueryInnerCollection({
    String collectionName,
    String docid,
    String innerCollectionName,
  }) =>
      _instance
          .collection(collectionName)
          .doc(docid)
          .collection(innerCollectionName);

  Query xafeQueryDeepInnerCollection({
    String collectionName,
    String docid,
    String innerCollectionName,
    String deepInnerCollectionName,
    String innerDocId,
  }) =>
      _instance
          .collection(collectionName)
          .doc(docid)
          .collection(innerCollectionName)
          .doc(innerDocId)
          .collection(deepInnerCollectionName);

  CollectionReference xafeCollectionRef({
    String collectionPath,
  }) =>
      _instance.collection(collectionPath);

  DocumentReference xafeDocumentRef({
    String collectionPath,
    String documentPath,
  }) =>
      xafeCollectionRef(collectionPath: collectionPath).doc(documentPath);

  Stream xafeCollectionStream({
    String collectionName,
  }) =>
      xafeCollectionRef(collectionPath: collectionName).snapshots();

  Stream documentStream({
    String collectionName,
    String documnetId,
  }) =>
      xafeDocumentRef(
        collectionPath: collectionName,
      ).snapshots();
}
