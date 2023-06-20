import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/blank_card2_widget.dart';
import '/components/blank_card_widget.dart';
import '/components/blank_list_col1_widget.dart';
import '/components/detail_widget.dart';
import '/components/livraion_abo_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AccueilModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchField widget.
  TextEditingController? searchFieldController;
  String? Function(BuildContext, String?)? searchFieldControllerValidator;
  // Algolia Search Results from action on searchField
  List<ProduitsRecord>? algoliaSearchResults = [];

  /// Query cache managers for this widget.

  final _meilleurRestoManager = StreamRequestManager<List<RestaurantsRecord>>();
  Stream<List<RestaurantsRecord>> meilleurResto({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<RestaurantsRecord>> Function() requestFn,
  }) =>
      _meilleurRestoManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMeilleurRestoCache() => _meilleurRestoManager.clear();
  void clearMeilleurRestoCacheKey(String? uniqueKey) =>
      _meilleurRestoManager.clearRequest(uniqueKey);

  final _pourVousManager = StreamRequestManager<List<ProduitsRecord>>();
  Stream<List<ProduitsRecord>> pourVous({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ProduitsRecord>> Function() requestFn,
  }) =>
      _pourVousManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPourVousCache() => _pourVousManager.clear();
  void clearPourVousCacheKey(String? uniqueKey) =>
      _pourVousManager.clearRequest(uniqueKey);

  final _ravitManager = StreamRequestManager<List<ProduitsRecord>>();
  Stream<List<ProduitsRecord>> ravit({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ProduitsRecord>> Function() requestFn,
  }) =>
      _ravitManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRavitCache() => _ravitManager.clear();
  void clearRavitCacheKey(String? uniqueKey) =>
      _ravitManager.clearRequest(uniqueKey);

  final _promo1Manager = StreamRequestManager<List<BanniereRecord>>();
  Stream<List<BanniereRecord>> promo1({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<BanniereRecord>> Function() requestFn,
  }) =>
      _promo1Manager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPromo1Cache() => _promo1Manager.clear();
  void clearPromo1CacheKey(String? uniqueKey) =>
      _promo1Manager.clearRequest(uniqueKey);

  final _reductionsManager = StreamRequestManager<List<ProduitsRecord>>();
  Stream<List<ProduitsRecord>> reductions({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ProduitsRecord>> Function() requestFn,
  }) =>
      _reductionsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearReductionsCache() => _reductionsManager.clear();
  void clearReductionsCacheKey(String? uniqueKey) =>
      _reductionsManager.clearRequest(uniqueKey);

  final _catlistManager = StreamRequestManager<List<CatRecord>>();
  Stream<List<CatRecord>> catlist({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CatRecord>> Function() requestFn,
  }) =>
      _catlistManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCatlistCache() => _catlistManager.clear();
  void clearCatlistCacheKey(String? uniqueKey) =>
      _catlistManager.clearRequest(uniqueKey);

  final _promo2Manager = StreamRequestManager<List<BanniereRecord>>();
  Stream<List<BanniereRecord>> promo2({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<BanniereRecord>> Function() requestFn,
  }) =>
      _promo2Manager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPromo2Cache() => _promo2Manager.clear();
  void clearPromo2CacheKey(String? uniqueKey) =>
      _promo2Manager.clearRequest(uniqueKey);

  final _recommManager = StreamRequestManager<List<ProduitsRecord>>();
  Stream<List<ProduitsRecord>> recomm({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ProduitsRecord>> Function() requestFn,
  }) =>
      _recommManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRecommCache() => _recommManager.clear();
  void clearRecommCacheKey(String? uniqueKey) =>
      _recommManager.clearRequest(uniqueKey);

  final _popManager = StreamRequestManager<List<ProduitsRecord>>();
  Stream<List<ProduitsRecord>> pop({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ProduitsRecord>> Function() requestFn,
  }) =>
      _popManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPopCache() => _popManager.clear();
  void clearPopCacheKey(String? uniqueKey) =>
      _popManager.clearRequest(uniqueKey);

  final _tendanceManager = StreamRequestManager<List<ProduitsRecord>>();
  Stream<List<ProduitsRecord>> tendance({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ProduitsRecord>> Function() requestFn,
  }) =>
      _tendanceManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTendanceCache() => _tendanceManager.clear();
  void clearTendanceCacheKey(String? uniqueKey) =>
      _tendanceManager.clearRequest(uniqueKey);

  final _nouveauteManager = StreamRequestManager<List<ProduitsRecord>>();
  Stream<List<ProduitsRecord>> nouveaute({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ProduitsRecord>> Function() requestFn,
  }) =>
      _nouveauteManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearNouveauteCache() => _nouveauteManager.clear();
  void clearNouveauteCacheKey(String? uniqueKey) =>
      _nouveauteManager.clearRequest(uniqueKey);

  final _mieuxnoteManager = StreamRequestManager<List<ProduitsRecord>>();
  Stream<List<ProduitsRecord>> mieuxnote({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ProduitsRecord>> Function() requestFn,
  }) =>
      _mieuxnoteManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMieuxnoteCache() => _mieuxnoteManager.clear();
  void clearMieuxnoteCacheKey(String? uniqueKey) =>
      _mieuxnoteManager.clearRequest(uniqueKey);

  final _plusCommenteManager = StreamRequestManager<List<ProduitsRecord>>();
  Stream<List<ProduitsRecord>> plusCommente({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ProduitsRecord>> Function() requestFn,
  }) =>
      _plusCommenteManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPlusCommenteCache() => _plusCommenteManager.clear();
  void clearPlusCommenteCacheKey(String? uniqueKey) =>
      _plusCommenteManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    searchFieldController?.dispose();

    /// Dispose query cache managers for this widget.

    clearMeilleurRestoCache();

    clearPourVousCache();

    clearRavitCache();

    clearPromo1Cache();

    clearReductionsCache();

    clearCatlistCache();

    clearPromo2Cache();

    clearRecommCache();

    clearPopCache();

    clearTendanceCache();

    clearNouveauteCache();

    clearMieuxnoteCache();

    clearPlusCommenteCache();
  }

  /// Additional helper methods are added here.

}
