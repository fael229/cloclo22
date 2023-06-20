import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LivreurRecord extends FirestoreRecord {
  LivreurRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  // "tot" field.
  int? _tot;
  int get tot => _tot ?? 0;
  bool hasTot() => _tot != null;

  // "paye" field.
  bool? _paye;
  bool get paye => _paye ?? false;
  bool hasPaye() => _paye != null;

  void _initializeFields() {
    _nom = snapshotData['nom'] as String?;
    _tot = snapshotData['tot'] as int?;
    _paye = snapshotData['paye'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('livreur');

  static Stream<LivreurRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LivreurRecord.fromSnapshot(s));

  static Future<LivreurRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LivreurRecord.fromSnapshot(s));

  static LivreurRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LivreurRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LivreurRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LivreurRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LivreurRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createLivreurRecordData({
  String? nom,
  int? tot,
  bool? paye,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nom': nom,
      'tot': tot,
      'paye': paye,
    }.withoutNulls,
  );

  return firestoreData;
}
