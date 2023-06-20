import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/detail_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NosRecommandationsModel extends FlutterFlowModel {
  /// Query cache managers for this widget.

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

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    /// Dispose query cache managers for this widget.

    clearRecommCache();
  }

  /// Additional helper methods are added here.

}
