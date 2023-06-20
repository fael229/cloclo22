import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SousSpeRecord extends FirestoreRecord {
  SousSpeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "refSpe" field.
  DocumentReference? _refSpe;
  DocumentReference? get refSpe => _refSpe;
  bool hasRefSpe() => _refSpe != null;

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  void _initializeFields() {
    _refSpe = snapshotData['refSpe'] as DocumentReference?;
    _nom = snapshotData['nom'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sous-spe');

  static Stream<SousSpeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SousSpeRecord.fromSnapshot(s));

  static Future<SousSpeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SousSpeRecord.fromSnapshot(s));

  static SousSpeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SousSpeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SousSpeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SousSpeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SousSpeRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createSousSpeRecordData({
  DocumentReference? refSpe,
  String? nom,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'refSpe': refSpe,
      'nom': nom,
    }.withoutNulls,
  );

  return firestoreData;
}
