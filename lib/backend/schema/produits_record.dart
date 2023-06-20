import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProduitsRecord extends FirestoreRecord {
  ProduitsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "created_by" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "prix" field.
  int? _prix;
  int get prix => _prix ?? 0;
  bool hasPrix() => _prix != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "fav" field.
  bool? _fav;
  bool get fav => _fav ?? false;
  bool hasFav() => _fav != null;

  // "cod" field.
  int? _cod;
  int get cod => _cod ?? 0;
  bool hasCod() => _cod != null;

  // "dispo" field.
  String? _dispo;
  String get dispo => _dispo ?? '';
  bool hasDispo() => _dispo != null;

  // "vue" field.
  int? _vue;
  int get vue => _vue ?? 0;
  bool hasVue() => _vue != null;

  // "favoris" field.
  List<String>? _favoris;
  List<String> get favoris => _favoris ?? const [];
  bool hasFavoris() => _favoris != null;

  // "nbreAvis" field.
  int? _nbreAvis;
  int get nbreAvis => _nbreAvis ?? 0;
  bool hasNbreAvis() => _nbreAvis != null;

  // "multi" field.
  bool? _multi;
  bool get multi => _multi ?? false;
  bool hasMulti() => _multi != null;

  // "prixDemi" field.
  int? _prixDemi;
  int get prixDemi => _prixDemi ?? 0;
  bool hasPrixDemi() => _prixDemi != null;

  // "prixComplet" field.
  int? _prixComplet;
  int get prixComplet => _prixComplet ?? 0;
  bool hasPrixComplet() => _prixComplet != null;

  // "ouv" field.
  DateTime? _ouv;
  DateTime? get ouv => _ouv;
  bool hasOuv() => _ouv != null;

  // "clo" field.
  DateTime? _clo;
  DateTime? get clo => _clo;
  bool hasClo() => _clo != null;

  // "defaut" field.
  bool? _defaut;
  bool get defaut => _defaut ?? false;
  bool hasDefaut() => _defaut != null;

  // "note" field.
  List<double>? _note;
  List<double> get note => _note ?? const [];
  bool hasNote() => _note != null;

  // "noteUser" field.
  List<String>? _noteUser;
  List<String> get noteUser => _noteUser ?? const [];
  bool hasNoteUser() => _noteUser != null;

  // "moyenne" field.
  double? _moyenne;
  double get moyenne => _moyenne ?? 0.0;
  bool hasMoyenne() => _moyenne != null;

  // "nbreFav" field.
  int? _nbreFav;
  int get nbreFav => _nbreFav ?? 0;
  bool hasNbreFav() => _nbreFav != null;

  // "nomDemi" field.
  String? _nomDemi;
  String get nomDemi => _nomDemi ?? '';
  bool hasNomDemi() => _nomDemi != null;

  // "nomComplet" field.
  String? _nomComplet;
  String get nomComplet => _nomComplet ?? '';
  bool hasNomComplet() => _nomComplet != null;

  // "pourcentage" field.
  int? _pourcentage;
  int get pourcentage => _pourcentage ?? 0;
  bool hasPourcentage() => _pourcentage != null;

  // "catList" field.
  List<String>? _catList;
  List<String> get catList => _catList ?? const [];
  bool hasCatList() => _catList != null;

  // "restaurant" field.
  String? _restaurant;
  String get restaurant => _restaurant ?? '';
  bool hasRestaurant() => _restaurant != null;

  // "prio" field.
  int? _prio;
  int get prio => _prio ?? 0;
  bool hasPrio() => _prio != null;

  // "disponible" field.
  bool? _disponible;
  bool get disponible => _disponible ?? false;
  bool hasDisponible() => _disponible != null;

  // "jours" field.
  List<String>? _jours;
  List<String> get jours => _jours ?? const [];
  bool hasJours() => _jours != null;

  void _initializeFields() {
    _nom = snapshotData['Nom'] as String?;
    _image = snapshotData['image'] as String?;
    _description = snapshotData['description'] as String?;
    _createdBy = snapshotData['created_by'] as String?;
    _prix = snapshotData['prix'] as int?;
    _category = snapshotData['category'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _fav = snapshotData['fav'] as bool?;
    _cod = snapshotData['cod'] as int?;
    _dispo = snapshotData['dispo'] as String?;
    _vue = snapshotData['vue'] as int?;
    _favoris = getDataList(snapshotData['favoris']);
    _nbreAvis = snapshotData['nbreAvis'] as int?;
    _multi = snapshotData['multi'] as bool?;
    _prixDemi = snapshotData['prixDemi'] as int?;
    _prixComplet = snapshotData['prixComplet'] as int?;
    _ouv = snapshotData['ouv'] as DateTime?;
    _clo = snapshotData['clo'] as DateTime?;
    _defaut = snapshotData['defaut'] as bool?;
    _note = getDataList(snapshotData['note']);
    _noteUser = getDataList(snapshotData['noteUser']);
    _moyenne = castToType<double>(snapshotData['moyenne']);
    _nbreFav = snapshotData['nbreFav'] as int?;
    _nomDemi = snapshotData['nomDemi'] as String?;
    _nomComplet = snapshotData['nomComplet'] as String?;
    _pourcentage = snapshotData['pourcentage'] as int?;
    _catList = getDataList(snapshotData['catList']);
    _restaurant = snapshotData['restaurant'] as String?;
    _prio = snapshotData['prio'] as int?;
    _disponible = snapshotData['disponible'] as bool?;
    _jours = getDataList(snapshotData['jours']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('produits');

  static Stream<ProduitsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProduitsRecord.fromSnapshot(s));

  static Future<ProduitsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProduitsRecord.fromSnapshot(s));

  static ProduitsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProduitsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProduitsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProduitsRecord._(reference, mapFromFirestore(data));

  static ProduitsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ProduitsRecord.getDocumentFromData(
        {
          'Nom': snapshot.data['Nom'],
          'image': snapshot.data['image'],
          'description': snapshot.data['description'],
          'created_by': snapshot.data['created_by'],
          'prix': snapshot.data['prix']?.round(),
          'category': snapshot.data['category'],
          'date': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(snapshot.data['date']),
          ),
          'fav': snapshot.data['fav'],
          'cod': snapshot.data['cod']?.round(),
          'dispo': snapshot.data['dispo'],
          'vue': snapshot.data['vue']?.round(),
          'favoris': safeGet(
            () => snapshot.data['favoris'].toList(),
          ),
          'nbreAvis': snapshot.data['nbreAvis']?.round(),
          'multi': snapshot.data['multi'],
          'prixDemi': snapshot.data['prixDemi']?.round(),
          'prixComplet': snapshot.data['prixComplet']?.round(),
          'ouv': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(snapshot.data['ouv']),
          ),
          'clo': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(snapshot.data['clo']),
          ),
          'defaut': snapshot.data['defaut'],
          'note': safeGet(
            () => snapshot.data['note']
                .map((d) => (d as num).toDouble())
                .toList(),
          ),
          'noteUser': safeGet(
            () => snapshot.data['noteUser'].toList(),
          ),
          'moyenne': snapshot.data['moyenne']?.toDouble(),
          'nbreFav': snapshot.data['nbreFav']?.round(),
          'nomDemi': snapshot.data['nomDemi'],
          'nomComplet': snapshot.data['nomComplet'],
          'pourcentage': snapshot.data['pourcentage']?.round(),
          'catList': safeGet(
            () => snapshot.data['catList'].toList(),
          ),
          'restaurant': snapshot.data['restaurant'],
          'prio': snapshot.data['prio']?.round(),
          'disponible': snapshot.data['disponible'],
          'jours': safeGet(
            () => snapshot.data['jours'].toList(),
          ),
        },
        ProduitsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ProduitsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'produits',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ProduitsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createProduitsRecordData({
  String? nom,
  String? image,
  String? description,
  String? createdBy,
  int? prix,
  String? category,
  DateTime? date,
  bool? fav,
  int? cod,
  String? dispo,
  int? vue,
  int? nbreAvis,
  bool? multi,
  int? prixDemi,
  int? prixComplet,
  DateTime? ouv,
  DateTime? clo,
  bool? defaut,
  double? moyenne,
  int? nbreFav,
  String? nomDemi,
  String? nomComplet,
  int? pourcentage,
  String? restaurant,
  int? prio,
  bool? disponible,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nom': nom,
      'image': image,
      'description': description,
      'created_by': createdBy,
      'prix': prix,
      'category': category,
      'date': date,
      'fav': fav,
      'cod': cod,
      'dispo': dispo,
      'vue': vue,
      'nbreAvis': nbreAvis,
      'multi': multi,
      'prixDemi': prixDemi,
      'prixComplet': prixComplet,
      'ouv': ouv,
      'clo': clo,
      'defaut': defaut,
      'moyenne': moyenne,
      'nbreFav': nbreFav,
      'nomDemi': nomDemi,
      'nomComplet': nomComplet,
      'pourcentage': pourcentage,
      'restaurant': restaurant,
      'prio': prio,
      'disponible': disponible,
    }.withoutNulls,
  );

  return firestoreData;
}
