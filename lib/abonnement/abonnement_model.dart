import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/choix_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AbonnementModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Create Document] action in Icon13 widget.
  PanierRecord? panlun2;
  // Stores action output result for [Backend Call - Create Document] action in Icon13 widget.
  PrecommandeRecord? lundi;
  // Stores action output result for [Backend Call - Create Document] action in Icon14 widget.
  PanierRecord? panlun3;
  // Stores action output result for [Backend Call - Create Document] action in Icon11 widget.
  PanierRecord? panmar2;
  // Stores action output result for [Backend Call - Create Document] action in Icon11 widget.
  PrecommandeRecord? mardi;
  // Stores action output result for [Backend Call - Create Document] action in Ico12 widget.
  PanierRecord? panmar3;
  // Stores action output result for [Backend Call - Create Document] action in Icon9 widget.
  PanierRecord? panmer2;
  // Stores action output result for [Backend Call - Create Document] action in Icon9 widget.
  PrecommandeRecord? mercredi;
  // Stores action output result for [Backend Call - Create Document] action in Icon10 widget.
  PanierRecord? panmer3;
  // Stores action output result for [Backend Call - Create Document] action in Icon7 widget.
  PanierRecord? panjeu2;
  // Stores action output result for [Backend Call - Create Document] action in Icon7 widget.
  PrecommandeRecord? jeudi;
  // Stores action output result for [Backend Call - Create Document] action in Icon8 widget.
  PanierRecord? panjeu3;
  // Stores action output result for [Backend Call - Create Document] action in Icon5 widget.
  PanierRecord? panven2;
  // Stores action output result for [Backend Call - Create Document] action in Icon5 widget.
  PrecommandeRecord? vendredi;
  // Stores action output result for [Backend Call - Create Document] action in Icon6 widget.
  PanierRecord? panven3;
  // Stores action output result for [Backend Call - Create Document] action in Icon3 widget.
  PanierRecord? pansam2;
  // Stores action output result for [Backend Call - Create Document] action in Icon3 widget.
  PrecommandeRecord? samedi;
  // Stores action output result for [Backend Call - Create Document] action in Icon4 widget.
  PanierRecord? pansam3;
  // Stores action output result for [Backend Call - Create Document] action in Icon2 widget.
  PanierRecord? pandim2;
  // Stores action output result for [Backend Call - Create Document] action in Icon2 widget.
  PrecommandeRecord? dimanche;
  // Stores action output result for [Backend Call - Create Document] action in Icon1 widget.
  PanierRecord? pandim3;
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  DateTime? datePicked;
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for reseau widget.
  String? reseauValue;
  FormFieldController<String>? reseauValueController;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for TextField widget.
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (transaction generer)] action in Button widget.
  ApiCallResponse? apiResulty73;
  // Stores action output result for [Backend Call - API (transactions token)] action in Button widget.
  ApiCallResponse? apiResultldm;
  // Stores action output result for [Backend Call - API (paiement sans redi)] action in Button widget.
  ApiCallResponse? apiResultyz8;
  // Stores action output result for [Backend Call - API (statut)] action in Button widget.
  ApiCallResponse? apiResultyz812;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
    textController3Validator = _textController3Validator;
  }

  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
  }

  /// Additional helper methods are added here.

}
