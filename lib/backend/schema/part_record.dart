import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PartRecord extends FirestoreRecord {
  PartRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nom = snapshotData['nom'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('part')
          : FirebaseFirestore.instance.collectionGroup('part');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('part').doc();

  static Stream<PartRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PartRecord.fromSnapshot(s));

  static Future<PartRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PartRecord.fromSnapshot(s));

  static PartRecord fromSnapshot(DocumentSnapshot snapshot) => PartRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PartRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PartRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PartRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createPartRecordData({
  String? nom,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nom': nom,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}
