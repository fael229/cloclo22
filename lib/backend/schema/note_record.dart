import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NoteRecord extends FirestoreRecord {
  NoteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "prodRef" field.
  DocumentReference? _prodRef;
  DocumentReference? get prodRef => _prodRef;
  bool hasProdRef() => _prodRef != null;

  // "rate" field.
  double? _rate;
  double get rate => _rate ?? 0.0;
  bool hasRate() => _rate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _prodRef = snapshotData['prodRef'] as DocumentReference?;
    _rate = castToType<double>(snapshotData['rate']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('note')
          : FirebaseFirestore.instance.collectionGroup('note');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('note').doc();

  static Stream<NoteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NoteRecord.fromSnapshot(s));

  static Future<NoteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NoteRecord.fromSnapshot(s));

  static NoteRecord fromSnapshot(DocumentSnapshot snapshot) => NoteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NoteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NoteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NoteRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createNoteRecordData({
  DocumentReference? prodRef,
  double? rate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'prodRef': prodRef,
      'rate': rate,
    }.withoutNulls,
  );

  return firestoreData;
}
