import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/request_manager.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryModel extends FlutterFlowModel {
  /// Query cache managers for this widget.

  final _catManager = StreamRequestManager<List<CatRecord>>();
  Stream<List<CatRecord>> cat({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CatRecord>> Function() requestFn,
  }) =>
      _catManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCatCache() => _catManager.clear();
  void clearCatCacheKey(String? uniqueKey) =>
      _catManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    /// Dispose query cache managers for this widget.

    clearCatCache();
  }

  /// Additional helper methods are added here.

}
