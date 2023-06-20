import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/request_manager.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MesCommandesModel extends FlutterFlowModel {
  /// Query cache managers for this widget.

  final _commandesManager = StreamRequestManager<List<PrecommandeRecord>>();
  Stream<List<PrecommandeRecord>> commandes({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<PrecommandeRecord>> Function() requestFn,
  }) =>
      _commandesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCommandesCache() => _commandesManager.clear();
  void clearCommandesCacheKey(String? uniqueKey) =>
      _commandesManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    /// Dispose query cache managers for this widget.

    clearCommandesCache();
  }

  /// Additional helper methods are added here.

}
