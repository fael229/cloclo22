import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommandesRecord extends FirestoreRecord {
  CommandesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  // "client" field.
  DocumentReference? _client;
  DocumentReference? get client => _client;
  bool hasClient() => _client != null;

  // "ref" field.
  DocumentReference? _ref;
  DocumentReference? get ref => _ref;
  bool hasRef() => _ref != null;

  // "paye" field.
  bool? _paye;
  bool get paye => _paye ?? false;
  bool hasPaye() => _paye != null;

  // "mt" field.
  int? _mt;
  int get mt => _mt ?? 0;
  bool hasMt() => _mt != null;

  // "livreur" field.
  DocumentReference? _livreur;
  DocumentReference? get livreur => _livreur;
  bool hasLivreur() => _livreur != null;

  // "livraison" field.
  bool? _livraison;
  bool get livraison => _livraison ?? false;
  bool hasLivraison() => _livraison != null;

  // "heurecommande" field.
  DateTime? _heurecommande;
  DateTime? get heurecommande => _heurecommande;
  bool hasHeurecommande() => _heurecommande != null;

  // "heurelivraison" field.
  DateTime? _heurelivraison;
  DateTime? get heurelivraison => _heurelivraison;
  bool hasHeurelivraison() => _heurelivraison != null;

  // "refRide" field.
  DocumentReference? _refRide;
  DocumentReference? get refRide => _refRide;
  bool hasRefRide() => _refRide != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nom = snapshotData['nom'] as String?;
    _client = snapshotData['client'] as DocumentReference?;
    _ref = snapshotData['ref'] as DocumentReference?;
    _paye = snapshotData['paye'] as bool?;
    _mt = snapshotData['mt'] as int?;
    _livreur = snapshotData['livreur'] as DocumentReference?;
    _livraison = snapshotData['livraison'] as bool?;
    _heurecommande = snapshotData['heurecommande'] as DateTime?;
    _heurelivraison = snapshotData['heurelivraison'] as DateTime?;
    _refRide = snapshotData['refRide'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Commandes')
          : FirebaseFirestore.instance.collectionGroup('Commandes');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Commandes').doc();

  static Stream<CommandesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommandesRecord.fromSnapshot(s));

  static Future<CommandesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommandesRecord.fromSnapshot(s));

  static CommandesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommandesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommandesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommandesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommandesRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createCommandesRecordData({
  String? nom,
  DocumentReference? client,
  DocumentReference? ref,
  bool? paye,
  int? mt,
  DocumentReference? livreur,
  bool? livraison,
  DateTime? heurecommande,
  DateTime? heurelivraison,
  DocumentReference? refRide,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nom': nom,
      'client': client,
      'ref': ref,
      'paye': paye,
      'mt': mt,
      'livreur': livreur,
      'livraison': livraison,
      'heurecommande': heurecommande,
      'heurelivraison': heurelivraison,
      'refRide': refRide,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}
