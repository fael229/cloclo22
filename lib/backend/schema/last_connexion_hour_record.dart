import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LastConnexionHourRecord extends FirestoreRecord {
  LastConnexionHourRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "last" field.
  DateTime? _last;
  DateTime? get last => _last;
  bool hasLast() => _last != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  void _initializeFields() {
    _last = snapshotData['last'] as DateTime?;
    _name = snapshotData['name'] as String?;
    _email = snapshotData['email'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lastConnexionHour');

  static Stream<LastConnexionHourRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LastConnexionHourRecord.fromSnapshot(s));

  static Future<LastConnexionHourRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => LastConnexionHourRecord.fromSnapshot(s));

  static LastConnexionHourRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LastConnexionHourRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LastConnexionHourRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LastConnexionHourRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LastConnexionHourRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createLastConnexionHourRecordData({
  DateTime? last,
  String? name,
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'last': last,
      'name': name,
      'email': email,
    }.withoutNulls,
  );

  return firestoreData;
}
