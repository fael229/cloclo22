import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartRecord extends FirestoreRecord {
  CartRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  // "qty" field.
  int? _qty;
  int get qty => _qty ?? 0;
  bool hasQty() => _qty != null;

  // "des" field.
  String? _des;
  String get des => _des ?? '';
  bool hasDes() => _des != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "cat" field.
  String? _cat;
  String get cat => _cat ?? '';
  bool hasCat() => _cat != null;

  // "cod" field.
  int? _cod;
  int get cod => _cod ?? 0;
  bool hasCod() => _cod != null;

  // "prix" field.
  int? _prix;
  int get prix => _prix ?? 0;
  bool hasPrix() => _prix != null;

  void _initializeFields() {
    _nom = snapshotData['nom'] as String?;
    _qty = snapshotData['qty'] as int?;
    _des = snapshotData['des'] as String?;
    _id = snapshotData['id'] as String?;
    _img = snapshotData['img'] as String?;
    _cat = snapshotData['cat'] as String?;
    _cod = snapshotData['cod'] as int?;
    _prix = snapshotData['prix'] as int?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cart');

  static Stream<CartRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartRecord.fromSnapshot(s));

  static Future<CartRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartRecord.fromSnapshot(s));

  static CartRecord fromSnapshot(DocumentSnapshot snapshot) => CartRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createCartRecordData({
  String? nom,
  int? qty,
  String? des,
  String? id,
  String? img,
  String? cat,
  int? cod,
  int? prix,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nom': nom,
      'qty': qty,
      'des': des,
      'id': id,
      'img': img,
      'cat': cat,
      'cod': cod,
      'prix': prix,
    }.withoutNulls,
  );

  return firestoreData;
}
