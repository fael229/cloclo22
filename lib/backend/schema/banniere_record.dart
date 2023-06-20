import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BanniereRecord extends FirestoreRecord {
  BanniereRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "priorite" field.
  int? _priorite;
  int get priorite => _priorite ?? 0;
  bool hasPriorite() => _priorite != null;

  // "lien" field.
  DocumentReference? _lien;
  DocumentReference? get lien => _lien;
  bool hasLien() => _lien != null;

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  void _initializeFields() {
    _img = snapshotData['img'] as String?;
    _priorite = snapshotData['priorite'] as int?;
    _lien = snapshotData['lien'] as DocumentReference?;
    _nom = snapshotData['nom'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('banniere');

  static Stream<BanniereRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BanniereRecord.fromSnapshot(s));

  static Future<BanniereRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BanniereRecord.fromSnapshot(s));

  static BanniereRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BanniereRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BanniereRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BanniereRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BanniereRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createBanniereRecordData({
  String? img,
  int? priorite,
  DocumentReference? lien,
  String? nom,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'img': img,
      'priorite': priorite,
      'lien': lien,
      'nom': nom,
    }.withoutNulls,
  );

  return firestoreData;
}
