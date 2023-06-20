import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MoyenPaiementModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for TextField125 widget.
  TextEditingController? textField125Controller;
  String? Function(BuildContext, String?)? textField125ControllerValidator;
  String? _textField125ControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DropDown1111 widget.
  String? dropDown1111Value;
  FormFieldController<String>? dropDown1111ValueController;
  // State field(s) for TextFieldmomo111 widget.
  TextEditingController? textFieldmomo111Controller;
  String? Function(BuildContext, String?)? textFieldmomo111ControllerValidator;
  // State field(s) for reseau2222 widget.
  String? reseau2222Value;
  FormFieldController<String>? reseau2222ValueController;
  // State field(s) for DropDown22222 widget.
  String? dropDown22222Value;
  FormFieldController<String>? dropDown22222ValueController;
  // State field(s) for TextFieldjoi222 widget.
  TextEditingController? textFieldjoi222Controller;
  String? Function(BuildContext, String?)? textFieldjoi222ControllerValidator;
  String? _textFieldjoi222ControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (transaction generer)] action in Button widget.
  ApiCallResponse? apiResulty733;
  // Stores action output result for [Backend Call - API (transactions token)] action in Button widget.
  ApiCallResponse? apiResultldm11;
  // Stores action output result for [Backend Call - API (paiement sans redi)] action in Button widget.
  ApiCallResponse? apiResultyz12;
  // Stores action output result for [Backend Call - API (statut)] action in Button widget.
  ApiCallResponse? caca12;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textField125ControllerValidator = _textField125ControllerValidator;
    textFieldjoi222ControllerValidator = _textFieldjoi222ControllerValidator;
  }

  void dispose() {
    textField125Controller?.dispose();
    textFieldmomo111Controller?.dispose();
    textFieldjoi222Controller?.dispose();
  }

  /// Additional helper methods are added here.

}
