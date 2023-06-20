import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvisRecord extends FirestoreRecord {
  AvisRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "pp" field.
  String? _pp;
  String get pp => _pp ?? '';
  bool hasPp() => _pp != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

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
    _pp = snapshotData['pp'] as String?;
    _comment = snapshotData['comment'] as String?;
    _nom = snapshotData['nom'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('avis')
          : FirebaseFirestore.instance.collectionGroup('avis');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('avis').doc();

  static Stream<AvisRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AvisRecord.fromSnapshot(s));

  static Future<AvisRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AvisRecord.fromSnapshot(s));

  static AvisRecord fromSnapshot(DocumentSnapshot snapshot) => AvisRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AvisRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AvisRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AvisRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createAvisRecordData({
  String? pp,
  String? comment,
  String? nom,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pp': pp,
      'comment': comment,
      'nom': nom,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}
