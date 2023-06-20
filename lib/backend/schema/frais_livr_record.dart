import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FraisLivrRecord extends FirestoreRecord {
  FraisLivrRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fraisParKilo" field.
  int? _fraisParKilo;
  int get fraisParKilo => _fraisParKilo ?? 0;
  bool hasFraisParKilo() => _fraisParKilo != null;

  // "min" field.
  int? _min;
  int get min => _min ?? 0;
  bool hasMin() => _min != null;

  void _initializeFields() {
    _fraisParKilo = snapshotData['fraisParKilo'] as int?;
    _min = snapshotData['min'] as int?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('fraisLivr');

  static Stream<FraisLivrRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FraisLivrRecord.fromSnapshot(s));

  static Future<FraisLivrRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FraisLivrRecord.fromSnapshot(s));

  static FraisLivrRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FraisLivrRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FraisLivrRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FraisLivrRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FraisLivrRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createFraisLivrRecordData({
  int? fraisParKilo,
  int? min,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fraisParKilo': fraisParKilo,
      'min': min,
    }.withoutNulls,
  );

  return firestoreData;
}
