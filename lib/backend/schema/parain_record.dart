import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParainRecord extends FirestoreRecord {
  ParainRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  // "nbr" field.
  int? _nbr;
  int get nbr => _nbr ?? 0;
  bool hasNbr() => _nbr != null;

  void _initializeFields() {
    _nom = snapshotData['nom'] as String?;
    _nbr = snapshotData['nbr'] as int?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('parain');

  static Stream<ParainRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ParainRecord.fromSnapshot(s));

  static Future<ParainRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ParainRecord.fromSnapshot(s));

  static ParainRecord fromSnapshot(DocumentSnapshot snapshot) => ParainRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ParainRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ParainRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ParainRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createParainRecordData({
  String? nom,
  int? nbr,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nom': nom,
      'nbr': nbr,
    }.withoutNulls,
  );

  return firestoreData;
}
