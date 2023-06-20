import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaiementRappRecord extends FirestoreRecord {
  PaiementRappRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "prenom" field.
  String? _prenom;
  String get prenom => _prenom ?? '';
  bool hasPrenom() => _prenom != null;

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  // "nomProduit" field.
  String? _nomProduit;
  String get nomProduit => _nomProduit ?? '';
  bool hasNomProduit() => _nomProduit != null;

  // "montant" field.
  double? _montant;
  double get montant => _montant ?? 0.0;
  bool hasMontant() => _montant != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "tel" field.
  String? _tel;
  String get tel => _tel ?? '';
  bool hasTel() => _tel != null;

  // "reseau" field.
  String? _reseau;
  String get reseau => _reseau ?? '';
  bool hasReseau() => _reseau != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "lien" field.
  String? _lien;
  String get lien => _lien ?? '';
  bool hasLien() => _lien != null;

  void _initializeFields() {
    _prenom = snapshotData['prenom'] as String?;
    _nom = snapshotData['nom'] as String?;
    _nomProduit = snapshotData['nomProduit'] as String?;
    _montant = castToType<double>(snapshotData['montant']);
    _email = snapshotData['email'] as String?;
    _tel = snapshotData['tel'] as String?;
    _reseau = snapshotData['reseau'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _lien = snapshotData['lien'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PaiementRapp');

  static Stream<PaiementRappRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaiementRappRecord.fromSnapshot(s));

  static Future<PaiementRappRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaiementRappRecord.fromSnapshot(s));

  static PaiementRappRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaiementRappRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaiementRappRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaiementRappRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaiementRappRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createPaiementRappRecordData({
  String? prenom,
  String? nom,
  String? nomProduit,
  double? montant,
  String? email,
  String? tel,
  String? reseau,
  DateTime? time,
  String? lien,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'prenom': prenom,
      'nom': nom,
      'nomProduit': nomProduit,
      'montant': montant,
      'email': email,
      'tel': tel,
      'reseau': reseau,
      'time': time,
      'lien': lien,
    }.withoutNulls,
  );

  return firestoreData;
}
