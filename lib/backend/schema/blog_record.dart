import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BlogRecord extends FirestoreRecord {
  BlogRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titre" field.
  String? _titre;
  String get titre => _titre ?? '';
  bool hasTitre() => _titre != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "call" field.
  String? _call;
  String get call => _call ?? '';
  bool hasCall() => _call != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "descr" field.
  String? _descr;
  String get descr => _descr ?? '';
  bool hasDescr() => _descr != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  void _initializeFields() {
    _titre = snapshotData['titre'] as String?;
    _title = snapshotData['title'] as String?;
    _call = snapshotData['call'] as String?;
    _img = snapshotData['img'] as String?;
    _descr = snapshotData['descr'] as String?;
    _code = snapshotData['code'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('blog');

  static Stream<BlogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BlogRecord.fromSnapshot(s));

  static Future<BlogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BlogRecord.fromSnapshot(s));

  static BlogRecord fromSnapshot(DocumentSnapshot snapshot) => BlogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BlogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BlogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BlogRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createBlogRecordData({
  String? titre,
  String? title,
  String? call,
  String? img,
  String? descr,
  String? code,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titre': titre,
      'title': title,
      'call': call,
      'img': img,
      'descr': descr,
      'code': code,
    }.withoutNulls,
  );

  return firestoreData;
}
