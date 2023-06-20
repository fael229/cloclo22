import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FraisLivraisonRecord extends FirestoreRecord {
  FraisLivraisonRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nom" field.
  int? _nom;
  int get nom => _nom ?? 0;
  bool hasNom() => _nom != null;

  // "abonnement" field.
  int? _abonnement;
  int get abonnement => _abonnement ?? 0;
  bool hasAbonnement() => _abonnement != null;

  void _initializeFields() {
    _nom = snapshotData['nom'] as int?;
    _abonnement = snapshotData['abonnement'] as int?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('fraisLivraison');

  static Stream<FraisLivraisonRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FraisLivraisonRecord.fromSnapshot(s));

  static Future<FraisLivraisonRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FraisLivraisonRecord.fromSnapshot(s));

  static FraisLivraisonRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FraisLivraisonRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FraisLivraisonRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FraisLivraisonRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FraisLivraisonRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createFraisLivraisonRecordData({
  int? nom,
  int? abonnement,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nom': nom,
      'abonnement': abonnement,
    }.withoutNulls,
  );

  return firestoreData;
}
