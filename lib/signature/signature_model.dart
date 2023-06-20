import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

class SignatureModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Signature1 widget.
  SignatureController? signature1Controller;
  String uploadedSignatureUrl = '';
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for reseau widget.
  String? reseauValue;
  FormFieldController<String>? reseauValueController;
  // Stores action output result for [Backend Call - API (transaction generer)] action in Button widget.
  ApiCallResponse? apiResulty73;
  // Stores action output result for [Backend Call - API (transactions token)] action in Button widget.
  ApiCallResponse? apiResultldm;
  // Stores action output result for [Backend Call - API (paiement sans redi)] action in Button widget.
  ApiCallResponse? apiResultyz8;
  // Stores action output result for [Backend Call - API (statut)] action in Button widget.
  ApiCallResponse? apiResultyz8021000;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    signature1Controller?.dispose();
    textController?.dispose();
  }

  /// Additional helper methods are added here.

}
