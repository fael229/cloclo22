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
import 'abonnement_model.dart';
export 'abonnement_model.dart';

class AbonnementWidget extends StatefulWidget {
  const AbonnementWidget({Key? key}) : super(key: key);

  @override
  _AbonnementWidgetState createState() => _AbonnementWidgetState();
}

class _AbonnementWidgetState extends State<AbonnementWidget> {
  late AbonnementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AbonnementModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Abonnement'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().refmercredi = [];
      });
      await actions.lockOrientation();

      final usersUpdateData = {
        'nbreJour': FieldValue.delete(),
      };
      await currentUserReference!.update(usersUpdateData);
      FFAppState().update(() {
        FFAppState().refmardi = [];
        FFAppState().id = [];
      });
      FFAppState().update(() {
        FFAppState().aboRef2 = [];
        FFAppState().reflundi = [];
      });
      FFAppState().update(() {
        FFAppState().refjeudi = [];
        FFAppState().refvendredi = [];
      });
      FFAppState().update(() {
        FFAppState().refdimanche = [];
        FFAppState().refsamedi = [];
      });
    });

    _model.textController1 ??=
        TextEditingController(text: FFAppState().indication);
    _model.textController2 ??= TextEditingController(text: FFAppState().momo);
    _model.textController3 ??=
        TextEditingController(text: FFAppState().joignable);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 10.0,
                height: 10.0,
                child: SpinKitPulse(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 10.0,
                ),
              ),
            ),
          );
        }
        final abonnementUsersRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: StreamBuilder<List<PanierRecord>>(
                stream: queryPanierRecord(
                  parent: currentUserReference,
                  queryBuilder: (panierRecord) =>
                      panierRecord.whereIn('ref', FFAppState().refdimanche),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 10.0,
                        height: 10.0,
                        child: SpinKitPulse(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 10.0,
                        ),
                      ),
                    );
                  }
                  List<PanierRecord> containerPanierRecordList = snapshot.data!;
                  return Container(
                    decoration: BoxDecoration(),
                    child: StreamBuilder<List<PanierRecord>>(
                      stream: queryPanierRecord(
                        parent: currentUserReference,
                        queryBuilder: (panierRecord) =>
                            panierRecord.whereIn('ref', FFAppState().refsamedi),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 10.0,
                              height: 10.0,
                              child: SpinKitPulse(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 10.0,
                              ),
                            ),
                          );
                        }
                        List<PanierRecord> containerPanierRecordList =
                            snapshot.data!;
                        return Container(
                          decoration: BoxDecoration(),
                          child: StreamBuilder<List<PanierRecord>>(
                            stream: queryPanierRecord(
                              parent: currentUserReference,
                              queryBuilder: (panierRecord) => panierRecord
                                  .whereIn('ref', FFAppState().refvendredi),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 10.0,
                                    height: 10.0,
                                    child: SpinKitPulse(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 10.0,
                                    ),
                                  ),
                                );
                              }
                              List<PanierRecord> containerPanierRecordList =
                                  snapshot.data!;
                              return Container(
                                decoration: BoxDecoration(),
                                child: StreamBuilder<List<PanierRecord>>(
                                  stream: queryPanierRecord(
                                    parent: currentUserReference,
                                    queryBuilder: (panierRecord) => panierRecord
                                        .whereIn('ref', FFAppState().refjeudi),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 10.0,
                                          height: 10.0,
                                          child: SpinKitPulse(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 10.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<PanierRecord>
                                        containerPanierRecordList =
                                        snapshot.data!;
                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: StreamBuilder<List<PanierRecord>>(
                                        stream: queryPanierRecord(
                                          parent: currentUserReference,
                                          queryBuilder: (panierRecord) =>
                                              panierRecord.whereIn('ref',
                                                  FFAppState().refmercredi),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 10.0,
                                                height: 10.0,
                                                child: SpinKitPulse(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 10.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<PanierRecord>
                                              containerPanierRecordList =
                                              snapshot.data!;
                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: StreamBuilder<
                                                List<PanierRecord>>(
                                              stream: queryPanierRecord(
                                                parent: currentUserReference,
                                                queryBuilder: (panierRecord) =>
                                                    panierRecord.whereIn('ref',
                                                        FFAppState().refmardi),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 10.0,
                                                      height: 10.0,
                                                      child: SpinKitPulse(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 10.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<PanierRecord>
                                                    containerPanierRecordList =
                                                    snapshot.data!;
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0x00FFFFFF),
                                                  ),
                                                  child: StreamBuilder<
                                                      List<PanierRecord>>(
                                                    stream: queryPanierRecord(
                                                      parent:
                                                          currentUserReference,
                                                      queryBuilder:
                                                          (panierRecord) =>
                                                              panierRecord.whereIn(
                                                                  'ref',
                                                                  FFAppState()
                                                                      .reflundi),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 10.0,
                                                            height: 10.0,
                                                            child: SpinKitPulse(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 10.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<PanierRecord>
                                                          container1111PanierRecordList =
                                                          snapshot.data!;
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x00FFFFFF),
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          60.0,
                                                                          0.0,
                                                                          20.0),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          1.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 0.0,
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              offset: Offset(0.0, 1.0),
                                                                            )
                                                                          ],
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              8.0,
                                                                              10.0,
                                                                              8.0),
                                                                          child:
                                                                              StreamBuilder<UsersRecord>(
                                                                            stream:
                                                                                UsersRecord.getDocument(currentUserReference!),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 10.0,
                                                                                    height: 10.0,
                                                                                    child: SpinKitPulse(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      size: 10.0,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              final rowUsersRecord = snapshot.data!;
                                                                              return Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  FlutterFlowIconButton(
                                                                                    borderColor: Colors.transparent,
                                                                                    borderRadius: 30.0,
                                                                                    borderWidth: 1.0,
                                                                                    buttonSize: 60.0,
                                                                                    icon: Icon(
                                                                                      Icons.arrow_back_ios,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 30.0,
                                                                                    ),
                                                                                    onPressed: () async {
                                                                                      context.pop();
                                                                                    },
                                                                                  ),
                                                                                  Card(
                                                                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                    elevation: 2.0,
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(50.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(40.0),
                                                                                        child: CachedNetworkImage(
                                                                                          imageUrl: rowUsersRecord.photoUrl,
                                                                                          width: 60.0,
                                                                                          height: 60.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          rowUsersRecord.displayName,
                                                                                          style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            rowUsersRecord.email,
                                                                                            style: FlutterFlowTheme.of(context).bodySmall,
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          30.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Container(
                                                                                  width: 120.0,
                                                                                  height: 80.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x00FFFFFF),
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      SelectionArea(
                                                                                          child: Text(
                                                                                        'Lundi :',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'sf pro text',
                                                                                              fontSize: 18.0,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      )),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                child: Builder(
                                                                                  builder: (context) {
                                                                                    final lun1 = FFAppState().reflundi.toList();
                                                                                    return Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: List.generate(lun1.length, (lun1Index) {
                                                                                        final lun1Item = lun1[lun1Index];
                                                                                        return Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                          child: StreamBuilder<PanierRecord>(
                                                                                            stream: PanierRecord.getDocument(lun1Item),
                                                                                            builder: (context, snapshot) {
                                                                                              // Customize what your widget looks like when it's loading.
                                                                                              if (!snapshot.hasData) {
                                                                                                return Center(
                                                                                                  child: SizedBox(
                                                                                                    width: 10.0,
                                                                                                    height: 10.0,
                                                                                                    child: SpinKitPulse(
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      size: 10.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                              final containerPanierRecord = snapshot.data!;
                                                                                              return Container(
                                                                                                constraints: BoxConstraints(
                                                                                                  maxWidth: 400.0,
                                                                                                ),
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Color(0x00FFFFFF),
                                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: FFButtonWidget(
                                                                                                              onPressed: () async {
                                                                                                                await showModalBottomSheet(
                                                                                                                  isScrollControlled: true,
                                                                                                                  backgroundColor: Colors.transparent,
                                                                                                                  barrierColor: Color(0x00000000),
                                                                                                                  context: context,
                                                                                                                  builder: (context) {
                                                                                                                    return GestureDetector(
                                                                                                                      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                                                      child: Padding(
                                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                                        child: Container(
                                                                                                                          height: MediaQuery.of(context).size.height * 1.0,
                                                                                                                          child: ChoixWidget(
                                                                                                                            jour: 'lundi',
                                                                                                                            panRef: containerPanierRecord.reference,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  },
                                                                                                                ).then((value) => setState(() {}));
                                                                                                              },
                                                                                                              text: valueOrDefault<String>(
                                                                                                                containerPanierRecord.nom,
                                                                                                                'Choisir un plat',
                                                                                                              ),
                                                                                                              options: FFButtonOptions(
                                                                                                                width: 200.0,
                                                                                                                height: 40.0,
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                                elevation: 2.0,
                                                                                                                borderSide: BorderSide(
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  width: 2.0,
                                                                                                                ),
                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                            child: InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                await containerPanierRecord.reference.delete();
                                                                                                                FFAppState().update(() {
                                                                                                                  FFAppState().removeFromReflundi(containerPanierRecord.reference);
                                                                                                                  FFAppState().removeFromLundi1(containerPanierRecord.nom);
                                                                                                                });
                                                                                                                FFAppState().update(() {
                                                                                                                  FFAppState().removeFromAboRef2(containerPanierRecord.ref!);
                                                                                                                });
                                                                                                                if (FFAppState().lundi1.length == 0) {
                                                                                                                  final usersUpdateData = {
                                                                                                                    'nbreJour': FieldValue.arrayRemove(['lundi']),
                                                                                                                  };
                                                                                                                  await abonnementUsersRecord.reference.update(usersUpdateData);
                                                                                                                  await _model.lundi!.reference.delete();
                                                                                                                }
                                                                                                              },
                                                                                                              child: Icon(
                                                                                                                FFIcons.kfiRrDeleteDocument,
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                size: 24.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                      if (containerPanierRecord.type != null && containerPanierRecord.type != '')
                                                                                                        Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                                                                                                              child: StreamBuilder<ProduitsRecord>(
                                                                                                                stream: ProduitsRecord.getDocument(containerPanierRecord.prodRef!),
                                                                                                                builder: (context, snapshot) {
                                                                                                                  // Customize what your widget looks like when it's loading.
                                                                                                                  if (!snapshot.hasData) {
                                                                                                                    return Center(
                                                                                                                      child: SizedBox(
                                                                                                                        width: 10.0,
                                                                                                                        height: 10.0,
                                                                                                                        child: SpinKitPulse(
                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                          size: 10.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  }
                                                                                                                  final rowProduitsRecord = snapshot.data!;
                                                                                                                  return Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            containerPanierRecord.type,
                                                                                                                            textAlign: TextAlign.start,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'sf pro text',
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  fontSize: 13.0,
                                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                                  useGoogleFonts: false,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Container(
                                                                                                                        width: 40.0,
                                                                                                                        height: 30.0,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                          borderRadius: BorderRadius.circular(9.0),
                                                                                                                        ),
                                                                                                                        child: InkWell(
                                                                                                                          splashColor: Colors.transparent,
                                                                                                                          focusColor: Colors.transparent,
                                                                                                                          hoverColor: Colors.transparent,
                                                                                                                          highlightColor: Colors.transparent,
                                                                                                                          onTap: () async {
                                                                                                                            if (containerPanierRecord.qty != 1) {
                                                                                                                              final panierUpdateData = {
                                                                                                                                ...createPanierRecordData(
                                                                                                                                  mt: functions.reduce(functions.multippl(containerPanierRecord.prixperso, functions.addqty(containerPanierRecord.qty, -1)), rowProduitsRecord.pourcentage),
                                                                                                                                ),
                                                                                                                                'qty': FieldValue.increment(-(1)),
                                                                                                                              };
                                                                                                                              await containerPanierRecord.reference.update(panierUpdateData);
                                                                                                                              return;
                                                                                                                            }
                                                                                                                          },
                                                                                                                          child: Icon(
                                                                                                                            FFIcons.kfiRrMinus,
                                                                                                                            color: Colors.white,
                                                                                                                            size: 10.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                        child: Container(
                                                                                                                          width: 50.0,
                                                                                                                          decoration: BoxDecoration(
                                                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                                                          ),
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                                            child: Text(
                                                                                                                              containerPanierRecord.qty.toString(),
                                                                                                                              textAlign: TextAlign.center,
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'sf pro text',
                                                                                                                                    fontSize: 18.0,
                                                                                                                                    useGoogleFonts: false,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Container(
                                                                                                                        width: 40.0,
                                                                                                                        height: 30.0,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                          borderRadius: BorderRadius.circular(9.0),
                                                                                                                        ),
                                                                                                                        child: InkWell(
                                                                                                                          splashColor: Colors.transparent,
                                                                                                                          focusColor: Colors.transparent,
                                                                                                                          hoverColor: Colors.transparent,
                                                                                                                          highlightColor: Colors.transparent,
                                                                                                                          onTap: () async {
                                                                                                                            final panierUpdateData = {
                                                                                                                              ...createPanierRecordData(
                                                                                                                                mt: functions.reduce(functions.multippl(containerPanierRecord.prixperso, functions.addqty(containerPanierRecord.qty, 1)), rowProduitsRecord.pourcentage),
                                                                                                                              ),
                                                                                                                              'qty': FieldValue.increment(1),
                                                                                                                            };
                                                                                                                            await containerPanierRecord.reference.update(panierUpdateData);
                                                                                                                          },
                                                                                                                          child: Icon(
                                                                                                                            Icons.add,
                                                                                                                            color: Colors.white,
                                                                                                                            size: 20.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  );
                                                                                                                },
                                                                                                              ),
                                                                                                            ),
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                    child: StreamBuilder<ProduitsRecord>(
                                                                                                                      stream: ProduitsRecord.getDocument(containerPanierRecord.prodRef!),
                                                                                                                      builder: (context, snapshot) {
                                                                                                                        // Customize what your widget looks like when it's loading.
                                                                                                                        if (!snapshot.hasData) {
                                                                                                                          return Center(
                                                                                                                            child: SizedBox(
                                                                                                                              width: 10.0,
                                                                                                                              height: 10.0,
                                                                                                                              child: SpinKitPulse(
                                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                                size: 10.0,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          );
                                                                                                                        }
                                                                                                                        final textProduitsRecord = snapshot.data!;
                                                                                                                        return Text(
                                                                                                                          '${containerPanierRecord.mt.toString()} FCFA',
                                                                                                                          textAlign: TextAlign.end,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'sf pro text',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 18.0,
                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                                useGoogleFonts: false,
                                                                                                                              ),
                                                                                                                        );
                                                                                                                      },
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        );
                                                                                      }),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    if ((currentUserDocument?.nbreJour?.toList() ?? []).contains('lundi') == false)
                                                                                      AuthUserStreamWidget(
                                                                                        builder: (context) => Container(
                                                                                          width: 40.0,
                                                                                          height: 30.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0x00FC6A57),
                                                                                            borderRadius: BorderRadius.circular(9.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: StreamBuilder<List<FraisLivraisonRecord>>(
                                                                                            stream: queryFraisLivraisonRecord(
                                                                                              singleRecord: true,
                                                                                            ),
                                                                                            builder: (context, snapshot) {
                                                                                              // Customize what your widget looks like when it's loading.
                                                                                              if (!snapshot.hasData) {
                                                                                                return Center(
                                                                                                  child: SizedBox(
                                                                                                    width: 10.0,
                                                                                                    height: 10.0,
                                                                                                    child: SpinKitPulse(
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      size: 10.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                              List<FraisLivraisonRecord> icon13FraisLivraisonRecordList = snapshot.data!;
                                                                                              // Return an empty Container when the item does not exist.
                                                                                              if (snapshot.data!.isEmpty) {
                                                                                                return Container();
                                                                                              }
                                                                                              final icon13FraisLivraisonRecord = icon13FraisLivraisonRecordList.isNotEmpty ? icon13FraisLivraisonRecordList.first : null;
                                                                                              return InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  final panierCreateData = createPanierRecordData(
                                                                                                    jour: 'lundi',
                                                                                                    id: random_data.randomString(
                                                                                                      10,
                                                                                                      10,
                                                                                                      true,
                                                                                                      true,
                                                                                                      true,
                                                                                                    ),
                                                                                                  );
                                                                                                  var panierRecordReference = PanierRecord.createDoc(currentUserReference!);
                                                                                                  await panierRecordReference.set(panierCreateData);
                                                                                                  _model.panlun2 = PanierRecord.getDocumentFromData(panierCreateData, panierRecordReference);

                                                                                                  final usersUpdateData = {
                                                                                                    'nbreJour': FieldValue.arrayUnion(['lundi']),
                                                                                                  };
                                                                                                  await currentUserReference!.update(usersUpdateData);

                                                                                                  final precommandeCreateData = createPrecommandeRecordData(
                                                                                                    jour: 'lundi',
                                                                                                  );
                                                                                                  var precommandeRecordReference = PrecommandeRecord.collection.doc();
                                                                                                  await precommandeRecordReference.set(precommandeCreateData);
                                                                                                  _model.lundi = PrecommandeRecord.getDocumentFromData(precommandeCreateData, precommandeRecordReference);

                                                                                                  final panierUpdateData = createPanierRecordData(
                                                                                                    ref: _model.panlun2!.reference,
                                                                                                  );
                                                                                                  await _model.panlun2!.reference.update(panierUpdateData);
                                                                                                  FFAppState().update(() {
                                                                                                    FFAppState().addToReflundi(_model.panlun2!.reference);
                                                                                                    FFAppState().addToAboRef2(_model.panlun2!.reference);
                                                                                                  });

                                                                                                  setState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.add,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 20.0,
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    if ((currentUserDocument?.nbreJour?.toList() ?? []).contains('lundi') == true)
                                                                                      AuthUserStreamWidget(
                                                                                        builder: (context) => Container(
                                                                                          width: 40.0,
                                                                                          height: 30.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0x00FC6A57),
                                                                                            borderRadius: BorderRadius.circular(9.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              final panierCreateData = createPanierRecordData(
                                                                                                jour: 'lundi',
                                                                                                id: random_data.randomString(
                                                                                                  10,
                                                                                                  10,
                                                                                                  true,
                                                                                                  true,
                                                                                                  true,
                                                                                                ),
                                                                                              );
                                                                                              var panierRecordReference = PanierRecord.createDoc(currentUserReference!);
                                                                                              await panierRecordReference.set(panierCreateData);
                                                                                              _model.panlun3 = PanierRecord.getDocumentFromData(panierCreateData, panierRecordReference);

                                                                                              final panierUpdateData = createPanierRecordData(
                                                                                                ref: _model.panlun3!.reference,
                                                                                              );
                                                                                              await _model.panlun3!.reference.update(panierUpdateData);
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().addToReflundi(_model.panlun3!.reference);
                                                                                                FFAppState().addToAboRef2(_model.panlun3!.reference);
                                                                                              });

                                                                                              setState(() {});
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.add,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 20.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          30.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Container(
                                                                                  width: 120.0,
                                                                                  height: 80.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x00FFFFFF),
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      SelectionArea(
                                                                                          child: Text(
                                                                                        'Mardi:',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'sf pro text',
                                                                                              fontSize: 18.0,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      )),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Builder(
                                                                                builder: (context) {
                                                                                  final mar1 = FFAppState().refmardi.toList();
                                                                                  return Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: List.generate(mar1.length, (mar1Index) {
                                                                                      final mar1Item = mar1[mar1Index];
                                                                                      return Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                        child: StreamBuilder<PanierRecord>(
                                                                                          stream: PanierRecord.getDocument(mar1Item),
                                                                                          builder: (context, snapshot) {
                                                                                            // Customize what your widget looks like when it's loading.
                                                                                            if (!snapshot.hasData) {
                                                                                              return Center(
                                                                                                child: SizedBox(
                                                                                                  width: 10.0,
                                                                                                  height: 10.0,
                                                                                                  child: SpinKitPulse(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    size: 10.0,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            final containerPanierRecord = snapshot.data!;
                                                                                            return Container(
                                                                                              constraints: BoxConstraints(
                                                                                                maxWidth: 400.0,
                                                                                              ),
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color(0x00FFFFFF),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: FFButtonWidget(
                                                                                                            onPressed: () async {
                                                                                                              await showModalBottomSheet(
                                                                                                                isScrollControlled: true,
                                                                                                                backgroundColor: Colors.transparent,
                                                                                                                barrierColor: Color(0x00000000),
                                                                                                                context: context,
                                                                                                                builder: (context) {
                                                                                                                  return GestureDetector(
                                                                                                                    onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                                                    child: Padding(
                                                                                                                      padding: MediaQuery.of(context).viewInsets,
                                                                                                                      child: Container(
                                                                                                                        height: MediaQuery.of(context).size.height * 1.0,
                                                                                                                        child: ChoixWidget(
                                                                                                                          jour: 'mardi',
                                                                                                                          panRef: containerPanierRecord.reference,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              ).then((value) => setState(() {}));
                                                                                                            },
                                                                                                            text: valueOrDefault<String>(
                                                                                                              containerPanierRecord.nom,
                                                                                                              'Choisir un plat',
                                                                                                            ),
                                                                                                            options: FFButtonOptions(
                                                                                                              width: 200.0,
                                                                                                              height: 40.0,
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                    fontFamily: 'sf pro text',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    useGoogleFonts: false,
                                                                                                                  ),
                                                                                                              elevation: 2.0,
                                                                                                              borderSide: BorderSide(
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                width: 2.0,
                                                                                                              ),
                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                          child: InkWell(
                                                                                                            splashColor: Colors.transparent,
                                                                                                            focusColor: Colors.transparent,
                                                                                                            hoverColor: Colors.transparent,
                                                                                                            highlightColor: Colors.transparent,
                                                                                                            onTap: () async {
                                                                                                              await containerPanierRecord.reference.delete();
                                                                                                              FFAppState().update(() {
                                                                                                                FFAppState().removeFromMardi1(containerPanierRecord.nom);
                                                                                                                FFAppState().removeFromRefmardi(containerPanierRecord.reference);
                                                                                                              });
                                                                                                              FFAppState().update(() {
                                                                                                                FFAppState().removeFromAboRef2(containerPanierRecord.ref!);
                                                                                                              });
                                                                                                              if (FFAppState().mardi1.length == 0) {
                                                                                                                final usersUpdateData = {
                                                                                                                  'nbreJour': FieldValue.arrayRemove(['mardi']),
                                                                                                                };
                                                                                                                await abonnementUsersRecord.reference.update(usersUpdateData);
                                                                                                                await _model.mardi!.reference.delete();
                                                                                                              }
                                                                                                            },
                                                                                                            child: Icon(
                                                                                                              FFIcons.kfiRrDeleteDocument,
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              size: 24.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    if (containerPanierRecord.type != null && containerPanierRecord.type != '')
                                                                                                      Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                                                                                                            child: StreamBuilder<ProduitsRecord>(
                                                                                                              stream: ProduitsRecord.getDocument(containerPanierRecord.prodRef!),
                                                                                                              builder: (context, snapshot) {
                                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                                if (!snapshot.hasData) {
                                                                                                                  return Center(
                                                                                                                    child: SizedBox(
                                                                                                                      width: 10.0,
                                                                                                                      height: 10.0,
                                                                                                                      child: SpinKitPulse(
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        size: 10.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                }
                                                                                                                final rowProduitsRecord = snapshot.data!;
                                                                                                                return Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          containerPanierRecord.type,
                                                                                                                          textAlign: TextAlign.start,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'sf pro text',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 13.0,
                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                                useGoogleFonts: false,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 40.0,
                                                                                                                      height: 30.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        borderRadius: BorderRadius.circular(9.0),
                                                                                                                      ),
                                                                                                                      child: InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          if (containerPanierRecord.qty != 1) {
                                                                                                                            final panierUpdateData = {
                                                                                                                              ...createPanierRecordData(
                                                                                                                                mt: functions.reduce(functions.multippl(containerPanierRecord.prixperso, functions.addqty(containerPanierRecord.qty, -1)), rowProduitsRecord.pourcentage),
                                                                                                                              ),
                                                                                                                              'qty': FieldValue.increment(-(1)),
                                                                                                                            };
                                                                                                                            await containerPanierRecord.reference.update(panierUpdateData);
                                                                                                                            return;
                                                                                                                          }
                                                                                                                        },
                                                                                                                        child: Icon(
                                                                                                                          FFIcons.kfiRrMinus,
                                                                                                                          color: Colors.white,
                                                                                                                          size: 10.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                      child: Container(
                                                                                                                        width: 50.0,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                                                        ),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                                          child: Text(
                                                                                                                            containerPanierRecord.qty.toString(),
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'sf pro text',
                                                                                                                                  fontSize: 18.0,
                                                                                                                                  useGoogleFonts: false,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 40.0,
                                                                                                                      height: 30.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        borderRadius: BorderRadius.circular(9.0),
                                                                                                                      ),
                                                                                                                      child: InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          final panierUpdateData = {
                                                                                                                            ...createPanierRecordData(
                                                                                                                              mt: functions.reduce(functions.multippl(containerPanierRecord.prixperso, functions.addqty(containerPanierRecord.qty, 1)), rowProduitsRecord.pourcentage),
                                                                                                                            ),
                                                                                                                            'qty': FieldValue.increment(1),
                                                                                                                          };
                                                                                                                          await containerPanierRecord.reference.update(panierUpdateData);
                                                                                                                        },
                                                                                                                        child: Icon(
                                                                                                                          Icons.add,
                                                                                                                          color: Colors.white,
                                                                                                                          size: 20.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                );
                                                                                                              },
                                                                                                            ),
                                                                                                          ),
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                  child: StreamBuilder<ProduitsRecord>(
                                                                                                                    stream: ProduitsRecord.getDocument(containerPanierRecord.prodRef!),
                                                                                                                    builder: (context, snapshot) {
                                                                                                                      // Customize what your widget looks like when it's loading.
                                                                                                                      if (!snapshot.hasData) {
                                                                                                                        return Center(
                                                                                                                          child: SizedBox(
                                                                                                                            width: 10.0,
                                                                                                                            height: 10.0,
                                                                                                                            child: SpinKitPulse(
                                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                                              size: 10.0,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      }
                                                                                                                      final textProduitsRecord = snapshot.data!;
                                                                                                                      return Text(
                                                                                                                        '${containerPanierRecord.mt.toString()} FCFA',
                                                                                                                        textAlign: TextAlign.end,
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'sf pro text',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 18.0,
                                                                                                                              fontWeight: FontWeight.bold,
                                                                                                                              useGoogleFonts: false,
                                                                                                                            ),
                                                                                                                      );
                                                                                                                    },
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      );
                                                                                    }),
                                                                                  );
                                                                                },
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    if ((currentUserDocument?.nbreJour?.toList() ?? []).contains('mardi') == false)
                                                                                      AuthUserStreamWidget(
                                                                                        builder: (context) => Container(
                                                                                          width: 40.0,
                                                                                          height: 30.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0x00FC6A57),
                                                                                            borderRadius: BorderRadius.circular(9.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: StreamBuilder<List<FraisLivraisonRecord>>(
                                                                                            stream: queryFraisLivraisonRecord(
                                                                                              singleRecord: true,
                                                                                            ),
                                                                                            builder: (context, snapshot) {
                                                                                              // Customize what your widget looks like when it's loading.
                                                                                              if (!snapshot.hasData) {
                                                                                                return Center(
                                                                                                  child: SizedBox(
                                                                                                    width: 10.0,
                                                                                                    height: 10.0,
                                                                                                    child: SpinKitPulse(
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      size: 10.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                              List<FraisLivraisonRecord> icon11FraisLivraisonRecordList = snapshot.data!;
                                                                                              // Return an empty Container when the item does not exist.
                                                                                              if (snapshot.data!.isEmpty) {
                                                                                                return Container();
                                                                                              }
                                                                                              final icon11FraisLivraisonRecord = icon11FraisLivraisonRecordList.isNotEmpty ? icon11FraisLivraisonRecordList.first : null;
                                                                                              return InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  final panierCreateData = createPanierRecordData(
                                                                                                    jour: 'mardi',
                                                                                                    id: random_data.randomString(
                                                                                                      10,
                                                                                                      10,
                                                                                                      true,
                                                                                                      true,
                                                                                                      true,
                                                                                                    ),
                                                                                                  );
                                                                                                  var panierRecordReference = PanierRecord.createDoc(currentUserReference!);
                                                                                                  await panierRecordReference.set(panierCreateData);
                                                                                                  _model.panmar2 = PanierRecord.getDocumentFromData(panierCreateData, panierRecordReference);

                                                                                                  final usersUpdateData = {
                                                                                                    'nbreJour': FieldValue.arrayUnion(['mardi']),
                                                                                                  };
                                                                                                  await currentUserReference!.update(usersUpdateData);

                                                                                                  final precommandeCreateData = createPrecommandeRecordData(
                                                                                                    jour: 'mardi',
                                                                                                  );
                                                                                                  var precommandeRecordReference = PrecommandeRecord.collection.doc();
                                                                                                  await precommandeRecordReference.set(precommandeCreateData);
                                                                                                  _model.mardi = PrecommandeRecord.getDocumentFromData(precommandeCreateData, precommandeRecordReference);

                                                                                                  final panierUpdateData = createPanierRecordData(
                                                                                                    ref: _model.panmar2!.reference,
                                                                                                  );
                                                                                                  await _model.panmar2!.reference.update(panierUpdateData);
                                                                                                  FFAppState().update(() {
                                                                                                    FFAppState().addToRefmardi(_model.panmar2!.reference);
                                                                                                    FFAppState().addToAboRef2(_model.panmar2!.reference);
                                                                                                  });

                                                                                                  setState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.add,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 20.0,
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    if ((currentUserDocument?.nbreJour?.toList() ?? []).contains('mardi') == true)
                                                                                      AuthUserStreamWidget(
                                                                                        builder: (context) => Container(
                                                                                          width: 40.0,
                                                                                          height: 30.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0x00FC6A57),
                                                                                            borderRadius: BorderRadius.circular(9.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              final panierCreateData = createPanierRecordData(
                                                                                                jour: 'mardi',
                                                                                                id: random_data.randomString(
                                                                                                  10,
                                                                                                  10,
                                                                                                  true,
                                                                                                  true,
                                                                                                  true,
                                                                                                ),
                                                                                              );
                                                                                              var panierRecordReference = PanierRecord.createDoc(currentUserReference!);
                                                                                              await panierRecordReference.set(panierCreateData);
                                                                                              _model.panmar3 = PanierRecord.getDocumentFromData(panierCreateData, panierRecordReference);

                                                                                              final panierUpdateData = createPanierRecordData(
                                                                                                ref: _model.panmar3!.reference,
                                                                                              );
                                                                                              await _model.panmar3!.reference.update(panierUpdateData);
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().addToRefmardi(_model.panmar3!.reference);
                                                                                                FFAppState().addToAboRef2(_model.panmar3!.reference);
                                                                                              });

                                                                                              setState(() {});
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.add,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 20.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          30.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Container(
                                                                                  width: 120.0,
                                                                                  height: 80.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x00FFFFFF),
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      SelectionArea(
                                                                                          child: Text(
                                                                                        'Mercredi :',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'sf pro text',
                                                                                              fontSize: 18.0,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      )),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Builder(
                                                                                builder: (context) {
                                                                                  final mer1 = FFAppState().refmercredi.toList();
                                                                                  return Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: List.generate(mer1.length, (mer1Index) {
                                                                                      final mer1Item = mer1[mer1Index];
                                                                                      return Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                        child: StreamBuilder<PanierRecord>(
                                                                                          stream: PanierRecord.getDocument(mer1Item),
                                                                                          builder: (context, snapshot) {
                                                                                            // Customize what your widget looks like when it's loading.
                                                                                            if (!snapshot.hasData) {
                                                                                              return Center(
                                                                                                child: SizedBox(
                                                                                                  width: 10.0,
                                                                                                  height: 10.0,
                                                                                                  child: SpinKitPulse(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    size: 10.0,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            final containerPanierRecord = snapshot.data!;
                                                                                            return Container(
                                                                                              constraints: BoxConstraints(
                                                                                                maxWidth: 400.0,
                                                                                              ),
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color(0x00FFFFFF),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: FFButtonWidget(
                                                                                                            onPressed: () async {
                                                                                                              await showModalBottomSheet(
                                                                                                                isScrollControlled: true,
                                                                                                                backgroundColor: Colors.transparent,
                                                                                                                barrierColor: Color(0x00000000),
                                                                                                                context: context,
                                                                                                                builder: (context) {
                                                                                                                  return GestureDetector(
                                                                                                                    onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                                                    child: Padding(
                                                                                                                      padding: MediaQuery.of(context).viewInsets,
                                                                                                                      child: Container(
                                                                                                                        height: MediaQuery.of(context).size.height * 1.0,
                                                                                                                        child: ChoixWidget(
                                                                                                                          jour: 'mercredi',
                                                                                                                          panRef: containerPanierRecord.reference,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              ).then((value) => setState(() {}));
                                                                                                            },
                                                                                                            text: valueOrDefault<String>(
                                                                                                              containerPanierRecord.nom,
                                                                                                              'Choisir un plat',
                                                                                                            ),
                                                                                                            options: FFButtonOptions(
                                                                                                              width: 200.0,
                                                                                                              height: 40.0,
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                    fontFamily: 'sf pro text',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    useGoogleFonts: false,
                                                                                                                  ),
                                                                                                              elevation: 2.0,
                                                                                                              borderSide: BorderSide(
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                width: 2.0,
                                                                                                              ),
                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                          child: InkWell(
                                                                                                            splashColor: Colors.transparent,
                                                                                                            focusColor: Colors.transparent,
                                                                                                            hoverColor: Colors.transparent,
                                                                                                            highlightColor: Colors.transparent,
                                                                                                            onTap: () async {
                                                                                                              await containerPanierRecord.reference.delete();
                                                                                                              FFAppState().update(() {
                                                                                                                FFAppState().removeFromMercredi1(containerPanierRecord.nom);
                                                                                                                FFAppState().removeFromRefmercredi(containerPanierRecord.reference);
                                                                                                              });
                                                                                                              FFAppState().update(() {
                                                                                                                FFAppState().removeFromAboRef2(containerPanierRecord.ref!);
                                                                                                              });
                                                                                                              if (FFAppState().mercredi1.length == 0) {
                                                                                                                final usersUpdateData = {
                                                                                                                  'nbreJour': FieldValue.arrayRemove(['mercredi']),
                                                                                                                };
                                                                                                                await abonnementUsersRecord.reference.update(usersUpdateData);
                                                                                                                await _model.mercredi!.reference.delete();
                                                                                                              }
                                                                                                            },
                                                                                                            child: Icon(
                                                                                                              FFIcons.kfiRrDeleteDocument,
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              size: 24.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    if (containerPanierRecord.type != null && containerPanierRecord.type != '')
                                                                                                      Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                                                                                                            child: StreamBuilder<ProduitsRecord>(
                                                                                                              stream: ProduitsRecord.getDocument(containerPanierRecord.prodRef!),
                                                                                                              builder: (context, snapshot) {
                                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                                if (!snapshot.hasData) {
                                                                                                                  return Center(
                                                                                                                    child: SizedBox(
                                                                                                                      width: 10.0,
                                                                                                                      height: 10.0,
                                                                                                                      child: SpinKitPulse(
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        size: 10.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                }
                                                                                                                final rowProduitsRecord = snapshot.data!;
                                                                                                                return Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          containerPanierRecord.type,
                                                                                                                          textAlign: TextAlign.start,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'sf pro text',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 13.0,
                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                                useGoogleFonts: false,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 40.0,
                                                                                                                      height: 30.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        borderRadius: BorderRadius.circular(9.0),
                                                                                                                      ),
                                                                                                                      child: InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          if (containerPanierRecord.qty != 1) {
                                                                                                                            final panierUpdateData = {
                                                                                                                              ...createPanierRecordData(
                                                                                                                                mt: functions.reduce(functions.multippl(containerPanierRecord.prixperso, functions.addqty(containerPanierRecord.qty, -1)), rowProduitsRecord.pourcentage),
                                                                                                                              ),
                                                                                                                              'qty': FieldValue.increment(-(1)),
                                                                                                                            };
                                                                                                                            await containerPanierRecord.reference.update(panierUpdateData);
                                                                                                                            return;
                                                                                                                          }
                                                                                                                        },
                                                                                                                        child: Icon(
                                                                                                                          FFIcons.kfiRrMinus,
                                                                                                                          color: Colors.white,
                                                                                                                          size: 10.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                      child: Container(
                                                                                                                        width: 50.0,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                                                        ),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                                          child: Text(
                                                                                                                            containerPanierRecord.qty.toString(),
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'sf pro text',
                                                                                                                                  fontSize: 18.0,
                                                                                                                                  useGoogleFonts: false,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 40.0,
                                                                                                                      height: 30.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        borderRadius: BorderRadius.circular(9.0),
                                                                                                                      ),
                                                                                                                      child: InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          final panierUpdateData = {
                                                                                                                            ...createPanierRecordData(
                                                                                                                              mt: functions.reduce(functions.multippl(containerPanierRecord.prixperso, functions.addqty(containerPanierRecord.qty, 1)), rowProduitsRecord.pourcentage),
                                                                                                                            ),
                                                                                                                            'qty': FieldValue.increment(1),
                                                                                                                          };
                                                                                                                          await containerPanierRecord.reference.update(panierUpdateData);
                                                                                                                        },
                                                                                                                        child: Icon(
                                                                                                                          Icons.add,
                                                                                                                          color: Colors.white,
                                                                                                                          size: 20.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                );
                                                                                                              },
                                                                                                            ),
                                                                                                          ),
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                  child: StreamBuilder<ProduitsRecord>(
                                                                                                                    stream: ProduitsRecord.getDocument(containerPanierRecord.prodRef!),
                                                                                                                    builder: (context, snapshot) {
                                                                                                                      // Customize what your widget looks like when it's loading.
                                                                                                                      if (!snapshot.hasData) {
                                                                                                                        return Center(
                                                                                                                          child: SizedBox(
                                                                                                                            width: 10.0,
                                                                                                                            height: 10.0,
                                                                                                                            child: SpinKitPulse(
                                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                                              size: 10.0,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      }
                                                                                                                      final textProduitsRecord = snapshot.data!;
                                                                                                                      return Text(
                                                                                                                        '${containerPanierRecord.mt.toString()} FCFA',
                                                                                                                        textAlign: TextAlign.end,
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'sf pro text',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 18.0,
                                                                                                                              fontWeight: FontWeight.bold,
                                                                                                                              useGoogleFonts: false,
                                                                                                                            ),
                                                                                                                      );
                                                                                                                    },
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      );
                                                                                    }),
                                                                                  );
                                                                                },
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    if ((currentUserDocument?.nbreJour?.toList() ?? []).contains('mercredi') == false)
                                                                                      AuthUserStreamWidget(
                                                                                        builder: (context) => Container(
                                                                                          width: 40.0,
                                                                                          height: 30.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0x00FC6A57),
                                                                                            borderRadius: BorderRadius.circular(9.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: StreamBuilder<List<FraisLivraisonRecord>>(
                                                                                            stream: queryFraisLivraisonRecord(
                                                                                              singleRecord: true,
                                                                                            ),
                                                                                            builder: (context, snapshot) {
                                                                                              // Customize what your widget looks like when it's loading.
                                                                                              if (!snapshot.hasData) {
                                                                                                return Center(
                                                                                                  child: SizedBox(
                                                                                                    width: 10.0,
                                                                                                    height: 10.0,
                                                                                                    child: SpinKitPulse(
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      size: 10.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                              List<FraisLivraisonRecord> icon9FraisLivraisonRecordList = snapshot.data!;
                                                                                              // Return an empty Container when the item does not exist.
                                                                                              if (snapshot.data!.isEmpty) {
                                                                                                return Container();
                                                                                              }
                                                                                              final icon9FraisLivraisonRecord = icon9FraisLivraisonRecordList.isNotEmpty ? icon9FraisLivraisonRecordList.first : null;
                                                                                              return InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  final panierCreateData = createPanierRecordData(
                                                                                                    jour: 'mercredi',
                                                                                                    id: random_data.randomString(
                                                                                                      10,
                                                                                                      10,
                                                                                                      true,
                                                                                                      true,
                                                                                                      true,
                                                                                                    ),
                                                                                                  );
                                                                                                  var panierRecordReference = PanierRecord.createDoc(currentUserReference!);
                                                                                                  await panierRecordReference.set(panierCreateData);
                                                                                                  _model.panmer2 = PanierRecord.getDocumentFromData(panierCreateData, panierRecordReference);

                                                                                                  final usersUpdateData = {
                                                                                                    'nbreJour': FieldValue.arrayUnion(['mercredi']),
                                                                                                  };
                                                                                                  await currentUserReference!.update(usersUpdateData);

                                                                                                  final precommandeCreateData = createPrecommandeRecordData(
                                                                                                    jour: 'mercredi',
                                                                                                  );
                                                                                                  var precommandeRecordReference = PrecommandeRecord.collection.doc();
                                                                                                  await precommandeRecordReference.set(precommandeCreateData);
                                                                                                  _model.mercredi = PrecommandeRecord.getDocumentFromData(precommandeCreateData, precommandeRecordReference);

                                                                                                  final panierUpdateData = createPanierRecordData(
                                                                                                    ref: _model.panmer2!.reference,
                                                                                                  );
                                                                                                  await _model.panmer2!.reference.update(panierUpdateData);
                                                                                                  FFAppState().update(() {
                                                                                                    FFAppState().addToRefmercredi(_model.panmer2!.reference);
                                                                                                    FFAppState().addToAboRef2(_model.panmer2!.reference);
                                                                                                  });

                                                                                                  setState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.add,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 20.0,
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    if ((currentUserDocument?.nbreJour?.toList() ?? []).contains('mercredi') == true)
                                                                                      AuthUserStreamWidget(
                                                                                        builder: (context) => Container(
                                                                                          width: 40.0,
                                                                                          height: 30.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0x00FC6A57),
                                                                                            borderRadius: BorderRadius.circular(9.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              final panierCreateData = createPanierRecordData(
                                                                                                jour: 'mercredi',
                                                                                                id: random_data.randomString(
                                                                                                  10,
                                                                                                  10,
                                                                                                  true,
                                                                                                  true,
                                                                                                  true,
                                                                                                ),
                                                                                              );
                                                                                              var panierRecordReference = PanierRecord.createDoc(currentUserReference!);
                                                                                              await panierRecordReference.set(panierCreateData);
                                                                                              _model.panmer3 = PanierRecord.getDocumentFromData(panierCreateData, panierRecordReference);

                                                                                              final panierUpdateData = createPanierRecordData(
                                                                                                ref: _model.panmer3!.reference,
                                                                                              );
                                                                                              await _model.panmer3!.reference.update(panierUpdateData);
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().addToRefmercredi(_model.panmer3!.reference);
                                                                                                FFAppState().addToAboRef2(_model.panmer3!.reference);
                                                                                              });

                                                                                              setState(() {});
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.add,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 20.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          30.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Container(
                                                                                  width: 120.0,
                                                                                  height: 80.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x00FFFFFF),
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      SelectionArea(
                                                                                          child: Text(
                                                                                        'Jeudi:',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'sf pro text',
                                                                                              fontSize: 18.0,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      )),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Builder(
                                                                                builder: (context) {
                                                                                  final jeu1 = FFAppState().refjeudi.toList();
                                                                                  return Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: List.generate(jeu1.length, (jeu1Index) {
                                                                                      final jeu1Item = jeu1[jeu1Index];
                                                                                      return Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                        child: StreamBuilder<PanierRecord>(
                                                                                          stream: PanierRecord.getDocument(jeu1Item),
                                                                                          builder: (context, snapshot) {
                                                                                            // Customize what your widget looks like when it's loading.
                                                                                            if (!snapshot.hasData) {
                                                                                              return Center(
                                                                                                child: SizedBox(
                                                                                                  width: 10.0,
                                                                                                  height: 10.0,
                                                                                                  child: SpinKitPulse(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    size: 10.0,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            final containerPanierRecord = snapshot.data!;
                                                                                            return Container(
                                                                                              constraints: BoxConstraints(
                                                                                                maxWidth: 400.0,
                                                                                              ),
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color(0x00FFFFFF),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: FFButtonWidget(
                                                                                                            onPressed: () async {
                                                                                                              await showModalBottomSheet(
                                                                                                                isScrollControlled: true,
                                                                                                                backgroundColor: Colors.transparent,
                                                                                                                barrierColor: Color(0x00000000),
                                                                                                                context: context,
                                                                                                                builder: (context) {
                                                                                                                  return GestureDetector(
                                                                                                                    onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                                                    child: Padding(
                                                                                                                      padding: MediaQuery.of(context).viewInsets,
                                                                                                                      child: Container(
                                                                                                                        height: MediaQuery.of(context).size.height * 1.0,
                                                                                                                        child: ChoixWidget(
                                                                                                                          jour: 'jeudi',
                                                                                                                          panRef: containerPanierRecord.reference,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              ).then((value) => setState(() {}));
                                                                                                            },
                                                                                                            text: valueOrDefault<String>(
                                                                                                              containerPanierRecord.nom,
                                                                                                              'Choisir un plat',
                                                                                                            ),
                                                                                                            options: FFButtonOptions(
                                                                                                              width: 200.0,
                                                                                                              height: 40.0,
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                    fontFamily: 'sf pro text',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    useGoogleFonts: false,
                                                                                                                  ),
                                                                                                              elevation: 2.0,
                                                                                                              borderSide: BorderSide(
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                width: 2.0,
                                                                                                              ),
                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                          child: InkWell(
                                                                                                            splashColor: Colors.transparent,
                                                                                                            focusColor: Colors.transparent,
                                                                                                            hoverColor: Colors.transparent,
                                                                                                            highlightColor: Colors.transparent,
                                                                                                            onTap: () async {
                                                                                                              await containerPanierRecord.reference.delete();
                                                                                                              FFAppState().update(() {
                                                                                                                FFAppState().removeFromJeudi1(containerPanierRecord.nom);
                                                                                                                FFAppState().removeFromRefjeudi(containerPanierRecord.reference);
                                                                                                              });
                                                                                                              FFAppState().update(() {
                                                                                                                FFAppState().removeFromAboRef2(containerPanierRecord.ref!);
                                                                                                              });
                                                                                                              if (FFAppState().jeudi1.length == 0) {
                                                                                                                final usersUpdateData = {
                                                                                                                  'nbreJour': FieldValue.arrayRemove(['jeudi']),
                                                                                                                };
                                                                                                                await abonnementUsersRecord.reference.update(usersUpdateData);
                                                                                                                await _model.jeudi!.reference.delete();
                                                                                                              }
                                                                                                            },
                                                                                                            child: Icon(
                                                                                                              FFIcons.kfiRrDeleteDocument,
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              size: 24.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    if (containerPanierRecord.type != null && containerPanierRecord.type != '')
                                                                                                      Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                                                                                                            child: StreamBuilder<ProduitsRecord>(
                                                                                                              stream: ProduitsRecord.getDocument(containerPanierRecord.prodRef!),
                                                                                                              builder: (context, snapshot) {
                                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                                if (!snapshot.hasData) {
                                                                                                                  return Center(
                                                                                                                    child: SizedBox(
                                                                                                                      width: 10.0,
                                                                                                                      height: 10.0,
                                                                                                                      child: SpinKitPulse(
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        size: 10.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                }
                                                                                                                final rowProduitsRecord = snapshot.data!;
                                                                                                                return Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          containerPanierRecord.type,
                                                                                                                          textAlign: TextAlign.start,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'sf pro text',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 13.0,
                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                                useGoogleFonts: false,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 40.0,
                                                                                                                      height: 30.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        borderRadius: BorderRadius.circular(9.0),
                                                                                                                      ),
                                                                                                                      child: InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          if (containerPanierRecord.qty != 1) {
                                                                                                                            final panierUpdateData = {
                                                                                                                              ...createPanierRecordData(
                                                                                                                                mt: functions.reduce(functions.multippl(containerPanierRecord.prixperso, functions.addqty(containerPanierRecord.qty, -1)), rowProduitsRecord.pourcentage),
                                                                                                                              ),
                                                                                                                              'qty': FieldValue.increment(-(1)),
                                                                                                                            };
                                                                                                                            await containerPanierRecord.reference.update(panierUpdateData);
                                                                                                                            return;
                                                                                                                          }
                                                                                                                        },
                                                                                                                        child: Icon(
                                                                                                                          FFIcons.kfiRrMinus,
                                                                                                                          color: Colors.white,
                                                                                                                          size: 10.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                      child: Container(
                                                                                                                        width: 50.0,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                                                        ),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                                          child: Text(
                                                                                                                            containerPanierRecord.qty.toString(),
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'sf pro text',
                                                                                                                                  fontSize: 18.0,
                                                                                                                                  useGoogleFonts: false,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 40.0,
                                                                                                                      height: 30.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        borderRadius: BorderRadius.circular(9.0),
                                                                                                                      ),
                                                                                                                      child: InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          final panierUpdateData = {
                                                                                                                            ...createPanierRecordData(
                                                                                                                              mt: functions.reduce(functions.multippl(containerPanierRecord.prixperso, functions.addqty(containerPanierRecord.qty, 1)), rowProduitsRecord.pourcentage),
                                                                                                                            ),
                                                                                                                            'qty': FieldValue.increment(1),
                                                                                                                          };
                                                                                                                          await containerPanierRecord.reference.update(panierUpdateData);
                                                                                                                        },
                                                                                                                        child: Icon(
                                                                                                                          Icons.add,
                                                                                                                          color: Colors.white,
                                                                                                                          size: 20.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                );
                                                                                                              },
                                                                                                            ),
                                                                                                          ),
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                  child: StreamBuilder<ProduitsRecord>(
                                                                                                                    stream: ProduitsRecord.getDocument(containerPanierRecord.prodRef!),
                                                                                                                    builder: (context, snapshot) {
                                                                                                                      // Customize what your widget looks like when it's loading.
                                                                                                                      if (!snapshot.hasData) {
                                                                                                                        return Center(
                                                                                                                          child: SizedBox(
                                                                                                                            width: 10.0,
                                                                                                                            height: 10.0,
                                                                                                                            child: SpinKitPulse(
                                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                                              size: 10.0,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      }
                                                                                                                      final textProduitsRecord = snapshot.data!;
                                                                                                                      return Text(
                                                                                                                        '${containerPanierRecord.mt.toString()} FCFA',
                                                                                                                        textAlign: TextAlign.end,
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'sf pro text',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 18.0,
                                                                                                                              fontWeight: FontWeight.bold,
                                                                                                                              useGoogleFonts: false,
                                                                                                                            ),
                                                                                                                      );
                                                                                                                    },
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      );
                                                                                    }),
                                                                                  );
                                                                                },
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    if ((currentUserDocument?.nbreJour?.toList() ?? []).contains('jeudi') == false)
                                                                                      AuthUserStreamWidget(
                                                                                        builder: (context) => Container(
                                                                                          width: 40.0,
                                                                                          height: 30.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0x00FC6A57),
                                                                                            borderRadius: BorderRadius.circular(9.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: StreamBuilder<List<FraisLivraisonRecord>>(
                                                                                            stream: queryFraisLivraisonRecord(
                                                                                              singleRecord: true,
                                                                                            ),
                                                                                            builder: (context, snapshot) {
                                                                                              // Customize what your widget looks like when it's loading.
                                                                                              if (!snapshot.hasData) {
                                                                                                return Center(
                                                                                                  child: SizedBox(
                                                                                                    width: 10.0,
                                                                                                    height: 10.0,
                                                                                                    child: SpinKitPulse(
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      size: 10.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                              List<FraisLivraisonRecord> icon7FraisLivraisonRecordList = snapshot.data!;
                                                                                              // Return an empty Container when the item does not exist.
                                                                                              if (snapshot.data!.isEmpty) {
                                                                                                return Container();
                                                                                              }
                                                                                              final icon7FraisLivraisonRecord = icon7FraisLivraisonRecordList.isNotEmpty ? icon7FraisLivraisonRecordList.first : null;
                                                                                              return InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  final panierCreateData = createPanierRecordData(
                                                                                                    jour: 'jeudi',
                                                                                                    id: random_data.randomString(
                                                                                                      10,
                                                                                                      10,
                                                                                                      true,
                                                                                                      true,
                                                                                                      true,
                                                                                                    ),
                                                                                                  );
                                                                                                  var panierRecordReference = PanierRecord.createDoc(currentUserReference!);
                                                                                                  await panierRecordReference.set(panierCreateData);
                                                                                                  _model.panjeu2 = PanierRecord.getDocumentFromData(panierCreateData, panierRecordReference);

                                                                                                  final usersUpdateData = {
                                                                                                    'nbreJour': FieldValue.arrayUnion(['jeudi']),
                                                                                                  };
                                                                                                  await currentUserReference!.update(usersUpdateData);

                                                                                                  final precommandeCreateData = createPrecommandeRecordData(
                                                                                                    jour: 'jeudi',
                                                                                                  );
                                                                                                  var precommandeRecordReference = PrecommandeRecord.collection.doc();
                                                                                                  await precommandeRecordReference.set(precommandeCreateData);
                                                                                                  _model.jeudi = PrecommandeRecord.getDocumentFromData(precommandeCreateData, precommandeRecordReference);

                                                                                                  final panierUpdateData = createPanierRecordData(
                                                                                                    ref: _model.panjeu2!.reference,
                                                                                                  );
                                                                                                  await _model.panjeu2!.reference.update(panierUpdateData);
                                                                                                  FFAppState().update(() {
                                                                                                    FFAppState().addToRefjeudi(_model.panjeu2!.reference);
                                                                                                    FFAppState().addToAboRef2(_model.panjeu2!.reference);
                                                                                                  });

                                                                                                  setState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.add,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 20.0,
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    if ((currentUserDocument?.nbreJour?.toList() ?? []).contains('jeudi') == true)
                                                                                      AuthUserStreamWidget(
                                                                                        builder: (context) => Container(
                                                                                          width: 40.0,
                                                                                          height: 30.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0x00FC6A57),
                                                                                            borderRadius: BorderRadius.circular(9.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              final panierCreateData = createPanierRecordData(
                                                                                                jour: 'jeudi',
                                                                                                id: random_data.randomString(
                                                                                                  10,
                                                                                                  10,
                                                                                                  true,
                                                                                                  true,
                                                                                                  true,
                                                                                                ),
                                                                                              );
                                                                                              var panierRecordReference = PanierRecord.createDoc(currentUserReference!);
                                                                                              await panierRecordReference.set(panierCreateData);
                                                                                              _model.panjeu3 = PanierRecord.getDocumentFromData(panierCreateData, panierRecordReference);

                                                                                              final panierUpdateData = createPanierRecordData(
                                                                                                ref: _model.panjeu3!.reference,
                                                                                              );
                                                                                              await _model.panjeu3!.reference.update(panierUpdateData);
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().addToRefjeudi(_model.panjeu3!.reference);
                                                                                                FFAppState().addToAboRef2(_model.panjeu3!.reference);
                                                                                              });

                                                                                              setState(() {});
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.add,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 20.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          30.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Container(
                                                                                  width: 120.0,
                                                                                  height: 80.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x00FFFFFF),
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      SelectionArea(
                                                                                          child: Text(
                                                                                        'Vendredi:',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'sf pro text',
                                                                                              fontSize: 18.0,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      )),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Builder(
                                                                                builder: (context) {
                                                                                  final ven1 = FFAppState().refvendredi.toList();
                                                                                  return Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: List.generate(ven1.length, (ven1Index) {
                                                                                      final ven1Item = ven1[ven1Index];
                                                                                      return Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                        child: StreamBuilder<PanierRecord>(
                                                                                          stream: PanierRecord.getDocument(ven1Item),
                                                                                          builder: (context, snapshot) {
                                                                                            // Customize what your widget looks like when it's loading.
                                                                                            if (!snapshot.hasData) {
                                                                                              return Center(
                                                                                                child: SizedBox(
                                                                                                  width: 10.0,
                                                                                                  height: 10.0,
                                                                                                  child: SpinKitPulse(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    size: 10.0,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            final containerPanierRecord = snapshot.data!;
                                                                                            return Container(
                                                                                              constraints: BoxConstraints(
                                                                                                maxWidth: 400.0,
                                                                                              ),
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color(0x00FFFFFF),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: FFButtonWidget(
                                                                                                            onPressed: () async {
                                                                                                              await showModalBottomSheet(
                                                                                                                isScrollControlled: true,
                                                                                                                backgroundColor: Colors.transparent,
                                                                                                                barrierColor: Color(0x00000000),
                                                                                                                context: context,
                                                                                                                builder: (context) {
                                                                                                                  return GestureDetector(
                                                                                                                    onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                                                    child: Padding(
                                                                                                                      padding: MediaQuery.of(context).viewInsets,
                                                                                                                      child: Container(
                                                                                                                        height: MediaQuery.of(context).size.height * 1.0,
                                                                                                                        child: ChoixWidget(
                                                                                                                          jour: 'vendredi',
                                                                                                                          panRef: containerPanierRecord.reference,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              ).then((value) => setState(() {}));
                                                                                                            },
                                                                                                            text: valueOrDefault<String>(
                                                                                                              containerPanierRecord.nom,
                                                                                                              'Choisir un plat',
                                                                                                            ),
                                                                                                            options: FFButtonOptions(
                                                                                                              width: 200.0,
                                                                                                              height: 40.0,
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                    fontFamily: 'sf pro text',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    useGoogleFonts: false,
                                                                                                                  ),
                                                                                                              elevation: 2.0,
                                                                                                              borderSide: BorderSide(
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                width: 2.0,
                                                                                                              ),
                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                          child: InkWell(
                                                                                                            splashColor: Colors.transparent,
                                                                                                            focusColor: Colors.transparent,
                                                                                                            hoverColor: Colors.transparent,
                                                                                                            highlightColor: Colors.transparent,
                                                                                                            onTap: () async {
                                                                                                              await containerPanierRecord.reference.delete();
                                                                                                              FFAppState().update(() {
                                                                                                                FFAppState().removeFromVendredi1(containerPanierRecord.nom);
                                                                                                                FFAppState().removeFromRefvendredi(containerPanierRecord.reference);
                                                                                                              });
                                                                                                              FFAppState().update(() {
                                                                                                                FFAppState().removeFromAboRef2(containerPanierRecord.ref!);
                                                                                                              });
                                                                                                              if (FFAppState().vendredi1.length == 0) {
                                                                                                                final usersUpdateData = {
                                                                                                                  'nbreJour': FieldValue.arrayRemove(['vendredi']),
                                                                                                                };
                                                                                                                await abonnementUsersRecord.reference.update(usersUpdateData);
                                                                                                                await _model.vendredi!.reference.delete();
                                                                                                              }
                                                                                                            },
                                                                                                            child: Icon(
                                                                                                              FFIcons.kfiRrDeleteDocument,
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              size: 24.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    if (containerPanierRecord.type != null && containerPanierRecord.type != '')
                                                                                                      Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                                                                                                            child: StreamBuilder<ProduitsRecord>(
                                                                                                              stream: ProduitsRecord.getDocument(containerPanierRecord.prodRef!),
                                                                                                              builder: (context, snapshot) {
                                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                                if (!snapshot.hasData) {
                                                                                                                  return Center(
                                                                                                                    child: SizedBox(
                                                                                                                      width: 10.0,
                                                                                                                      height: 10.0,
                                                                                                                      child: SpinKitPulse(
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        size: 10.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                }
                                                                                                                final rowProduitsRecord = snapshot.data!;
                                                                                                                return Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          containerPanierRecord.type,
                                                                                                                          textAlign: TextAlign.start,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'sf pro text',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 13.0,
                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                                useGoogleFonts: false,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 40.0,
                                                                                                                      height: 30.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        borderRadius: BorderRadius.circular(9.0),
                                                                                                                      ),
                                                                                                                      child: InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          if (containerPanierRecord.qty != 1) {
                                                                                                                            final panierUpdateData = {
                                                                                                                              ...createPanierRecordData(
                                                                                                                                mt: functions.reduce(functions.multippl(containerPanierRecord.prixperso, functions.addqty(containerPanierRecord.qty, -1)), rowProduitsRecord.pourcentage),
                                                                                                                              ),
                                                                                                                              'qty': FieldValue.increment(-(1)),
                                                                                                                            };
                                                                                                                            await containerPanierRecord.reference.update(panierUpdateData);
                                                                                                                            return;
                                                                                                                          }
                                                                                                                        },
                                                                                                                        child: Icon(
                                                                                                                          FFIcons.kfiRrMinus,
                                                                                                                          color: Colors.white,
                                                                                                                          size: 10.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                      child: Container(
                                                                                                                        width: 50.0,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                                                        ),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                                          child: Text(
                                                                                                                            containerPanierRecord.qty.toString(),
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'sf pro text',
                                                                                                                                  fontSize: 18.0,
                                                                                                                                  useGoogleFonts: false,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 40.0,
                                                                                                                      height: 30.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        borderRadius: BorderRadius.circular(9.0),
                                                                                                                      ),
                                                                                                                      child: InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          final panierUpdateData = {
                                                                                                                            ...createPanierRecordData(
                                                                                                                              mt: functions.reduce(functions.multippl(containerPanierRecord.prixperso, functions.addqty(containerPanierRecord.qty, 1)), rowProduitsRecord.pourcentage),
                                                                                                                            ),
                                                                                                                            'qty': FieldValue.increment(1),
                                                                                                                          };
                                                                                                                          await containerPanierRecord.reference.update(panierUpdateData);
                                                                                                                        },
                                                                                                                        child: Icon(
                                                                                                                          Icons.add,
                                                                                                                          color: Colors.white,
                                                                                                                          size: 20.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                );
                                                                                                              },
                                                                                                            ),
                                                                                                          ),
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                  child: StreamBuilder<ProduitsRecord>(
                                                                                                                    stream: ProduitsRecord.getDocument(containerPanierRecord.prodRef!),
                                                                                                                    builder: (context, snapshot) {
                                                                                                                      // Customize what your widget looks like when it's loading.
                                                                                                                      if (!snapshot.hasData) {
                                                                                                                        return Center(
                                                                                                                          child: SizedBox(
                                                                                                                            width: 10.0,
                                                                                                                            height: 10.0,
                                                                                                                            child: SpinKitPulse(
                                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                                              size: 10.0,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      }
                                                                                                                      final textProduitsRecord = snapshot.data!;
                                                                                                                      return Text(
                                                                                                                        '${containerPanierRecord.mt.toString()} FCFA',
                                                                                                                        textAlign: TextAlign.end,
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'sf pro text',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 18.0,
                                                                                                                              fontWeight: FontWeight.bold,
                                                                                                                              useGoogleFonts: false,
                                                                                                                            ),
                                                                                                                      );
                                                                                                                    },
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      );
                                                                                    }),
                                                                                  );
                                                                                },
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    if ((currentUserDocument?.nbreJour?.toList() ?? []).contains('vendredi') == false)
                                                                                      AuthUserStreamWidget(
                                                                                        builder: (context) => Container(
                                                                                          width: 40.0,
                                                                                          height: 30.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0x00FC6A57),
                                                                                            borderRadius: BorderRadius.circular(9.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: StreamBuilder<List<FraisLivraisonRecord>>(
                                                                                            stream: queryFraisLivraisonRecord(
                                                                                              singleRecord: true,
                                                                                            ),
                                                                                            builder: (context, snapshot) {
                                                                                              // Customize what your widget looks like when it's loading.
                                                                                              if (!snapshot.hasData) {
                                                                                                return Center(
                                                                                                  child: SizedBox(
                                                                                                    width: 10.0,
                                                                                                    height: 10.0,
                                                                                                    child: SpinKitPulse(
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      size: 10.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                              List<FraisLivraisonRecord> icon5FraisLivraisonRecordList = snapshot.data!;
                                                                                              // Return an empty Container when the item does not exist.
                                                                                              if (snapshot.data!.isEmpty) {
                                                                                                return Container();
                                                                                              }
                                                                                              final icon5FraisLivraisonRecord = icon5FraisLivraisonRecordList.isNotEmpty ? icon5FraisLivraisonRecordList.first : null;
                                                                                              return InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  final panierCreateData = createPanierRecordData(
                                                                                                    jour: 'vendredi',
                                                                                                    id: random_data.randomString(
                                                                                                      10,
                                                                                                      10,
                                                                                                      true,
                                                                                                      true,
                                                                                                      true,
                                                                                                    ),
                                                                                                  );
                                                                                                  var panierRecordReference = PanierRecord.createDoc(currentUserReference!);
                                                                                                  await panierRecordReference.set(panierCreateData);
                                                                                                  _model.panven2 = PanierRecord.getDocumentFromData(panierCreateData, panierRecordReference);

                                                                                                  final usersUpdateData = {
                                                                                                    'nbreJour': FieldValue.arrayUnion(['vendredi']),
                                                                                                  };
                                                                                                  await currentUserReference!.update(usersUpdateData);

                                                                                                  final precommandeCreateData = createPrecommandeRecordData(
                                                                                                    jour: 'vendredi',
                                                                                                  );
                                                                                                  var precommandeRecordReference = PrecommandeRecord.collection.doc();
                                                                                                  await precommandeRecordReference.set(precommandeCreateData);
                                                                                                  _model.vendredi = PrecommandeRecord.getDocumentFromData(precommandeCreateData, precommandeRecordReference);

                                                                                                  final panierUpdateData = createPanierRecordData(
                                                                                                    ref: _model.panven2!.reference,
                                                                                                  );
                                                                                                  await _model.panven2!.reference.update(panierUpdateData);
                                                                                                  FFAppState().update(() {
                                                                                                    FFAppState().addToRefvendredi(_model.panven2!.reference);
                                                                                                    FFAppState().addToAboRef2(_model.panven2!.reference);
                                                                                                  });

                                                                                                  setState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.add,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 20.0,
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    if ((currentUserDocument?.nbreJour?.toList() ?? []).contains('vendredi') == true)
                                                                                      AuthUserStreamWidget(
                                                                                        builder: (context) => Container(
                                                                                          width: 40.0,
                                                                                          height: 30.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0x00FC6A57),
                                                                                            borderRadius: BorderRadius.circular(9.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              final panierCreateData = createPanierRecordData(
                                                                                                jour: 'vendredi',
                                                                                                id: random_data.randomString(
                                                                                                  10,
                                                                                                  10,
                                                                                                  true,
                                                                                                  true,
                                                                                                  true,
                                                                                                ),
                                                                                              );
                                                                                              var panierRecordReference = PanierRecord.createDoc(currentUserReference!);
                                                                                              await panierRecordReference.set(panierCreateData);
                                                                                              _model.panven3 = PanierRecord.getDocumentFromData(panierCreateData, panierRecordReference);

                                                                                              final panierUpdateData = createPanierRecordData(
                                                                                                ref: _model.panven3!.reference,
                                                                                              );
                                                                                              await _model.panven3!.reference.update(panierUpdateData);
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().addToRefvendredi(_model.panven3!.reference);
                                                                                                FFAppState().addToAboRef2(_model.panven3!.reference);
                                                                                              });

                                                                                              setState(() {});
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.add,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 20.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          30.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Container(
                                                                                  width: 120.0,
                                                                                  height: 80.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x00FFFFFF),
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      SelectionArea(
                                                                                          child: Text(
                                                                                        'Samedi:',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'sf pro text',
                                                                                              fontSize: 18.0,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      )),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Builder(
                                                                                builder: (context) {
                                                                                  final sam1 = FFAppState().refsamedi.toList();
                                                                                  return Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: List.generate(sam1.length, (sam1Index) {
                                                                                      final sam1Item = sam1[sam1Index];
                                                                                      return Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                        child: StreamBuilder<PanierRecord>(
                                                                                          stream: PanierRecord.getDocument(sam1Item),
                                                                                          builder: (context, snapshot) {
                                                                                            // Customize what your widget looks like when it's loading.
                                                                                            if (!snapshot.hasData) {
                                                                                              return Center(
                                                                                                child: SizedBox(
                                                                                                  width: 10.0,
                                                                                                  height: 10.0,
                                                                                                  child: SpinKitPulse(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    size: 10.0,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            final containerPanierRecord = snapshot.data!;
                                                                                            return Container(
                                                                                              constraints: BoxConstraints(
                                                                                                maxWidth: 400.0,
                                                                                              ),
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color(0x00FFFFFF),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: FFButtonWidget(
                                                                                                            onPressed: () async {
                                                                                                              await showModalBottomSheet(
                                                                                                                isScrollControlled: true,
                                                                                                                backgroundColor: Colors.transparent,
                                                                                                                barrierColor: Color(0x00000000),
                                                                                                                context: context,
                                                                                                                builder: (context) {
                                                                                                                  return GestureDetector(
                                                                                                                    onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                                                    child: Padding(
                                                                                                                      padding: MediaQuery.of(context).viewInsets,
                                                                                                                      child: Container(
                                                                                                                        height: MediaQuery.of(context).size.height * 1.0,
                                                                                                                        child: ChoixWidget(
                                                                                                                          jour: 'samedi',
                                                                                                                          panRef: containerPanierRecord.reference,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              ).then((value) => setState(() {}));
                                                                                                            },
                                                                                                            text: valueOrDefault<String>(
                                                                                                              containerPanierRecord.nom,
                                                                                                              'Choisir un plat',
                                                                                                            ),
                                                                                                            options: FFButtonOptions(
                                                                                                              width: 200.0,
                                                                                                              height: 40.0,
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                    fontFamily: 'sf pro text',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    useGoogleFonts: false,
                                                                                                                  ),
                                                                                                              elevation: 2.0,
                                                                                                              borderSide: BorderSide(
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                width: 2.0,
                                                                                                              ),
                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                          child: InkWell(
                                                                                                            splashColor: Colors.transparent,
                                                                                                            focusColor: Colors.transparent,
                                                                                                            hoverColor: Colors.transparent,
                                                                                                            highlightColor: Colors.transparent,
                                                                                                            onTap: () async {
                                                                                                              await containerPanierRecord.reference.delete();
                                                                                                              FFAppState().update(() {
                                                                                                                FFAppState().removeFromSamedi1(containerPanierRecord.nom);
                                                                                                                FFAppState().removeFromRefsamedi(containerPanierRecord.reference);
                                                                                                              });
                                                                                                              FFAppState().update(() {
                                                                                                                FFAppState().removeFromAboRef2(containerPanierRecord.ref!);
                                                                                                              });
                                                                                                              if (FFAppState().samedi1.length == 0) {
                                                                                                                final usersUpdateData = {
                                                                                                                  'nbreJour': FieldValue.arrayRemove(['samedi']),
                                                                                                                };
                                                                                                                await abonnementUsersRecord.reference.update(usersUpdateData);
                                                                                                                await _model.samedi!.reference.delete();
                                                                                                              }
                                                                                                            },
                                                                                                            child: Icon(
                                                                                                              FFIcons.kfiRrDeleteDocument,
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              size: 24.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    if (containerPanierRecord.type != null && containerPanierRecord.type != '')
                                                                                                      Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                                                                                                            child: StreamBuilder<ProduitsRecord>(
                                                                                                              stream: ProduitsRecord.getDocument(containerPanierRecord.prodRef!),
                                                                                                              builder: (context, snapshot) {
                                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                                if (!snapshot.hasData) {
                                                                                                                  return Center(
                                                                                                                    child: SizedBox(
                                                                                                                      width: 10.0,
                                                                                                                      height: 10.0,
                                                                                                                      child: SpinKitPulse(
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        size: 10.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                }
                                                                                                                final rowProduitsRecord = snapshot.data!;
                                                                                                                return Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          containerPanierRecord.type,
                                                                                                                          textAlign: TextAlign.start,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'sf pro text',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 13.0,
                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                                useGoogleFonts: false,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 40.0,
                                                                                                                      height: 30.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        borderRadius: BorderRadius.circular(9.0),
                                                                                                                      ),
                                                                                                                      child: InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          if (containerPanierRecord.qty != 1) {
                                                                                                                            final panierUpdateData = {
                                                                                                                              ...createPanierRecordData(
                                                                                                                                mt: functions.reduce(functions.multippl(containerPanierRecord.prixperso, functions.addqty(containerPanierRecord.qty, -1)), rowProduitsRecord.pourcentage),
                                                                                                                              ),
                                                                                                                              'qty': FieldValue.increment(-(1)),
                                                                                                                            };
                                                                                                                            await containerPanierRecord.reference.update(panierUpdateData);
                                                                                                                            return;
                                                                                                                          }
                                                                                                                        },
                                                                                                                        child: Icon(
                                                                                                                          FFIcons.kfiRrMinus,
                                                                                                                          color: Colors.white,
                                                                                                                          size: 10.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                      child: Container(
                                                                                                                        width: 50.0,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                                                        ),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                                          child: Text(
                                                                                                                            containerPanierRecord.qty.toString(),
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'sf pro text',
                                                                                                                                  fontSize: 18.0,
                                                                                                                                  useGoogleFonts: false,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 40.0,
                                                                                                                      height: 30.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        borderRadius: BorderRadius.circular(9.0),
                                                                                                                      ),
                                                                                                                      child: InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          final panierUpdateData = {
                                                                                                                            ...createPanierRecordData(
                                                                                                                              mt: functions.reduce(functions.multippl(containerPanierRecord.prixperso, functions.addqty(containerPanierRecord.qty, 1)), rowProduitsRecord.pourcentage),
                                                                                                                            ),
                                                                                                                            'qty': FieldValue.increment(1),
                                                                                                                          };
                                                                                                                          await containerPanierRecord.reference.update(panierUpdateData);
                                                                                                                        },
                                                                                                                        child: Icon(
                                                                                                                          Icons.add,
                                                                                                                          color: Colors.white,
                                                                                                                          size: 20.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                );
                                                                                                              },
                                                                                                            ),
                                                                                                          ),
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                  child: StreamBuilder<ProduitsRecord>(
                                                                                                                    stream: ProduitsRecord.getDocument(containerPanierRecord.prodRef!),
                                                                                                                    builder: (context, snapshot) {
                                                                                                                      // Customize what your widget looks like when it's loading.
                                                                                                                      if (!snapshot.hasData) {
                                                                                                                        return Center(
                                                                                                                          child: SizedBox(
                                                                                                                            width: 10.0,
                                                                                                                            height: 10.0,
                                                                                                                            child: SpinKitPulse(
                                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                                              size: 10.0,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      }
                                                                                                                      final textProduitsRecord = snapshot.data!;
                                                                                                                      return Text(
                                                                                                                        '${containerPanierRecord.mt.toString()} FCFA',
                                                                                                                        textAlign: TextAlign.end,
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'sf pro text',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 18.0,
                                                                                                                              fontWeight: FontWeight.bold,
                                                                                                                              useGoogleFonts: false,
                                                                                                                            ),
                                                                                                                      );
                                                                                                                    },
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      );
                                                                                    }),
                                                                                  );
                                                                                },
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    if ((currentUserDocument?.nbreJour?.toList() ?? []).contains('samedi') == false)
                                                                                      AuthUserStreamWidget(
                                                                                        builder: (context) => Container(
                                                                                          width: 40.0,
                                                                                          height: 30.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0x00FC6A57),
                                                                                            borderRadius: BorderRadius.circular(9.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: StreamBuilder<List<FraisLivraisonRecord>>(
                                                                                            stream: queryFraisLivraisonRecord(
                                                                                              singleRecord: true,
                                                                                            ),
                                                                                            builder: (context, snapshot) {
                                                                                              // Customize what your widget looks like when it's loading.
                                                                                              if (!snapshot.hasData) {
                                                                                                return Center(
                                                                                                  child: SizedBox(
                                                                                                    width: 10.0,
                                                                                                    height: 10.0,
                                                                                                    child: SpinKitPulse(
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      size: 10.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                              List<FraisLivraisonRecord> icon3FraisLivraisonRecordList = snapshot.data!;
                                                                                              // Return an empty Container when the item does not exist.
                                                                                              if (snapshot.data!.isEmpty) {
                                                                                                return Container();
                                                                                              }
                                                                                              final icon3FraisLivraisonRecord = icon3FraisLivraisonRecordList.isNotEmpty ? icon3FraisLivraisonRecordList.first : null;
                                                                                              return InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  final panierCreateData = createPanierRecordData(
                                                                                                    jour: 'samedi',
                                                                                                    id: random_data.randomString(
                                                                                                      10,
                                                                                                      10,
                                                                                                      true,
                                                                                                      true,
                                                                                                      true,
                                                                                                    ),
                                                                                                  );
                                                                                                  var panierRecordReference = PanierRecord.createDoc(currentUserReference!);
                                                                                                  await panierRecordReference.set(panierCreateData);
                                                                                                  _model.pansam2 = PanierRecord.getDocumentFromData(panierCreateData, panierRecordReference);

                                                                                                  final usersUpdateData = {
                                                                                                    'nbreJour': FieldValue.arrayUnion(['samedi']),
                                                                                                  };
                                                                                                  await currentUserReference!.update(usersUpdateData);

                                                                                                  final precommandeCreateData = createPrecommandeRecordData(
                                                                                                    jour: 'samedi',
                                                                                                  );
                                                                                                  var precommandeRecordReference = PrecommandeRecord.collection.doc();
                                                                                                  await precommandeRecordReference.set(precommandeCreateData);
                                                                                                  _model.samedi = PrecommandeRecord.getDocumentFromData(precommandeCreateData, precommandeRecordReference);

                                                                                                  final panierUpdateData = createPanierRecordData(
                                                                                                    ref: _model.pansam2!.reference,
                                                                                                  );
                                                                                                  await _model.pansam2!.reference.update(panierUpdateData);
                                                                                                  FFAppState().update(() {
                                                                                                    FFAppState().addToRefsamedi(_model.pansam2!.reference);
                                                                                                    FFAppState().addToAboRef2(_model.pansam2!.reference);
                                                                                                  });

                                                                                                  setState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.add,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 20.0,
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    if ((currentUserDocument?.nbreJour?.toList() ?? []).contains('samedi') == true)
                                                                                      AuthUserStreamWidget(
                                                                                        builder: (context) => Container(
                                                                                          width: 40.0,
                                                                                          height: 30.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0x00FC6A57),
                                                                                            borderRadius: BorderRadius.circular(9.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              final panierCreateData = createPanierRecordData(
                                                                                                jour: 'samedi',
                                                                                                id: random_data.randomString(
                                                                                                  10,
                                                                                                  10,
                                                                                                  true,
                                                                                                  true,
                                                                                                  true,
                                                                                                ),
                                                                                              );
                                                                                              var panierRecordReference = PanierRecord.createDoc(currentUserReference!);
                                                                                              await panierRecordReference.set(panierCreateData);
                                                                                              _model.pansam3 = PanierRecord.getDocumentFromData(panierCreateData, panierRecordReference);

                                                                                              final panierUpdateData = createPanierRecordData(
                                                                                                ref: _model.pansam3!.reference,
                                                                                              );
                                                                                              await _model.pansam3!.reference.update(panierUpdateData);
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().addToRefsamedi(_model.pansam3!.reference);
                                                                                                FFAppState().addToAboRef2(_model.pansam3!.reference);
                                                                                              });

                                                                                              setState(() {});
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.add,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 20.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          30.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Container(
                                                                                  width: 120.0,
                                                                                  height: 80.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x00FFFFFF),
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      SelectionArea(
                                                                                          child: Text(
                                                                                        'Dimanche',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'sf pro text',
                                                                                              fontSize: 18.0,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      )),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Builder(
                                                                                builder: (context) {
                                                                                  final dim1 = FFAppState().refdimanche.toList();
                                                                                  return Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: List.generate(dim1.length, (dim1Index) {
                                                                                      final dim1Item = dim1[dim1Index];
                                                                                      return Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                        child: StreamBuilder<PanierRecord>(
                                                                                          stream: PanierRecord.getDocument(dim1Item),
                                                                                          builder: (context, snapshot) {
                                                                                            // Customize what your widget looks like when it's loading.
                                                                                            if (!snapshot.hasData) {
                                                                                              return Center(
                                                                                                child: SizedBox(
                                                                                                  width: 10.0,
                                                                                                  height: 10.0,
                                                                                                  child: SpinKitPulse(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    size: 10.0,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            final containerPanierRecord = snapshot.data!;
                                                                                            return Container(
                                                                                              constraints: BoxConstraints(
                                                                                                maxWidth: 400.0,
                                                                                              ),
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color(0x00FFFFFF),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                          child: InkWell(
                                                                                                            splashColor: Colors.transparent,
                                                                                                            focusColor: Colors.transparent,
                                                                                                            hoverColor: Colors.transparent,
                                                                                                            highlightColor: Colors.transparent,
                                                                                                            onTap: () async {
                                                                                                              await containerPanierRecord.reference.delete();
                                                                                                              FFAppState().update(() {
                                                                                                                FFAppState().removeFromDimanche1(containerPanierRecord.nom);
                                                                                                                FFAppState().removeFromRefdimanche(containerPanierRecord.reference);
                                                                                                              });
                                                                                                              FFAppState().update(() {
                                                                                                                FFAppState().removeFromAboRef2(containerPanierRecord.ref!);
                                                                                                              });
                                                                                                              if (FFAppState().dimanche1.length == 0) {
                                                                                                                final usersUpdateData = {
                                                                                                                  'nbreJour': FieldValue.arrayRemove(['dimanche']),
                                                                                                                };
                                                                                                                await abonnementUsersRecord.reference.update(usersUpdateData);
                                                                                                                await _model.dimanche!.reference.delete();
                                                                                                              }
                                                                                                            },
                                                                                                            child: Icon(
                                                                                                              FFIcons.kfiRrDeleteDocument,
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              size: 24.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Expanded(
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                            child: FFButtonWidget(
                                                                                                              onPressed: () async {
                                                                                                                await showModalBottomSheet(
                                                                                                                  isScrollControlled: true,
                                                                                                                  backgroundColor: Colors.transparent,
                                                                                                                  barrierColor: Color(0x00000000),
                                                                                                                  context: context,
                                                                                                                  builder: (context) {
                                                                                                                    return GestureDetector(
                                                                                                                      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                                                      child: Padding(
                                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                                        child: Container(
                                                                                                                          height: MediaQuery.of(context).size.height * 1.0,
                                                                                                                          child: ChoixWidget(
                                                                                                                            jour: 'dimanche',
                                                                                                                            panRef: containerPanierRecord.reference,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  },
                                                                                                                ).then((value) => setState(() {}));
                                                                                                              },
                                                                                                              text: valueOrDefault<String>(
                                                                                                                containerPanierRecord.nom,
                                                                                                                'Choisir un plat',
                                                                                                              ),
                                                                                                              options: FFButtonOptions(
                                                                                                                width: 200.0,
                                                                                                                height: 40.0,
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                                elevation: 2.0,
                                                                                                                borderSide: BorderSide(
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  width: 2.0,
                                                                                                                ),
                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    if (containerPanierRecord.type != null && containerPanierRecord.type != '')
                                                                                                      Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                                                                                                            child: StreamBuilder<ProduitsRecord>(
                                                                                                              stream: ProduitsRecord.getDocument(containerPanierRecord.prodRef!),
                                                                                                              builder: (context, snapshot) {
                                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                                if (!snapshot.hasData) {
                                                                                                                  return Center(
                                                                                                                    child: SizedBox(
                                                                                                                      width: 10.0,
                                                                                                                      height: 10.0,
                                                                                                                      child: SpinKitPulse(
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        size: 10.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                }
                                                                                                                final rowProduitsRecord = snapshot.data!;
                                                                                                                return Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          containerPanierRecord.type,
                                                                                                                          textAlign: TextAlign.start,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'sf pro text',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 13.0,
                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                                useGoogleFonts: false,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 40.0,
                                                                                                                      height: 30.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        borderRadius: BorderRadius.circular(9.0),
                                                                                                                      ),
                                                                                                                      child: InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          if (containerPanierRecord.qty != 1) {
                                                                                                                            final panierUpdateData = {
                                                                                                                              ...createPanierRecordData(
                                                                                                                                mt: functions.reduce(functions.multippl(containerPanierRecord.prixperso, functions.addqty(containerPanierRecord.qty, -1)), rowProduitsRecord.pourcentage),
                                                                                                                              ),
                                                                                                                              'qty': FieldValue.increment(-(1)),
                                                                                                                            };
                                                                                                                            await containerPanierRecord.reference.update(panierUpdateData);
                                                                                                                            return;
                                                                                                                          }
                                                                                                                        },
                                                                                                                        child: Icon(
                                                                                                                          FFIcons.kfiRrMinus,
                                                                                                                          color: Colors.white,
                                                                                                                          size: 10.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                      child: Container(
                                                                                                                        width: 50.0,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                                                        ),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                                          child: Text(
                                                                                                                            containerPanierRecord.qty.toString(),
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'sf pro text',
                                                                                                                                  fontSize: 18.0,
                                                                                                                                  useGoogleFonts: false,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 40.0,
                                                                                                                      height: 30.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        borderRadius: BorderRadius.circular(9.0),
                                                                                                                      ),
                                                                                                                      child: InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          final panierUpdateData = {
                                                                                                                            ...createPanierRecordData(
                                                                                                                              mt: functions.reduce(functions.multippl(containerPanierRecord.prixperso, functions.addqty(containerPanierRecord.qty, 1)), rowProduitsRecord.pourcentage),
                                                                                                                            ),
                                                                                                                            'qty': FieldValue.increment(1),
                                                                                                                          };
                                                                                                                          await containerPanierRecord.reference.update(panierUpdateData);
                                                                                                                        },
                                                                                                                        child: Icon(
                                                                                                                          Icons.add,
                                                                                                                          color: Colors.white,
                                                                                                                          size: 20.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                );
                                                                                                              },
                                                                                                            ),
                                                                                                          ),
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                  child: StreamBuilder<ProduitsRecord>(
                                                                                                                    stream: ProduitsRecord.getDocument(containerPanierRecord.prodRef!),
                                                                                                                    builder: (context, snapshot) {
                                                                                                                      // Customize what your widget looks like when it's loading.
                                                                                                                      if (!snapshot.hasData) {
                                                                                                                        return Center(
                                                                                                                          child: SizedBox(
                                                                                                                            width: 10.0,
                                                                                                                            height: 10.0,
                                                                                                                            child: SpinKitPulse(
                                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                                              size: 10.0,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      }
                                                                                                                      final textProduitsRecord = snapshot.data!;
                                                                                                                      return Text(
                                                                                                                        '${containerPanierRecord.mt.toString()} FCFA',
                                                                                                                        textAlign: TextAlign.end,
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'sf pro text',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 18.0,
                                                                                                                              fontWeight: FontWeight.bold,
                                                                                                                              useGoogleFonts: false,
                                                                                                                            ),
                                                                                                                      );
                                                                                                                    },
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      );
                                                                                    }),
                                                                                  );
                                                                                },
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    if ((currentUserDocument?.nbreJour?.toList() ?? []).contains('dimanche') == false)
                                                                                      AuthUserStreamWidget(
                                                                                        builder: (context) => Container(
                                                                                          width: 40.0,
                                                                                          height: 30.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0x00FC6A57),
                                                                                            borderRadius: BorderRadius.circular(9.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              final panierCreateData = createPanierRecordData(
                                                                                                jour: 'dimanche',
                                                                                                id: random_data.randomString(
                                                                                                  10,
                                                                                                  10,
                                                                                                  true,
                                                                                                  true,
                                                                                                  true,
                                                                                                ),
                                                                                              );
                                                                                              var panierRecordReference = PanierRecord.createDoc(currentUserReference!);
                                                                                              await panierRecordReference.set(panierCreateData);
                                                                                              _model.pandim2 = PanierRecord.getDocumentFromData(panierCreateData, panierRecordReference);

                                                                                              final usersUpdateData = {
                                                                                                'nbreJour': FieldValue.arrayUnion(['dimanche']),
                                                                                              };
                                                                                              await currentUserReference!.update(usersUpdateData);

                                                                                              final precommandeCreateData = createPrecommandeRecordData(
                                                                                                jour: 'dimanche',
                                                                                              );
                                                                                              var precommandeRecordReference = PrecommandeRecord.collection.doc();
                                                                                              await precommandeRecordReference.set(precommandeCreateData);
                                                                                              _model.dimanche = PrecommandeRecord.getDocumentFromData(precommandeCreateData, precommandeRecordReference);

                                                                                              final panierUpdateData = createPanierRecordData(
                                                                                                ref: _model.pandim2!.reference,
                                                                                              );
                                                                                              await _model.pandim2!.reference.update(panierUpdateData);
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().addToRefdimanche(_model.pandim2!.reference);
                                                                                                FFAppState().addToAboRef2(_model.pandim2!.reference);
                                                                                              });

                                                                                              setState(() {});
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.add,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 20.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    if ((currentUserDocument?.nbreJour?.toList() ?? []).contains('dimanche') == true)
                                                                                      AuthUserStreamWidget(
                                                                                        builder: (context) => Container(
                                                                                          width: 40.0,
                                                                                          height: 30.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0x00FC6A57),
                                                                                            borderRadius: BorderRadius.circular(9.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              final panierCreateData = createPanierRecordData(
                                                                                                jour: 'dimanche',
                                                                                                id: random_data.randomString(
                                                                                                  10,
                                                                                                  10,
                                                                                                  true,
                                                                                                  true,
                                                                                                  true,
                                                                                                ),
                                                                                              );
                                                                                              var panierRecordReference = PanierRecord.createDoc(currentUserReference!);
                                                                                              await panierRecordReference.set(panierCreateData);
                                                                                              _model.pandim3 = PanierRecord.getDocumentFromData(panierCreateData, panierRecordReference);

                                                                                              final panierUpdateData = createPanierRecordData(
                                                                                                ref: _model.pandim3!.reference,
                                                                                              );
                                                                                              await _model.pandim3!.reference.update(panierUpdateData);
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().addToRefdimanche(_model.pandim3!.reference);
                                                                                                FFAppState().addToAboRef2(_model.pandim3!.reference);
                                                                                              });

                                                                                              setState(() {});
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.add,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 20.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    StreamBuilder<
                                                                        List<
                                                                            PanierRecord>>(
                                                                      stream:
                                                                          queryPanierRecord(
                                                                        parent:
                                                                            currentUserReference,
                                                                        queryBuilder: (panierRecord) => panierRecord.whereIn(
                                                                            'ref',
                                                                            FFAppState().aboRef2),
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 10.0,
                                                                              height: 10.0,
                                                                              child: SpinKitPulse(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 10.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<PanierRecord>
                                                                            containerPanierRecordList =
                                                                            snapshot.data!;
                                                                        final containerPanierRecord = containerPanierRecordList.isNotEmpty
                                                                            ? containerPanierRecordList.first
                                                                            : null;
                                                                        return Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Visibility(
                                                                            visible:
                                                                                (containerPanierRecord!.type != null && containerPanierRecord!.type != '') && (FFAppState().aboRef2.length.toString() != '0'),
                                                                            child:
                                                                                StreamBuilder<List<PanierRecord>>(
                                                                              stream: queryPanierRecord(
                                                                                parent: currentUserReference,
                                                                                queryBuilder: (panierRecord) => panierRecord.whereIn('ref', FFAppState().aboRef2),
                                                                              ),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 10.0,
                                                                                      height: 10.0,
                                                                                      child: SpinKitPulse(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 10.0,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                List<PanierRecord> containerdhjlPanierRecordList = snapshot.data!;
                                                                                return Container(
                                                                                  constraints: BoxConstraints(
                                                                                    maxWidth: 400.0,
                                                                                  ),
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x00272B50),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 35.0),
                                                                                    child: SingleChildScrollView(
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 20.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                    child: Text(
                                                                                                      'Sous Total',
                                                                                                      textAlign: TextAlign.start,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'sf pro text',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontSize: 16.0,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                    child: Text(
                                                                                                      '${functions.subtotal(containerdhjlPanierRecordList.map((e) => e.mt).toList()).toString()} FCFA',
                                                                                                      textAlign: TextAlign.end,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'sf pro text',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontSize: 18.0,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 20.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                    child: Text(
                                                                                                      'Frais Livraison',
                                                                                                      textAlign: TextAlign.start,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'sf pro text',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontSize: 16.0,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                    child: StreamBuilder<List<FraisLivraisonRecord>>(
                                                                                                      stream: queryFraisLivraisonRecord(
                                                                                                        singleRecord: true,
                                                                                                      ),
                                                                                                      builder: (context, snapshot) {
                                                                                                        // Customize what your widget looks like when it's loading.
                                                                                                        if (!snapshot.hasData) {
                                                                                                          return Center(
                                                                                                            child: SizedBox(
                                                                                                              width: 10.0,
                                                                                                              height: 10.0,
                                                                                                              child: SpinKitPulse(
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                size: 10.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        }
                                                                                                        List<FraisLivraisonRecord> textFraisLivraisonRecordList = snapshot.data!;
                                                                                                        final textFraisLivraisonRecord = textFraisLivraisonRecordList.isNotEmpty ? textFraisLivraisonRecordList.first : null;
                                                                                                        return Text(
                                                                                                          '${functions.livreAbo(textFraisLivraisonRecord!.nom, abonnementUsersRecord.nbreJour.length, abonnementUsersRecord.abonnLivraison).toString()} FCFA',
                                                                                                          textAlign: TextAlign.end,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'sf pro text',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontSize: 18.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                useGoogleFonts: false,
                                                                                                              ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 20.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                    child: Text(
                                                                                                      'Total',
                                                                                                      textAlign: TextAlign.start,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'sf pro text',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontSize: 28.0,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                    child: StreamBuilder<List<FraisLivraisonRecord>>(
                                                                                                      stream: queryFraisLivraisonRecord(
                                                                                                        singleRecord: true,
                                                                                                      ),
                                                                                                      builder: (context, snapshot) {
                                                                                                        // Customize what your widget looks like when it's loading.
                                                                                                        if (!snapshot.hasData) {
                                                                                                          return Center(
                                                                                                            child: SizedBox(
                                                                                                              width: 10.0,
                                                                                                              height: 10.0,
                                                                                                              child: SpinKitPulse(
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                size: 10.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        }
                                                                                                        List<FraisLivraisonRecord> textFraisLivraisonRecordList = snapshot.data!;
                                                                                                        final textFraisLivraisonRecord = textFraisLivraisonRecordList.isNotEmpty ? textFraisLivraisonRecordList.first : null;
                                                                                                        return Text(
                                                                                                          '${functions.ttc(functions.subtotal(containerdhjlPanierRecordList.map((e) => e.mt).toList()), functions.livreAbo(textFraisLivraisonRecord!.nom, abonnementUsersRecord.nbreJour.length, abonnementUsersRecord.abonnLivraison)).toString()} FCFA',
                                                                                                          textAlign: TextAlign.end,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'sf pro text',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontSize: 22.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                useGoogleFonts: false,
                                                                                                              ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Form(
                                                                                            key: _model.formKey,
                                                                                            autovalidateMode: AutovalidateMode.disabled,
                                                                                            child: StreamBuilder<UsersRecord>(
                                                                                              stream: UsersRecord.getDocument(currentUserReference!),
                                                                                              builder: (context, snapshot) {
                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                if (!snapshot.hasData) {
                                                                                                  return Center(
                                                                                                    child: SizedBox(
                                                                                                      width: 10.0,
                                                                                                      height: 10.0,
                                                                                                      child: SpinKitPulse(
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        size: 10.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }
                                                                                                final columnUsersRecord = snapshot.data!;
                                                                                                return Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 20.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                                              child: FlutterFlowPlacePicker(
                                                                                                                iOSGoogleMapsApiKey: 'AIzaSyCRGKk3dJAAsplwPXQ2Vnnlg07i28ERsb8',
                                                                                                                androidGoogleMapsApiKey: 'AIzaSyBssFwtKUm1SeYwXoX2mcHCqrGez2r6eP4',
                                                                                                                webGoogleMapsApiKey: 'AIzaSyB5sjnjOQ2_0K76Dm8zJRa6N5KQ1sCeuJI',
                                                                                                                onSelect: (place) async {
                                                                                                                  setState(() => _model.placePickerValue = place);
                                                                                                                },
                                                                                                                defaultText: 'Lieu de livraison',
                                                                                                                icon: Icon(
                                                                                                                  Icons.place,
                                                                                                                  color: Colors.white,
                                                                                                                  size: 16.0,
                                                                                                                ),
                                                                                                                buttonOptions: FFButtonOptions(
                                                                                                                  width: 200.0,
                                                                                                                  height: 40.0,
                                                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                        fontFamily: 'sf pro text',
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        useGoogleFonts: false,
                                                                                                                      ),
                                                                                                                  borderSide: BorderSide(
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                    width: 2.0,
                                                                                                                  ),
                                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                                  child: FFButtonWidget(
                                                                                                                    onPressed: () async {
                                                                                                                      final _datePickedTime = await showTimePicker(
                                                                                                                        context: context,
                                                                                                                        initialTime: TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                                                                      );
                                                                                                                      if (_datePickedTime != null) {
                                                                                                                        setState(() {
                                                                                                                          _model.datePicked = DateTime(
                                                                                                                            getCurrentTimestamp.year,
                                                                                                                            getCurrentTimestamp.month,
                                                                                                                            getCurrentTimestamp.day,
                                                                                                                            _datePickedTime.hour,
                                                                                                                            _datePickedTime.minute,
                                                                                                                          );
                                                                                                                        });
                                                                                                                      }
                                                                                                                    },
                                                                                                                    text: 'Choisir  la date et l\'heure de livraison',
                                                                                                                    options: FFButtonOptions(
                                                                                                                      width: 130.0,
                                                                                                                      height: 40.0,
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                            fontFamily: 'sf pro text',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            fontSize: 13.0,
                                                                                                                            useGoogleFonts: false,
                                                                                                                          ),
                                                                                                                      elevation: 2.0,
                                                                                                                      borderSide: BorderSide(
                                                                                                                        color: Colors.transparent,
                                                                                                                        width: 1.0,
                                                                                                                      ),
                                                                                                                      borderRadius: BorderRadius.circular(13.0),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                          if (_model.datePicked != null)
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                valueOrDefault<String>(
                                                                                                                  dateTimeFormat(
                                                                                                                    'Hm',
                                                                                                                    _model.datePicked,
                                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                                  ),
                                                                                                                  'Aucune date sélectionné',
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                              ),
                                                                                                            ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(30.0, 16.0, 20.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                              child: TextFormField(
                                                                                                                controller: _model.textController1,
                                                                                                                onFieldSubmitted: (_) async {
                                                                                                                  FFAppState().update(() {
                                                                                                                    FFAppState().indication = _model.textController1.text;
                                                                                                                  });
                                                                                                                },
                                                                                                                obscureText: false,
                                                                                                                decoration: InputDecoration(
                                                                                                                  hintText: 'Courte indication',
                                                                                                                  hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                        fontFamily: 'sf pro text',
                                                                                                                        fontSize: 16.0,
                                                                                                                        useGoogleFonts: false,
                                                                                                                      ),
                                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                      width: 2.0,
                                                                                                                    ),
                                                                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                                                                  ),
                                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: Color(0x00000000),
                                                                                                                      width: 2.0,
                                                                                                                    ),
                                                                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                                                                  ),
                                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: Color(0x00000000),
                                                                                                                      width: 2.0,
                                                                                                                    ),
                                                                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                                                                  ),
                                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: Color(0x00000000),
                                                                                                                      width: 2.0,
                                                                                                                    ),
                                                                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                      fontSize: 18.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                      lineHeight: 2.0,
                                                                                                                    ),
                                                                                                                maxLines: 5,
                                                                                                                validator: _model.textController1Validator.asValidator(context),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(30.0, 16.0, 20.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          FlutterFlowDropDown<String>(
                                                                                                            controller: _model.dropDownValueController1 ??= FormFieldController<String>(
                                                                                                              _model.dropDownValue1 ??= '+229',
                                                                                                            ),
                                                                                                            options: ['+229'],
                                                                                                            onChanged: (val) => setState(() => _model.dropDownValue1 = val),
                                                                                                            width: 120.0,
                                                                                                            height: 60.0,
                                                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'sf pro text',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 18.0,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                            hintText: 'Votre Opérateur Réseau',
                                                                                                            icon: Icon(
                                                                                                              Icons.arrow_drop_down,
                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                              size: 30.0,
                                                                                                            ),
                                                                                                            fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                            elevation: 2.0,
                                                                                                            borderColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            borderWidth: 2.0,
                                                                                                            borderRadius: 10.0,
                                                                                                            margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                                            hidesUnderline: true,
                                                                                                            isSearchable: false,
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                              child: TextFormField(
                                                                                                                controller: _model.textController2,
                                                                                                                obscureText: false,
                                                                                                                decoration: InputDecoration(
                                                                                                                  hintText: 'Numéro MOMO',
                                                                                                                  hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                        fontFamily: 'sf pro text',
                                                                                                                        fontSize: 16.0,
                                                                                                                        useGoogleFonts: false,
                                                                                                                      ),
                                                                                                                  enabledBorder: UnderlineInputBorder(
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                      width: 2.0,
                                                                                                                    ),
                                                                                                                    borderRadius: const BorderRadius.only(
                                                                                                                      topLeft: Radius.circular(4.0),
                                                                                                                      topRight: Radius.circular(4.0),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  focusedBorder: UnderlineInputBorder(
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: Color(0x00000000),
                                                                                                                      width: 2.0,
                                                                                                                    ),
                                                                                                                    borderRadius: const BorderRadius.only(
                                                                                                                      topLeft: Radius.circular(4.0),
                                                                                                                      topRight: Radius.circular(4.0),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  errorBorder: UnderlineInputBorder(
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: Color(0x00000000),
                                                                                                                      width: 2.0,
                                                                                                                    ),
                                                                                                                    borderRadius: const BorderRadius.only(
                                                                                                                      topLeft: Radius.circular(4.0),
                                                                                                                      topRight: Radius.circular(4.0),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  focusedErrorBorder: UnderlineInputBorder(
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: Color(0x00000000),
                                                                                                                      width: 2.0,
                                                                                                                    ),
                                                                                                                    borderRadius: const BorderRadius.only(
                                                                                                                      topLeft: Radius.circular(4.0),
                                                                                                                      topRight: Radius.circular(4.0),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                      fontSize: 18.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                      lineHeight: 2.0,
                                                                                                                    ),
                                                                                                                validator: _model.textController2Validator.asValidator(context),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(30.0, 16.0, 20.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: FlutterFlowDropDown<String>(
                                                                                                              controller: _model.reseauValueController ??= FormFieldController<String>(
                                                                                                                _model.reseauValue ??= valueOrDefault<String>(
                                                                                                                  FFAppState().reseau,
                                                                                                                  'mtn',
                                                                                                                ),
                                                                                                              ),
                                                                                                              options: ['mtn', 'moov'],
                                                                                                              onChanged: (val) => setState(() => _model.reseauValue = val),
                                                                                                              width: 180.0,
                                                                                                              height: 60.0,
                                                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'sf pro text',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 24.0,
                                                                                                                    useGoogleFonts: false,
                                                                                                                  ),
                                                                                                              hintText: 'Votre Opérateur Réseau',
                                                                                                              icon: Icon(
                                                                                                                Icons.arrow_drop_down,
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                size: 30.0,
                                                                                                              ),
                                                                                                              fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                              elevation: 2.0,
                                                                                                              borderColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                              borderWidth: 2.0,
                                                                                                              borderRadius: 10.0,
                                                                                                              margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                                              hidesUnderline: true,
                                                                                                              isSearchable: false,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(30.0, 16.0, 20.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          FlutterFlowDropDown<String>(
                                                                                                            controller: _model.dropDownValueController2 ??= FormFieldController<String>(
                                                                                                              _model.dropDownValue2 ??= '+229',
                                                                                                            ),
                                                                                                            options: ['+229'],
                                                                                                            onChanged: (val) => setState(() => _model.dropDownValue2 = val),
                                                                                                            width: 120.0,
                                                                                                            height: 60.0,
                                                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'sf pro text',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 18.0,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                            hintText: 'Votre Opérateur Réseau',
                                                                                                            icon: Icon(
                                                                                                              Icons.arrow_drop_down,
                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                              size: 30.0,
                                                                                                            ),
                                                                                                            fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                            elevation: 2.0,
                                                                                                            borderColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            borderWidth: 2.0,
                                                                                                            borderRadius: 10.0,
                                                                                                            margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                                            hidesUnderline: true,
                                                                                                            isSearchable: false,
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                              child: TextFormField(
                                                                                                                controller: _model.textController3,
                                                                                                                obscureText: false,
                                                                                                                decoration: InputDecoration(
                                                                                                                  hintText: 'Numéro  Joignable',
                                                                                                                  hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                        fontFamily: 'sf pro text',
                                                                                                                        fontSize: 16.0,
                                                                                                                        useGoogleFonts: false,
                                                                                                                      ),
                                                                                                                  enabledBorder: UnderlineInputBorder(
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                      width: 2.0,
                                                                                                                    ),
                                                                                                                    borderRadius: const BorderRadius.only(
                                                                                                                      topLeft: Radius.circular(4.0),
                                                                                                                      topRight: Radius.circular(4.0),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  focusedBorder: UnderlineInputBorder(
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: Color(0x00000000),
                                                                                                                      width: 2.0,
                                                                                                                    ),
                                                                                                                    borderRadius: const BorderRadius.only(
                                                                                                                      topLeft: Radius.circular(4.0),
                                                                                                                      topRight: Radius.circular(4.0),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  errorBorder: UnderlineInputBorder(
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: Color(0x00000000),
                                                                                                                      width: 2.0,
                                                                                                                    ),
                                                                                                                    borderRadius: const BorderRadius.only(
                                                                                                                      topLeft: Radius.circular(4.0),
                                                                                                                      topRight: Radius.circular(4.0),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  focusedErrorBorder: UnderlineInputBorder(
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: Color(0x00000000),
                                                                                                                      width: 2.0,
                                                                                                                    ),
                                                                                                                    borderRadius: const BorderRadius.only(
                                                                                                                      topLeft: Radius.circular(4.0),
                                                                                                                      topRight: Radius.circular(4.0),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                      fontSize: 18.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                      lineHeight: 2.0,
                                                                                                                    ),
                                                                                                                validator: _model.textController3Validator.asValidator(context),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 20.0, 0.0),
                                                                                                      child: StreamBuilder<List<FraisLivraisonRecord>>(
                                                                                                        stream: queryFraisLivraisonRecord(
                                                                                                          singleRecord: true,
                                                                                                        ),
                                                                                                        builder: (context, snapshot) {
                                                                                                          // Customize what your widget looks like when it's loading.
                                                                                                          if (!snapshot.hasData) {
                                                                                                            return Center(
                                                                                                              child: SizedBox(
                                                                                                                width: 10.0,
                                                                                                                height: 10.0,
                                                                                                                child: SpinKitPulse(
                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                  size: 10.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          }
                                                                                                          List<FraisLivraisonRecord> rowFraisLivraisonRecordList = snapshot.data!;
                                                                                                          final rowFraisLivraisonRecord = rowFraisLivraisonRecordList.isNotEmpty ? rowFraisLivraisonRecordList.first : null;
                                                                                                          return Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 25.0),
                                                                                                                  child: FFButtonWidget(
                                                                                                                    onPressed: () async {
                                                                                                                      currentUserLocationValue = await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                                                                      if (_model.formKey.currentState == null || !_model.formKey.currentState!.validate()) {
                                                                                                                        return;
                                                                                                                      }
                                                                                                                      if (_model.placePickerValue == FFPlace()) {
                                                                                                                        return;
                                                                                                                      }
                                                                                                                      if (_model.datePicked == null) {
                                                                                                                        return;
                                                                                                                      }
                                                                                                                      if (_model.dropDownValue1 == null) {
                                                                                                                        return;
                                                                                                                      }
                                                                                                                      if (_model.dropDownValue2 == null) {
                                                                                                                        return;
                                                                                                                      }
                                                                                                                      if (_model.reseauValue == null) {
                                                                                                                        return;
                                                                                                                      }
                                                                                                                      _model.apiResulty73 = await TransactionGenererCall.call(
                                                                                                                        description: random_data.randomString(
                                                                                                                          10,
                                                                                                                          10,
                                                                                                                          true,
                                                                                                                          true,
                                                                                                                          true,
                                                                                                                        ),
                                                                                                                        amount: functions.ttc(functions.subtotal(containerdhjlPanierRecordList.map((e) => e.mt).toList()), functions.livreAbo(rowFraisLivraisonRecord!.nom, columnUsersRecord.nbreJour.length, columnUsersRecord.abonnLivraison)).toString(),
                                                                                                                        currency: 'XOF',
                                                                                                                        callbackUrl: 'https://maplateforme.com/callback',
                                                                                                                        firstname: columnUsersRecord.prenom,
                                                                                                                        lastname: columnUsersRecord.nom,
                                                                                                                        email: currentUserEmail,
                                                                                                                        number: functions.phone(_model.dropDownValue1!, _model.textController2.text),
                                                                                                                        country: 'bj',
                                                                                                                      );
                                                                                                                      if ((_model.apiResulty73?.succeeded ?? true)) {
                                                                                                                        _model.apiResultldm = await TransactionsTokenCall.call(
                                                                                                                          id: getJsonField(
                                                                                                                            (_model.apiResulty73?.jsonBody ?? ''),
                                                                                                                            r'''$..id''',
                                                                                                                          ).toString(),
                                                                                                                        );
                                                                                                                        _model.apiResultyz8 = await PaiementSansRediCall.call(
                                                                                                                          token: getJsonField(
                                                                                                                            (_model.apiResultldm?.jsonBody ?? ''),
                                                                                                                            r'''$.token''',
                                                                                                                          ).toString(),
                                                                                                                          moyensPaie: _model.reseauValue,
                                                                                                                        );
                                                                                                                        await Future.delayed(const Duration(milliseconds: 60000));
                                                                                                                        _model.apiResultyz812 = await StatutCall.call(
                                                                                                                          id: PaiementSansRediCall.idd(
                                                                                                                            (_model.apiResultyz8?.jsonBody ?? ''),
                                                                                                                          ).toString(),
                                                                                                                        );
                                                                                                                        if (StatutCall.stat(
                                                                                                                              (_model.apiResultyz812?.jsonBody ?? ''),
                                                                                                                            ).toString() ==
                                                                                                                            'approved') {
                                                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                            SnackBar(
                                                                                                                              content: Text(
                                                                                                                                'Payé avec succès',
                                                                                                                                style: TextStyle(
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              duration: Duration(milliseconds: 4000),
                                                                                                                              backgroundColor: FlutterFlowTheme.of(context).tertiary400,
                                                                                                                            ),
                                                                                                                          );
                                                                                                                          triggerPushNotification(
                                                                                                                            notificationTitle: 'Félicitation !',
                                                                                                                            notificationText: 'Félicitations ! Votre commande a été validée et payée avec succès. Votre livraison est en cours de préparation et arrivera sous peu. Merci d\'utiliser Zemfood !',
                                                                                                                            notificationImageUrl: FFAppState().zemfoodLogo,
                                                                                                                            notificationSound: 'default',
                                                                                                                            userRefs: [currentUserReference!],
                                                                                                                            initialPageName: 'Accueil',
                                                                                                                            parameterData: {},
                                                                                                                          );
                                                                                                                          if (columnUsersRecord.nbreJour.contains('dimanche') == true) {
                                                                                                                            final precommandeUpdateData1 = {
                                                                                                                              ...createPrecommandeRecordData(
                                                                                                                                refcli: currentUserReference,
                                                                                                                                date: _model.datePicked,
                                                                                                                                nom: random_data.randomString(
                                                                                                                                  10,
                                                                                                                                  10,
                                                                                                                                  true,
                                                                                                                                  true,
                                                                                                                                  true,
                                                                                                                                ),
                                                                                                                                statut: 'Payé',
                                                                                                                                livrer: false,
                                                                                                                                dateAjout: getCurrentTimestamp,
                                                                                                                                datepay: getCurrentTimestamp,
                                                                                                                                lieu: _model.placePickerValue.name,
                                                                                                                                e1: true,
                                                                                                                                e2: false,
                                                                                                                                e3: false,
                                                                                                                                e4: false,
                                                                                                                                e5: false,
                                                                                                                                numero: _model.textController3.text,
                                                                                                                                indication: _model.textController1.text,
                                                                                                                                attribution: false,
                                                                                                                                soustot: functions.subtotal(containerPanierRecordList.map((e) => e.mt).toList()),
                                                                                                                                totalpaye: functions.ttc(functions.subtotal(containerPanierRecordList.map((e) => e.mt).toList()), functions.livreAbo(rowFraisLivraisonRecord!.nom, columnUsersRecord.nbreJour.length, columnUsersRecord.abonnLivraison)),
                                                                                                                                aboLivre: true,
                                                                                                                                positionClient: currentUserLocationValue,
                                                                                                                                lieu2: _model.placePickerValue.latLng,
                                                                                                                                bon: true,
                                                                                                                              ),
                                                                                                                              'listecom': FFAppState().refdimanche,
                                                                                                                            };
                                                                                                                            await _model.dimanche!.reference.update(precommandeUpdateData1);
                                                                                                                          }
                                                                                                                          if (columnUsersRecord.nbreJour.contains('samedi') == true) {
                                                                                                                            final precommandeUpdateData2 = {
                                                                                                                              ...createPrecommandeRecordData(
                                                                                                                                refcli: currentUserReference,
                                                                                                                                date: _model.datePicked,
                                                                                                                                nom: random_data.randomString(
                                                                                                                                  10,
                                                                                                                                  10,
                                                                                                                                  true,
                                                                                                                                  true,
                                                                                                                                  true,
                                                                                                                                ),
                                                                                                                                statut: 'Payé',
                                                                                                                                livrer: false,
                                                                                                                                dateAjout: getCurrentTimestamp,
                                                                                                                                datepay: getCurrentTimestamp,
                                                                                                                                lieu: _model.placePickerValue.name,
                                                                                                                                e1: true,
                                                                                                                                e2: false,
                                                                                                                                e3: false,
                                                                                                                                e4: false,
                                                                                                                                e5: false,
                                                                                                                                numero: _model.textController3.text,
                                                                                                                                indication: _model.textController1.text,
                                                                                                                                attribution: false,
                                                                                                                                soustot: functions.subtotal(containerPanierRecordList.map((e) => e.mt).toList()),
                                                                                                                                totalpaye: functions.ttc(functions.subtotal(containerPanierRecordList.map((e) => e.mt).toList()), functions.livreAbo(rowFraisLivraisonRecord!.nom, columnUsersRecord.nbreJour.length, columnUsersRecord.abonnLivraison)),
                                                                                                                                aboLivre: true,
                                                                                                                                positionClient: currentUserLocationValue,
                                                                                                                                lieu2: _model.placePickerValue.latLng,
                                                                                                                                bon: true,
                                                                                                                              ),
                                                                                                                              'listecom': FFAppState().refsamedi,
                                                                                                                            };
                                                                                                                            await _model.samedi!.reference.update(precommandeUpdateData2);
                                                                                                                          }
                                                                                                                          if (columnUsersRecord.nbreJour.contains('vendredi') == true) {
                                                                                                                            final precommandeUpdateData3 = {
                                                                                                                              ...createPrecommandeRecordData(
                                                                                                                                refcli: currentUserReference,
                                                                                                                                date: _model.datePicked,
                                                                                                                                nom: random_data.randomString(
                                                                                                                                  10,
                                                                                                                                  10,
                                                                                                                                  true,
                                                                                                                                  true,
                                                                                                                                  true,
                                                                                                                                ),
                                                                                                                                statut: 'Payé',
                                                                                                                                livrer: false,
                                                                                                                                dateAjout: getCurrentTimestamp,
                                                                                                                                datepay: getCurrentTimestamp,
                                                                                                                                lieu: _model.placePickerValue.name,
                                                                                                                                e1: true,
                                                                                                                                e2: false,
                                                                                                                                e3: false,
                                                                                                                                e4: false,
                                                                                                                                e5: false,
                                                                                                                                numero: _model.textController3.text,
                                                                                                                                indication: _model.textController1.text,
                                                                                                                                attribution: false,
                                                                                                                                soustot: functions.subtotal(containerPanierRecordList.map((e) => e.mt).toList()),
                                                                                                                                totalpaye: functions.ttc(functions.subtotal(containerPanierRecordList.map((e) => e.mt).toList()), functions.livreAbo(rowFraisLivraisonRecord!.nom, columnUsersRecord.nbreJour.length, columnUsersRecord.abonnLivraison)),
                                                                                                                                aboLivre: true,
                                                                                                                                positionClient: currentUserLocationValue,
                                                                                                                                lieu2: _model.placePickerValue.latLng,
                                                                                                                                bon: true,
                                                                                                                              ),
                                                                                                                              'listecom': FFAppState().refvendredi,
                                                                                                                            };
                                                                                                                            await _model.jeudi!.reference.update(precommandeUpdateData3);
                                                                                                                          }
                                                                                                                          if (columnUsersRecord.nbreJour.contains('jeudi') == true) {
                                                                                                                            final precommandeUpdateData4 = {
                                                                                                                              ...createPrecommandeRecordData(
                                                                                                                                refcli: currentUserReference,
                                                                                                                                date: _model.datePicked,
                                                                                                                                nom: random_data.randomString(
                                                                                                                                  10,
                                                                                                                                  10,
                                                                                                                                  true,
                                                                                                                                  true,
                                                                                                                                  true,
                                                                                                                                ),
                                                                                                                                statut: 'Payé',
                                                                                                                                livrer: false,
                                                                                                                                dateAjout: getCurrentTimestamp,
                                                                                                                                datepay: getCurrentTimestamp,
                                                                                                                                lieu: _model.placePickerValue.name,
                                                                                                                                e1: true,
                                                                                                                                e2: false,
                                                                                                                                e3: false,
                                                                                                                                e4: false,
                                                                                                                                e5: false,
                                                                                                                                numero: _model.textController3.text,
                                                                                                                                indication: _model.textController1.text,
                                                                                                                                attribution: false,
                                                                                                                                soustot: functions.subtotal(containerPanierRecordList.map((e) => e.mt).toList()),
                                                                                                                                totalpaye: functions.ttc(functions.subtotal(containerPanierRecordList.map((e) => e.mt).toList()), functions.livreAbo(rowFraisLivraisonRecord!.nom, columnUsersRecord.nbreJour.length, columnUsersRecord.abonnLivraison)),
                                                                                                                                aboLivre: true,
                                                                                                                                positionClient: currentUserLocationValue,
                                                                                                                                lieu2: _model.placePickerValue.latLng,
                                                                                                                                bon: true,
                                                                                                                              ),
                                                                                                                              'listecom': FFAppState().refjeudi,
                                                                                                                            };
                                                                                                                            await _model.jeudi!.reference.update(precommandeUpdateData4);
                                                                                                                          }
                                                                                                                          if (columnUsersRecord.nbreJour.contains('mercredi') == true) {
                                                                                                                            final precommandeUpdateData5 = {
                                                                                                                              ...createPrecommandeRecordData(
                                                                                                                                refcli: currentUserReference,
                                                                                                                                date: _model.datePicked,
                                                                                                                                nom: random_data.randomString(
                                                                                                                                  10,
                                                                                                                                  10,
                                                                                                                                  true,
                                                                                                                                  true,
                                                                                                                                  true,
                                                                                                                                ),
                                                                                                                                statut: 'Payé',
                                                                                                                                livrer: false,
                                                                                                                                dateAjout: getCurrentTimestamp,
                                                                                                                                datepay: getCurrentTimestamp,
                                                                                                                                lieu: _model.placePickerValue.name,
                                                                                                                                e1: true,
                                                                                                                                e2: false,
                                                                                                                                e3: false,
                                                                                                                                e4: false,
                                                                                                                                e5: false,
                                                                                                                                numero: _model.textController3.text,
                                                                                                                                indication: _model.textController1.text,
                                                                                                                                attribution: false,
                                                                                                                                soustot: functions.subtotal(containerPanierRecordList.map((e) => e.mt).toList()),
                                                                                                                                totalpaye: functions.ttc(functions.subtotal(containerPanierRecordList.map((e) => e.mt).toList()), functions.livreAbo(rowFraisLivraisonRecord!.nom, columnUsersRecord.nbreJour.length, columnUsersRecord.abonnLivraison)),
                                                                                                                                aboLivre: true,
                                                                                                                                positionClient: currentUserLocationValue,
                                                                                                                                lieu2: _model.placePickerValue.latLng,
                                                                                                                                bon: true,
                                                                                                                              ),
                                                                                                                              'listecom': FFAppState().refmercredi,
                                                                                                                            };
                                                                                                                            await _model.mercredi!.reference.update(precommandeUpdateData5);
                                                                                                                          }
                                                                                                                          if (columnUsersRecord.nbreJour.contains('mardi') == true) {
                                                                                                                            final precommandeUpdateData6 = {
                                                                                                                              ...createPrecommandeRecordData(
                                                                                                                                refcli: currentUserReference,
                                                                                                                                date: _model.datePicked,
                                                                                                                                nom: random_data.randomString(
                                                                                                                                  10,
                                                                                                                                  10,
                                                                                                                                  true,
                                                                                                                                  true,
                                                                                                                                  true,
                                                                                                                                ),
                                                                                                                                statut: 'Payé',
                                                                                                                                livrer: false,
                                                                                                                                dateAjout: getCurrentTimestamp,
                                                                                                                                datepay: getCurrentTimestamp,
                                                                                                                                lieu: _model.placePickerValue.name,
                                                                                                                                e1: true,
                                                                                                                                e2: false,
                                                                                                                                e3: false,
                                                                                                                                e4: false,
                                                                                                                                e5: false,
                                                                                                                                numero: _model.textController3.text,
                                                                                                                                indication: _model.textController1.text,
                                                                                                                                attribution: false,
                                                                                                                                soustot: functions.subtotal(containerPanierRecordList.map((e) => e.mt).toList()),
                                                                                                                                totalpaye: functions.ttc(functions.subtotal(containerPanierRecordList.map((e) => e.mt).toList()), functions.livreAbo(rowFraisLivraisonRecord!.nom, columnUsersRecord.nbreJour.length, columnUsersRecord.abonnLivraison)),
                                                                                                                                aboLivre: true,
                                                                                                                                positionClient: currentUserLocationValue,
                                                                                                                                lieu2: _model.placePickerValue.latLng,
                                                                                                                                bon: true,
                                                                                                                              ),
                                                                                                                              'listecom': FFAppState().refmardi,
                                                                                                                            };
                                                                                                                            await _model.mardi!.reference.update(precommandeUpdateData6);
                                                                                                                          }
                                                                                                                          if (columnUsersRecord.nbreJour.contains('lundi') == true) {
                                                                                                                            final precommandeUpdateData7 = {
                                                                                                                              ...createPrecommandeRecordData(
                                                                                                                                refcli: currentUserReference,
                                                                                                                                date: _model.datePicked,
                                                                                                                                nom: random_data.randomString(
                                                                                                                                  10,
                                                                                                                                  10,
                                                                                                                                  true,
                                                                                                                                  true,
                                                                                                                                  true,
                                                                                                                                ),
                                                                                                                                statut: 'Payé',
                                                                                                                                livrer: false,
                                                                                                                                dateAjout: getCurrentTimestamp,
                                                                                                                                datepay: getCurrentTimestamp,
                                                                                                                                lieu: _model.placePickerValue.name,
                                                                                                                                e1: true,
                                                                                                                                e2: false,
                                                                                                                                e3: false,
                                                                                                                                e4: false,
                                                                                                                                e5: false,
                                                                                                                                numero: _model.textController3.text,
                                                                                                                                indication: _model.textController1.text,
                                                                                                                                attribution: false,
                                                                                                                                soustot: functions.subtotal(container1111PanierRecordList.map((e) => e.mt).toList()),
                                                                                                                                totalpaye: functions.ttc(functions.subtotal(container1111PanierRecordList.map((e) => e.mt).toList()), functions.livreAbo(rowFraisLivraisonRecord!.nom, columnUsersRecord.nbreJour.length, columnUsersRecord.abonnLivraison)),
                                                                                                                                aboLivre: true,
                                                                                                                                positionClient: currentUserLocationValue,
                                                                                                                                lieu2: _model.placePickerValue.latLng,
                                                                                                                                bon: true,
                                                                                                                              ),
                                                                                                                              'listecom': FFAppState().reflundi,
                                                                                                                            };
                                                                                                                            await _model.lundi!.reference.update(precommandeUpdateData7);
                                                                                                                          }
                                                                                                                          FFAppState().update(() {
                                                                                                                            FFAppState().refmercredi = [];
                                                                                                                          });

                                                                                                                          final usersUpdateData = {
                                                                                                                            'nbreJour': FieldValue.delete(),
                                                                                                                          };
                                                                                                                          await columnUsersRecord.reference.update(usersUpdateData);
                                                                                                                          FFAppState().update(() {
                                                                                                                            FFAppState().refmardi = [];
                                                                                                                            FFAppState().id = [];
                                                                                                                          });
                                                                                                                          FFAppState().update(() {
                                                                                                                            FFAppState().reflundi = [];
                                                                                                                            FFAppState().refjeudi = [];
                                                                                                                          });
                                                                                                                          FFAppState().update(() {
                                                                                                                            FFAppState().aboRef2 = [];
                                                                                                                            FFAppState().refvendredi = [];
                                                                                                                          });
                                                                                                                          FFAppState().update(() {
                                                                                                                            FFAppState().refdimanche = [];
                                                                                                                            FFAppState().refsamedi = [];
                                                                                                                          });
                                                                                                                          FFAppState().update(() {
                                                                                                                            FFAppState().indication = _model.textController1.text;
                                                                                                                            FFAppState().momo = _model.textController2.text;
                                                                                                                            FFAppState().reseau = _model.reseauValue!;
                                                                                                                            FFAppState().joignable = _model.textController3.text;
                                                                                                                          });
                                                                                                                          FFAppState().update(() {
                                                                                                                            FFAppState().tabAbo = true;
                                                                                                                          });

                                                                                                                          context.goNamed('cart2');
                                                                                                                        }
                                                                                                                      } else {
                                                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                          SnackBar(
                                                                                                                            content: Text(
                                                                                                                              'Veuillez vérifiez votre numéro momo ou fond insuffisant',
                                                                                                                              style: TextStyle(
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            duration: Duration(milliseconds: 4000),
                                                                                                                            backgroundColor: FlutterFlowTheme.of(context).tertiary400,
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      }

                                                                                                                      setState(() {});
                                                                                                                    },
                                                                                                                    text: 'Payer Maintenant',
                                                                                                                    options: FFButtonOptions(
                                                                                                                      width: 130.0,
                                                                                                                      height: 50.0,
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                            fontFamily: 'sf pro text',
                                                                                                                            color: Colors.white,
                                                                                                                            fontSize: 18.0,
                                                                                                                            useGoogleFonts: false,
                                                                                                                          ),
                                                                                                                      elevation: 2.0,
                                                                                                                      borderSide: BorderSide(
                                                                                                                        color: Colors.transparent,
                                                                                                                        width: 1.0,
                                                                                                                      ),
                                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          );
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
