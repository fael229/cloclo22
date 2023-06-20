import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PanierRecord extends FirestoreRecord {
  PanierRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "prodRef" field.
  DocumentReference? _prodRef;
  DocumentReference? get prodRef => _prodRef;
  bool hasProdRef() => _prodRef != null;

  // "qty" field.
  int? _qty;
  int get qty => _qty ?? 0;
  bool hasQty() => _qty != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "client" field.
  String? _client;
  String get client => _client ?? '';
  bool hasClient() => _client != null;

  // "ref" field.
  DocumentReference? _ref;
  DocumentReference? get ref => _ref;
  bool hasRef() => _ref != null;

  // "mt" field.
  int? _mt;
  int get mt => _mt ?? 0;
  bool hasMt() => _mt != null;

  // "jour" field.
  String? _jour;
  String get jour => _jour ?? '';
  bool hasJour() => _jour != null;

  // "heure" field.
  DateTime? _heure;
  DateTime? get heure => _heure;
  bool hasHeure() => _heure != null;

  // "lieu" field.
  String? _lieu;
  String get lieu => _lieu ?? '';
  bool hasLieu() => _lieu != null;

  // "abo" field.
  bool? _abo;
  bool get abo => _abo ?? false;
  bool hasAbo() => _abo != null;

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "resto" field.
  String? _resto;
  String get resto => _resto ?? '';
  bool hasResto() => _resto != null;

  // "adress" field.
  String? _adress;
  String get adress => _adress ?? '';
  bool hasAdress() => _adress != null;

  // "num" field.
  String? _num;
  String get num => _num ?? '';
  bool hasNum() => _num != null;

  // "pret" field.
  bool? _pret;
  bool get pret => _pret ?? false;
  bool hasPret() => _pret != null;

  // "pay" field.
  bool? _pay;
  bool get pay => _pay ?? false;
  bool hasPay() => _pay != null;

  // "indic" field.
  String? _indic;
  String get indic => _indic ?? '';
  bool hasIndic() => _indic != null;

  // "prixperso" field.
  int? _prixperso;
  int get prixperso => _prixperso ?? 0;
  bool hasPrixperso() => _prixperso != null;

  // "payDate" field.
  DateTime? _payDate;
  DateTime? get payDate => _payDate;
  bool hasPayDate() => _payDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _prodRef = snapshotData['prodRef'] as DocumentReference?;
    _qty = snapshotData['qty'] as int?;
    _type = snapshotData['type'] as String?;
    _client = snapshotData['client'] as String?;
    _ref = snapshotData['ref'] as DocumentReference?;
    _mt = snapshotData['mt'] as int?;
    _jour = snapshotData['jour'] as String?;
    _heure = snapshotData['heure'] as DateTime?;
    _lieu = snapshotData['lieu'] as String?;
    _abo = snapshotData['abo'] as bool?;
    _nom = snapshotData['nom'] as String?;
    _id = snapshotData['id'] as String?;
    _resto = snapshotData['resto'] as String?;
    _adress = snapshotData['adress'] as String?;
    _num = snapshotData['num'] as String?;
    _pret = snapshotData['pret'] as bool?;
    _pay = snapshotData['pay'] as bool?;
    _indic = snapshotData['indic'] as String?;
    _prixperso = snapshotData['prixperso'] as int?;
    _payDate = snapshotData['payDate'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('panier')
          : FirebaseFirestore.instance.collectionGroup('panier');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('panier').doc();

  static Stream<PanierRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PanierRecord.fromSnapshot(s));

  static Future<PanierRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PanierRecord.fromSnapshot(s));

  static PanierRecord fromSnapshot(DocumentSnapshot snapshot) => PanierRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PanierRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PanierRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PanierRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createPanierRecordData({
  DocumentReference? prodRef,
  int? qty,
  String? type,
  String? client,
  DocumentReference? ref,
  int? mt,
  String? jour,
  DateTime? heure,
  String? lieu,
  bool? abo,
  String? nom,
  String? id,
  String? resto,
  String? adress,
  String? num,
  bool? pret,
  bool? pay,
  String? indic,
  int? prixperso,
  DateTime? payDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'prodRef': prodRef,
      'qty': qty,
      'type': type,
      'client': client,
      'ref': ref,
      'mt': mt,
      'jour': jour,
      'heure': heure,
      'lieu': lieu,
      'abo': abo,
      'nom': nom,
      'id': id,
      'resto': resto,
      'adress': adress,
      'num': num,
      'pret': pret,
      'pay': pay,
      'indic': indic,
      'prixperso': prixperso,
      'payDate': payDate,
    }.withoutNulls,
  );

  return firestoreData;
}
