import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/detail_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CatDetailsModel extends FlutterFlowModel {
  /// Query cache managers for this widget.

  final _catdetManager = StreamRequestManager<List<ProduitsRecord>>();
  Stream<List<ProduitsRecord>> catdet({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ProduitsRecord>> Function() requestFn,
  }) =>
      _catdetManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCatdetCache() => _catdetManager.clear();
  void clearCatdetCacheKey(String? uniqueKey) =>
      _catdetManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    /// Dispose query cache managers for this widget.

    clearCatdetCache();
  }

  /// Additional helper methods are added here.

}
