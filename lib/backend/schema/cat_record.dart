import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CatRecord extends FirestoreRecord {
  CatRecord._(
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

  // "prio" field.
  int? _prio;
  int get prio => _prio ?? 0;
  bool hasPrio() => _prio != null;

  void _initializeFields() {
    _nom = snapshotData['nom'] as String?;
    _img = snapshotData['img'] as String?;
    _nbr = snapshotData['nbr'] as int?;
    _prio = snapshotData['prio'] as int?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cat');

  static Stream<CatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CatRecord.fromSnapshot(s));

  static Future<CatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CatRecord.fromSnapshot(s));

  static CatRecord fromSnapshot(DocumentSnapshot snapshot) => CatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CatRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createCatRecordData({
  String? nom,
  String? img,
  int? nbr,
  int? prio,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nom': nom,
      'img': img,
      'nbr': nbr,
      'prio': prio,
    }.withoutNulls,
  );

  return firestoreData;
}
