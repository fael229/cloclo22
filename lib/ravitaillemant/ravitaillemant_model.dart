import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/detail_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RavitaillemantModel extends FlutterFlowModel {
  /// Query cache managers for this widget.

  final _catRavitManager = StreamRequestManager<List<DetailsRecord>>();
  Stream<List<DetailsRecord>> catRavit({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<DetailsRecord>> Function() requestFn,
  }) =>
      _catRavitManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCatRavitCache() => _catRavitManager.clear();
  void clearCatRavitCacheKey(String? uniqueKey) =>
      _catRavitManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    /// Dispose query cache managers for this widget.

    clearCatRavitCache();
  }

  /// Additional helper methods are added here.

}
