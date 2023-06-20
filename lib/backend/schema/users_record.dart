import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "admin" field.
  bool? _admin;
  bool get admin => _admin ?? false;
  bool hasAdmin() => _admin != null;

  // "livreur" field.
  bool? _livreur;
  bool get livreur => _livreur ?? false;
  bool hasLivreur() => _livreur != null;

  // "client" field.
  bool? _client;
  bool get client => _client ?? false;
  bool hasClient() => _client != null;

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  // "prenom" field.
  String? _prenom;
  String get prenom => _prenom ?? '';
  bool hasPrenom() => _prenom != null;

  // "localisation" field.
  String? _localisation;
  String get localisation => _localisation ?? '';
  bool hasLocalisation() => _localisation != null;

  // "localisation2" field.
  String? _localisation2;
  String get localisation2 => _localisation2 ?? '';
  bool hasLocalisation2() => _localisation2 != null;

  // "localisation3" field.
  String? _localisation3;
  String get localisation3 => _localisation3 ?? '';
  bool hasLocalisation3() => _localisation3 != null;

  // "nbreJour" field.
  List<String>? _nbreJour;
  List<String> get nbreJour => _nbreJour ?? const [];
  bool hasNbreJour() => _nbreJour != null;

  // "abonnLivraison" field.
  bool? _abonnLivraison;
  bool get abonnLivraison => _abonnLivraison ?? false;
  bool hasAbonnLivraison() => _abonnLivraison != null;

  // "debutAbo" field.
  DateTime? _debutAbo;
  DateTime? get debutAbo => _debutAbo;
  bool hasDebutAbo() => _debutAbo != null;

  // "reseau" field.
  String? _reseau;
  String get reseau => _reseau ?? '';
  bool hasReseau() => _reseau != null;

  // "last" field.
  DocumentReference? _last;
  DocumentReference? get last => _last;
  bool hasLast() => _last != null;

  // "pos" field.
  LatLng? _pos;
  LatLng? get pos => _pos;
  bool hasPos() => _pos != null;

  // "approuv" field.
  bool? _approuv;
  bool get approuv => _approuv ?? false;
  bool hasApprouv() => _approuv != null;

  // "restaurant" field.
  bool? _restaurant;
  bool get restaurant => _restaurant ?? false;
  bool hasRestaurant() => _restaurant != null;

  // "refresto" field.
  DocumentReference? _refresto;
  DocumentReference? get refresto => _refresto;
  bool hasRefresto() => _refresto != null;

  // "parain" field.
  bool? _parain;
  bool get parain => _parain ?? false;
  bool hasParain() => _parain != null;

  // "parainNom" field.
  String? _parainNom;
  String get parainNom => _parainNom ?? '';
  bool hasParainNom() => _parainNom != null;

  // "parainer" field.
  bool? _parainer;
  bool get parainer => _parainer ?? false;
  bool hasParainer() => _parainer != null;

  // "parainerPar" field.
  String? _parainerPar;
  String get parainerPar => _parainerPar ?? '';
  bool hasParainerPar() => _parainerPar != null;

  // "nomRest" field.
  String? _nomRest;
  String get nomRest => _nomRest ?? '';
  bool hasNomRest() => _nomRest != null;

  // "refDette" field.
  DocumentReference? _refDette;
  DocumentReference? get refDette => _refDette;
  bool hasRefDette() => _refDette != null;

  // "endete" field.
  bool? _endete;
  bool get endete => _endete ?? false;
  bool hasEndete() => _endete != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _admin = snapshotData['admin'] as bool?;
    _livreur = snapshotData['livreur'] as bool?;
    _client = snapshotData['client'] as bool?;
    _nom = snapshotData['nom'] as String?;
    _prenom = snapshotData['prenom'] as String?;
    _localisation = snapshotData['localisation'] as String?;
    _localisation2 = snapshotData['localisation2'] as String?;
    _localisation3 = snapshotData['localisation3'] as String?;
    _nbreJour = getDataList(snapshotData['nbreJour']);
    _abonnLivraison = snapshotData['abonnLivraison'] as bool?;
    _debutAbo = snapshotData['debutAbo'] as DateTime?;
    _reseau = snapshotData['reseau'] as String?;
    _last = snapshotData['last'] as DocumentReference?;
    _pos = snapshotData['pos'] as LatLng?;
    _approuv = snapshotData['approuv'] as bool?;
    _restaurant = snapshotData['restaurant'] as bool?;
    _refresto = snapshotData['refresto'] as DocumentReference?;
    _parain = snapshotData['parain'] as bool?;
    _parainNom = snapshotData['parainNom'] as String?;
    _parainer = snapshotData['parainer'] as bool?;
    _parainerPar = snapshotData['parainerPar'] as String?;
    _nomRest = snapshotData['nomRest'] as String?;
    _refDette = snapshotData['refDette'] as DocumentReference?;
    _endete = snapshotData['endete'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? admin,
  bool? livreur,
  bool? client,
  String? nom,
  String? prenom,
  String? localisation,
  String? localisation2,
  String? localisation3,
  bool? abonnLivraison,
  DateTime? debutAbo,
  String? reseau,
  DocumentReference? last,
  LatLng? pos,
  bool? approuv,
  bool? restaurant,
  DocumentReference? refresto,
  bool? parain,
  String? parainNom,
  bool? parainer,
  String? parainerPar,
  String? nomRest,
  DocumentReference? refDette,
  bool? endete,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'admin': admin,
      'livreur': livreur,
      'client': client,
      'nom': nom,
      'prenom': prenom,
      'localisation': localisation,
      'localisation2': localisation2,
      'localisation3': localisation3,
      'abonnLivraison': abonnLivraison,
      'debutAbo': debutAbo,
      'reseau': reseau,
      'last': last,
      'pos': pos,
      'approuv': approuv,
      'restaurant': restaurant,
      'refresto': refresto,
      'parain': parain,
      'parainNom': parainNom,
      'parainer': parainer,
      'parainerPar': parainerPar,
      'nomRest': nomRest,
      'refDette': refDette,
      'endete': endete,
    }.withoutNulls,
  );

  return firestoreData;
}
