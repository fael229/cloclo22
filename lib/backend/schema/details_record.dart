import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DetailsRecord extends FirestoreRecord {
  DetailsRecord._(
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

  // "nbr" field.
  int? _nbr;
  int get nbr => _nbr ?? 0;
  bool hasNbr() => _nbr != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nom = snapshotData['nom'] as String?;
    _img = snapshotData['img'] as String?;
    _nbr = snapshotData['nbr'] as int?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Details')
          : FirebaseFirestore.instance.collectionGroup('Details');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Details').doc();

  static Stream<DetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DetailsRecord.fromSnapshot(s));

  static Future<DetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DetailsRecord.fromSnapshot(s));

  static DetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DetailsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createDetailsRecordData({
  String? nom,
  String? img,
  int? nbr,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nom': nom,
      'img': img,
      'nbr': nbr,
    }.withoutNulls,
  );

  return firestoreData;
}
