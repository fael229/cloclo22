import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AboJourRecord extends FirestoreRecord {
  AboJourRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "listecom" field.
  List<DocumentReference>? _listecom;
  List<DocumentReference> get listecom => _listecom ?? const [];
  bool hasListecom() => _listecom != null;

  // "refcli" field.
  DocumentReference? _refcli;
  DocumentReference? get refcli => _refcli;
  bool hasRefcli() => _refcli != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  // "statut" field.
  String? _statut;
  String get statut => _statut ?? '';
  bool hasStatut() => _statut != null;

  // "livrer" field.
  bool? _livrer;
  bool get livrer => _livrer ?? false;
  bool hasLivrer() => _livrer != null;

  // "dateAjout" field.
  DateTime? _dateAjout;
  DateTime? get dateAjout => _dateAjout;
  bool hasDateAjout() => _dateAjout != null;

  // "datepay" field.
  DateTime? _datepay;
  DateTime? get datepay => _datepay;
  bool hasDatepay() => _datepay != null;

  // "lieu" field.
  String? _lieu;
  String get lieu => _lieu ?? '';
  bool hasLieu() => _lieu != null;

  // "livreur" field.
  DocumentReference? _livreur;
  DocumentReference? get livreur => _livreur;
  bool hasLivreur() => _livreur != null;

  // "e1" field.
  bool? _e1;
  bool get e1 => _e1 ?? false;
  bool hasE1() => _e1 != null;

  // "e2" field.
  bool? _e2;
  bool get e2 => _e2 ?? false;
  bool hasE2() => _e2 != null;

  // "e3" field.
  bool? _e3;
  bool get e3 => _e3 ?? false;
  bool hasE3() => _e3 != null;

  // "e4" field.
  bool? _e4;
  bool get e4 => _e4 ?? false;
  bool hasE4() => _e4 != null;

  // "e5" field.
  bool? _e5;
  bool get e5 => _e5 ?? false;
  bool hasE5() => _e5 != null;

  // "numero" field.
  String? _numero;
  String get numero => _numero ?? '';
  bool hasNumero() => _numero != null;

  // "indication" field.
  String? _indication;
  String get indication => _indication ?? '';
  bool hasIndication() => _indication != null;

  // "attribution" field.
  bool? _attribution;
  bool get attribution => _attribution ?? false;
  bool hasAttribution() => _attribution != null;

  // "signature" field.
  String? _signature;
  String get signature => _signature ?? '';
  bool hasSignature() => _signature != null;

  // "commandeSuiviRef" field.
  DocumentReference? _commandeSuiviRef;
  DocumentReference? get commandeSuiviRef => _commandeSuiviRef;
  bool hasCommandeSuiviRef() => _commandeSuiviRef != null;

  // "heurelivre" field.
  DateTime? _heurelivre;
  DateTime? get heurelivre => _heurelivre;
  bool hasHeurelivre() => _heurelivre != null;

  // "soustot" field.
  int? _soustot;
  int get soustot => _soustot ?? 0;
  bool hasSoustot() => _soustot != null;

  // "totalpaye" field.
  int? _totalpaye;
  int get totalpaye => _totalpaye ?? 0;
  bool hasTotalpaye() => _totalpaye != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _listecom = getDataList(snapshotData['listecom']);
    _refcli = snapshotData['refcli'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _nom = snapshotData['nom'] as String?;
    _statut = snapshotData['statut'] as String?;
    _livrer = snapshotData['livrer'] as bool?;
    _dateAjout = snapshotData['dateAjout'] as DateTime?;
    _datepay = snapshotData['datepay'] as DateTime?;
    _lieu = snapshotData['lieu'] as String?;
    _livreur = snapshotData['livreur'] as DocumentReference?;
    _e1 = snapshotData['e1'] as bool?;
    _e2 = snapshotData['e2'] as bool?;
    _e3 = snapshotData['e3'] as bool?;
    _e4 = snapshotData['e4'] as bool?;
    _e5 = snapshotData['e5'] as bool?;
    _numero = snapshotData['numero'] as String?;
    _indication = snapshotData['indication'] as String?;
    _attribution = snapshotData['attribution'] as bool?;
    _signature = snapshotData['signature'] as String?;
    _commandeSuiviRef = snapshotData['commandeSuiviRef'] as DocumentReference?;
    _heurelivre = snapshotData['heurelivre'] as DateTime?;
    _soustot = snapshotData['soustot'] as int?;
    _totalpaye = snapshotData['totalpaye'] as int?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('aboJour')
          : FirebaseFirestore.instance.collectionGroup('aboJour');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('aboJour').doc();

  static Stream<AboJourRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AboJourRecord.fromSnapshot(s));

  static Future<AboJourRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AboJourRecord.fromSnapshot(s));

  static AboJourRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AboJourRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AboJourRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AboJourRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AboJourRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createAboJourRecordData({
  DocumentReference? refcli,
  DateTime? date,
  String? nom,
  String? statut,
  bool? livrer,
  DateTime? dateAjout,
  DateTime? datepay,
  String? lieu,
  DocumentReference? livreur,
  bool? e1,
  bool? e2,
  bool? e3,
  bool? e4,
  bool? e5,
  String? numero,
  String? indication,
  bool? attribution,
  String? signature,
  DocumentReference? commandeSuiviRef,
  DateTime? heurelivre,
  int? soustot,
  int? totalpaye,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'refcli': refcli,
      'date': date,
      'nom': nom,
      'statut': statut,
      'livrer': livrer,
      'dateAjout': dateAjout,
      'datepay': datepay,
      'lieu': lieu,
      'livreur': livreur,
      'e1': e1,
      'e2': e2,
      'e3': e3,
      'e4': e4,
      'e5': e5,
      'numero': numero,
      'indication': indication,
      'attribution': attribution,
      'signature': signature,
      'commandeSuiviRef': commandeSuiviRef,
      'heurelivre': heurelivre,
      'soustot': soustot,
      'totalpaye': totalpaye,
    }.withoutNulls,
  );

  return firestoreData;
}
