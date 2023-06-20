import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RefcliRecord extends FirestoreRecord {
  RefcliRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "lan" field.
  LatLng? _lan;
  LatLng? get lan => _lan;
  bool hasLan() => _lan != null;

  // "num" field.
  String? _num;
  String get num => _num ?? '';
  bool hasNum() => _num != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _lan = snapshotData['lan'] as LatLng?;
    _num = snapshotData['num'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('refcli')
          : FirebaseFirestore.instance.collectionGroup('refcli');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('refcli').doc();

  static Stream<RefcliRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RefcliRecord.fromSnapshot(s));

  static Future<RefcliRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RefcliRecord.fromSnapshot(s));

  static RefcliRecord fromSnapshot(DocumentSnapshot snapshot) => RefcliRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RefcliRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RefcliRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RefcliRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createRefcliRecordData({
  LatLng? lan,
  String? num,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lan': lan,
      'num': num,
    }.withoutNulls,
  );

  return firestoreData;
}
