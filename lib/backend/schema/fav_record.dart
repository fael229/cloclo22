import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavRecord extends FirestoreRecord {
  FavRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "ref" field.
  DocumentReference? _ref;
  DocumentReference? get ref => _ref;
  bool hasRef() => _ref != null;

  // "qty" field.
  int? _qty;
  int get qty => _qty ?? 0;
  bool hasQty() => _qty != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _ref = snapshotData['ref'] as DocumentReference?;
    _qty = snapshotData['qty'] as int?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('fav')
          : FirebaseFirestore.instance.collectionGroup('fav');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('fav').doc();

  static Stream<FavRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavRecord.fromSnapshot(s));

  static Future<FavRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavRecord.fromSnapshot(s));

  static FavRecord fromSnapshot(DocumentSnapshot snapshot) => FavRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createFavRecordData({
  DateTime? date,
  DocumentReference? ref,
  int? qty,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'ref': ref,
      'qty': qty,
    }.withoutNulls,
  );

  return firestoreData;
}
