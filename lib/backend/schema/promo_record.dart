import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromoRecord extends FirestoreRecord {
  PromoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  void _initializeFields() {
    _nom = snapshotData['nom'] as String?;
    _img = snapshotData['img'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('promo');

  static Stream<PromoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromoRecord.fromSnapshot(s));

  static Future<PromoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromoRecord.fromSnapshot(s));

  static PromoRecord fromSnapshot(DocumentSnapshot snapshot) => PromoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromoRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createPromoRecordData({
  String? nom,
  String? img,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nom': nom,
      'img': img,
    }.withoutNulls,
  );

  return firestoreData;
}
