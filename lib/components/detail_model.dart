import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  FavRecord? ref;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for Checkboxkk widget.
  bool? checkboxkkValue;
  // State field(s) for prixpers1 widget.
  TextEditingController? prixpers1Controller;
  String? Function(BuildContext, String?)? prixpers1ControllerValidator;
  // State field(s) for indic widget.
  TextEditingController? indicController;
  String? Function(BuildContext, String?)? indicControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PanierRecord? refpanier;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PrecommandeRecord? precommande;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PanierRecord? refpanier1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PrecommandeRecord? precommande1;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    prixpers1Controller?.dispose();
    indicController?.dispose();
  }

  /// Additional helper methods are added here.

}
