import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RestaurantsRecord extends FirestoreRecord {
  RestaurantsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  // "slogan" field.
  String? _slogan;
  String get slogan => _slogan ?? '';
  bool hasSlogan() => _slogan != null;

  // "plats" field.
  List<DocumentReference>? _plats;
  List<DocumentReference> get plats => _plats ?? const [];
  bool hasPlats() => _plats != null;

  // "platslist" field.
  List<String>? _platslist;
  List<String> get platslist => _platslist ?? const [];
  bool hasPlatslist() => _platslist != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "cover" field.
  String? _cover;
  String get cover => _cover ?? '';
  bool hasCover() => _cover != null;

  // "ouvClo" field.
  String? _ouvClo;
  String get ouvClo => _ouvClo ?? '';
  bool hasOuvClo() => _ouvClo != null;

  // "note" field.
  double? _note;
  double get note => _note ?? 0.0;
  bool hasNote() => _note != null;

  // "ouv" field.
  DateTime? _ouv;
  DateTime? get ouv => _ouv;
  bool hasOuv() => _ouv != null;

  // "clo" field.
  DateTime? _clo;
  DateTime? get clo => _clo;
  bool hasClo() => _clo != null;

  // "zone" field.
  String? _zone;
  String get zone => _zone ?? '';
  bool hasZone() => _zone != null;

  // "prio" field.
  int? _prio;
  int get prio => _prio ?? 0;
  bool hasPrio() => _prio != null;

  // "catego" field.
  List<String>? _catego;
  List<String> get catego => _catego ?? const [];
  bool hasCatego() => _catego != null;

  // "adresse" field.
  String? _adresse;
  String get adresse => _adresse ?? '';
  bool hasAdresse() => _adresse != null;

  // "ratelist" field.
  List<double>? _ratelist;
  List<double> get ratelist => _ratelist ?? const [];
  bool hasRatelist() => _ratelist != null;

  // "tel" field.
  String? _tel;
  String get tel => _tel ?? '';
  bool hasTel() => _tel != null;

  // "pos" field.
  LatLng? _pos;
  LatLng? get pos => _pos;
  bool hasPos() => _pos != null;

  // "jours" field.
  List<String>? _jours;
  List<String> get jours => _jours ?? const [];
  bool hasJours() => _jours != null;

  void _initializeFields() {
    _nom = snapshotData['nom'] as String?;
    _slogan = snapshotData['slogan'] as String?;
    _plats = getDataList(snapshotData['plats']);
    _platslist = getDataList(snapshotData['platslist']);
    _img = snapshotData['img'] as String?;
    _cover = snapshotData['cover'] as String?;
    _ouvClo = snapshotData['ouvClo'] as String?;
    _note = castToType<double>(snapshotData['note']);
    _ouv = snapshotData['ouv'] as DateTime?;
    _clo = snapshotData['clo'] as DateTime?;
    _zone = snapshotData['zone'] as String?;
    _prio = snapshotData['prio'] as int?;
    _catego = getDataList(snapshotData['catego']);
    _adresse = snapshotData['adresse'] as String?;
    _ratelist = getDataList(snapshotData['ratelist']);
    _tel = snapshotData['tel'] as String?;
    _pos = snapshotData['pos'] as LatLng?;
    _jours = getDataList(snapshotData['jours']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('restaurants');

  static Stream<RestaurantsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RestaurantsRecord.fromSnapshot(s));

  static Future<RestaurantsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RestaurantsRecord.fromSnapshot(s));

  static RestaurantsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RestaurantsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RestaurantsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RestaurantsRecord._(reference, mapFromFirestore(data));

  static RestaurantsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      RestaurantsRecord.getDocumentFromData(
        {
          'nom': snapshot.data['nom'],
          'slogan': snapshot.data['slogan'],
          'plats': safeGet(
            () => snapshot.data['plats'].map((s) => toRef(s)).toList(),
          ),
          'platslist': safeGet(
            () => snapshot.data['platslist'].toList(),
          ),
          'img': snapshot.data['img'],
          'cover': snapshot.data['cover'],
          'ouvClo': snapshot.data['ouvClo'],
          'note': snapshot.data['note']?.toDouble(),
          'ouv': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(snapshot.data['ouv']),
          ),
          'clo': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(snapshot.data['clo']),
          ),
          'zone': snapshot.data['zone'],
          'prio': snapshot.data['prio']?.round(),
          'catego': safeGet(
            () => snapshot.data['catego'].toList(),
          ),
          'adresse': snapshot.data['adresse'],
          'ratelist': safeGet(
            () => snapshot.data['ratelist']
                .map((d) => (d as num).toDouble())
                .toList(),
          ),
          'tel': snapshot.data['tel'],
          'pos': safeGet(
            () => LatLng(
              snapshot.data['_geoloc']['lat'],
              snapshot.data['_geoloc']['lng'],
            ),
          ),
          'jours': safeGet(
            () => snapshot.data['jours'].toList(),
          ),
        },
        RestaurantsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<RestaurantsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'restaurants',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'RestaurantsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createRestaurantsRecordData({
  String? nom,
  String? slogan,
  String? img,
  String? cover,
  String? ouvClo,
  double? note,
  DateTime? ouv,
  DateTime? clo,
  String? zone,
  int? prio,
  String? adresse,
  String? tel,
  LatLng? pos,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nom': nom,
      'slogan': slogan,
      'img': img,
      'cover': cover,
      'ouvClo': ouvClo,
      'note': note,
      'ouv': ouv,
      'clo': clo,
      'zone': zone,
      'prio': prio,
      'adresse': adresse,
      'tel': tel,
      'pos': pos,
    }.withoutNulls,
  );

  return firestoreData;
}
