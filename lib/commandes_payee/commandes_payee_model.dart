import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/uuuiii_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/flutter_flow/request_manager.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CommandesPayeeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CommandesRecord? ref;

  /// Query cache managers for this widget.

  final _commandesPayeManager = StreamRequestManager<List<PrecommandeRecord>>();
  Stream<List<PrecommandeRecord>> commandesPaye({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<PrecommandeRecord>> Function() requestFn,
  }) =>
      _commandesPayeManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCommandesPayeCache() => _commandesPayeManager.clear();
  void clearCommandesPayeCacheKey(String? uniqueKey) =>
      _commandesPayeManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    /// Dispose query cache managers for this widget.

    clearCommandesPayeCache();
  }

  /// Additional helper methods are added here.

}
