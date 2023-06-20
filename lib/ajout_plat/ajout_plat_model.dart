import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/card_pro_widget.dart';
import '/components/detail_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AjoutPlatModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for nom widget.
  TextEditingController? nomController;
  String? Function(BuildContext, String?)? nomControllerValidator;
  String? _nomControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for Switch widget.
  bool? switchValue;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for sector widget.
  String? sectorValue;
  FormFieldController<String>? sectorValueController;
  // State field(s) for restau1 widget.
  String? restau1Value;
  FormFieldController<String>? restau1ValueController;
  // State field(s) for prixDemi widget.
  TextEditingController? prixDemiController;
  String? Function(BuildContext, String?)? prixDemiControllerValidator;
  String? _prixDemiControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for prixComplet widget.
  TextEditingController? prixCompletController;
  String? Function(BuildContext, String?)? prixCompletControllerValidator;
  String? _prixCompletControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for prixsimple widget.
  TextEditingController? prixsimpleController;
  String? Function(BuildContext, String?)? prixsimpleControllerValidator;
  String? _prixsimpleControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for nomSiimple widget.
  TextEditingController? nomSiimpleController;
  String? Function(BuildContext, String?)? nomSiimpleControllerValidator;
  String? _nomSiimpleControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for nomComplet widget.
  TextEditingController? nomCompletController;
  String? Function(BuildContext, String?)? nomCompletControllerValidator;
  String? _nomCompletControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for searchField232 widget.
  TextEditingController? searchField232Controller;
  String? Function(BuildContext, String?)? searchField232ControllerValidator;
  // Algolia Search Results from action on searchField232
  List<ProduitsRecord>? algoliaSearchResults = [];
  // State field(s) for nom123 widget.
  TextEditingController? nom123Controller;
  String? Function(BuildContext, String?)? nom123ControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for Switch123 widget.
  bool? switch123Value;
  DateTime? datePicked3;
  DateTime? datePicked4;
  // State field(s) for sector123 widget.
  String? sector123Value;
  FormFieldController<String>? sector123ValueController;
  // State field(s) for sector222 widget.
  String? sector222Value;
  FormFieldController<String>? sector222ValueController;
  // State field(s) for prixDemi123 widget.
  TextEditingController? prixDemi123Controller;
  String? Function(BuildContext, String?)? prixDemi123ControllerValidator;
  // State field(s) for prixComplet123 widget.
  TextEditingController? prixComplet123Controller;
  String? Function(BuildContext, String?)? prixComplet123ControllerValidator;
  // State field(s) for prixsimple123 widget.
  TextEditingController? prixsimple123Controller;
  String? Function(BuildContext, String?)? prixsimple123ControllerValidator;
  // State field(s) for nomSiimple123 widget.
  TextEditingController? nomSiimple123Controller;
  String? Function(BuildContext, String?)? nomSiimple123ControllerValidator;
  // State field(s) for nomComplet123 widget.
  TextEditingController? nomComplet123Controller;
  String? Function(BuildContext, String?)? nomComplet123ControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nomControllerValidator = _nomControllerValidator;
    prixDemiControllerValidator = _prixDemiControllerValidator;
    prixCompletControllerValidator = _prixCompletControllerValidator;
    prixsimpleControllerValidator = _prixsimpleControllerValidator;
    nomSiimpleControllerValidator = _nomSiimpleControllerValidator;
    nomCompletControllerValidator = _nomCompletControllerValidator;
  }

  void dispose() {
    nomController?.dispose();
    prixDemiController?.dispose();
    prixCompletController?.dispose();
    prixsimpleController?.dispose();
    nomSiimpleController?.dispose();
    nomCompletController?.dispose();
    searchField232Controller?.dispose();
    nom123Controller?.dispose();
    prixDemi123Controller?.dispose();
    prixComplet123Controller?.dispose();
    prixsimple123Controller?.dispose();
    nomSiimple123Controller?.dispose();
    nomComplet123Controller?.dispose();
  }

  /// Additional helper methods are added here.

}
