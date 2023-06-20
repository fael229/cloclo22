import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpecificationRecord extends FirestoreRecord {
  SpecificationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nom = snapshotData['nom'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('specification')
          : FirebaseFirestore.instance.collectionGroup('specification');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('specification').doc();

  static Stream<SpecificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SpecificationRecord.fromSnapshot(s));

  static Future<SpecificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SpecificationRecord.fromSnapshot(s));

  static SpecificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SpecificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SpecificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SpecificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SpecificationRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createSpecificationRecordData({
  String? nom,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nom': nom,
    }.withoutNulls,
  );

  return firestoreData;
}
