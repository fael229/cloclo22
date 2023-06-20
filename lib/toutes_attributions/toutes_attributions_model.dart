import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/request_manager.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ToutesAttributionsModel extends FlutterFlowModel {
  /// Query cache managers for this widget.

  final _attributionallManager =
      StreamRequestManager<List<PrecommandeRecord>>();
  Stream<List<PrecommandeRecord>> attributionall({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<PrecommandeRecord>> Function() requestFn,
  }) =>
      _attributionallManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAttributionallCache() => _attributionallManager.clear();
  void clearAttributionallCacheKey(String? uniqueKey) =>
      _attributionallManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    /// Dispose query cache managers for this widget.

    clearAttributionallCache();
  }

  /// Additional helper methods are added here.

}
