import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavorisRecord extends FirestoreRecord {
  FavorisRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "prix" field.
  int? _prix;
  int get prix => _prix ?? 0;
  bool hasPrix() => _prix != null;

  // "cat" field.
  String? _cat;
  String get cat => _cat ?? '';
  bool hasCat() => _cat != null;

  // "variab" field.
  String? _variab;
  String get variab => _variab ?? '';
  bool hasVariab() => _variab != null;

  void _initializeFields() {
    _nom = snapshotData['nom'] as String?;
    _image = snapshotData['image'] as String?;
    _prix = snapshotData['prix'] as int?;
    _cat = snapshotData['cat'] as String?;
    _variab = snapshotData['variab'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('favoris');

  static Stream<FavorisRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavorisRecord.fromSnapshot(s));

  static Future<FavorisRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavorisRecord.fromSnapshot(s));

  static FavorisRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FavorisRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavorisRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavorisRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavorisRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createFavorisRecordData({
  String? nom,
  String? image,
  int? prix,
  String? cat,
  String? variab,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nom': nom,
      'image': image,
      'prix': prix,
      'cat': cat,
      'variab': variab,
    }.withoutNulls,
  );

  return firestoreData;
}
