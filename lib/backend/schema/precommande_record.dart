import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PrecommandeRecord extends FirestoreRecord {
  PrecommandeRecord._(
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

  // "aboLivre" field.
  bool? _aboLivre;
  bool get aboLivre => _aboLivre ?? false;
  bool hasAboLivre() => _aboLivre != null;

  // "positionClient" field.
  LatLng? _positionClient;
  LatLng? get positionClient => _positionClient;
  bool hasPositionClient() => _positionClient != null;

  // "positionLivreur" field.
  LatLng? _positionLivreur;
  LatLng? get positionLivreur => _positionLivreur;
  bool hasPositionLivreur() => _positionLivreur != null;

  // "jour" field.
  String? _jour;
  String get jour => _jour ?? '';
  bool hasJour() => _jour != null;

  // "lieu2" field.
  LatLng? _lieu2;
  LatLng? get lieu2 => _lieu2;
  bool hasLieu2() => _lieu2 != null;

  // "refride" field.
  DocumentReference? _refride;
  DocumentReference? get refride => _refride;
  bool hasRefride() => _refride != null;

  // "lan" field.
  List<LatLng>? _lan;
  List<LatLng> get lan => _lan ?? const [];
  bool hasLan() => _lan != null;

  // "refcliList" field.
  List<DocumentReference>? _refcliList;
  List<DocumentReference> get refcliList => _refcliList ?? const [];
  bool hasRefcliList() => _refcliList != null;

  // "num" field.
  String? _num;
  String get num => _num ?? '';
  bool hasNum() => _num != null;

  // "clienCoordonn" field.
  bool? _clienCoordonn;
  bool get clienCoordonn => _clienCoordonn ?? false;
  bool hasClienCoordonn() => _clienCoordonn != null;

  // "indicationComm" field.
  String? _indicationComm;
  String get indicationComm => _indicationComm ?? '';
  bool hasIndicationComm() => _indicationComm != null;

  // "payezPlusTard" field.
  bool? _payezPlusTard;
  bool get payezPlusTard => _payezPlusTard ?? false;
  bool hasPayezPlusTard() => _payezPlusTard != null;

  // "bon" field.
  bool? _bon;
  bool get bon => _bon ?? false;
  bool hasBon() => _bon != null;

  // "ttc" field.
  int? _ttc;
  int get ttc => _ttc ?? 0;
  bool hasTtc() => _ttc != null;

  // "taxe" field.
  int? _taxe;
  int get taxe => _taxe ?? 0;
  bool hasTaxe() => _taxe != null;

  // "posRest" field.
  LatLng? _posRest;
  LatLng? get posRest => _posRest;
  bool hasPosRest() => _posRest != null;

  // "livrPai" field.
  bool? _livrPai;
  bool get livrPai => _livrPai ?? false;
  bool hasLivrPai() => _livrPai != null;

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
    _aboLivre = snapshotData['aboLivre'] as bool?;
    _positionClient = snapshotData['positionClient'] as LatLng?;
    _positionLivreur = snapshotData['positionLivreur'] as LatLng?;
    _jour = snapshotData['jour'] as String?;
    _lieu2 = snapshotData['lieu2'] as LatLng?;
    _refride = snapshotData['refride'] as DocumentReference?;
    _lan = getDataList(snapshotData['lan']);
    _refcliList = getDataList(snapshotData['refcliList']);
    _num = snapshotData['num'] as String?;
    _clienCoordonn = snapshotData['clienCoordonn'] as bool?;
    _indicationComm = snapshotData['indicationComm'] as String?;
    _payezPlusTard = snapshotData['payezPlusTard'] as bool?;
    _bon = snapshotData['bon'] as bool?;
    _ttc = snapshotData['ttc'] as int?;
    _taxe = snapshotData['taxe'] as int?;
    _posRest = snapshotData['posRest'] as LatLng?;
    _livrPai = snapshotData['livrPai'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('precommande');

  static Stream<PrecommandeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PrecommandeRecord.fromSnapshot(s));

  static Future<PrecommandeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PrecommandeRecord.fromSnapshot(s));

  static PrecommandeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PrecommandeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PrecommandeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PrecommandeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PrecommandeRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createPrecommandeRecordData({
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
  bool? aboLivre,
  LatLng? positionClient,
  LatLng? positionLivreur,
  String? jour,
  LatLng? lieu2,
  DocumentReference? refride,
  String? num,
  bool? clienCoordonn,
  String? indicationComm,
  bool? payezPlusTard,
  bool? bon,
  int? ttc,
  int? taxe,
  LatLng? posRest,
  bool? livrPai,
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
      'aboLivre': aboLivre,
      'positionClient': positionClient,
      'positionLivreur': positionLivreur,
      'jour': jour,
      'lieu2': lieu2,
      'refride': refride,
      'num': num,
      'clienCoordonn': clienCoordonn,
      'indicationComm': indicationComm,
      'payezPlusTard': payezPlusTard,
      'bon': bon,
      'ttc': ttc,
      'taxe': taxe,
      'posRest': posRest,
      'livrPai': livrPai,
    }.withoutNulls,
  );

  return firestoreData;
}
