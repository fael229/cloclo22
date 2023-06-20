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
import 'moyen_paiement_model.dart';
export 'moyen_paiement_model.dart';

class MoyenPaiementWidget extends StatefulWidget {
  const MoyenPaiementWidget({
    Key? key,
    this.refComm,
    this.prod,
  }) : super(key: key);

  final DocumentReference? refComm;
  final DocumentReference? prod;

  @override
  _MoyenPaiementWidgetState createState() => _MoyenPaiementWidgetState();
}

class _MoyenPaiementWidgetState extends State<MoyenPaiementWidget> {
  late MoyenPaiementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoyenPaiementModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'moyenPaiement'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      setState(() {
        FFAppState().localisationClient = currentUserLocationValue;
      });
      await actions.lockOrientation();
    });

    _model.textField125Controller ??=
        TextEditingController(text: FFAppState().indication);
    _model.textFieldmomo111Controller ??=
        TextEditingController(text: FFAppState().momo);
    _model.textFieldjoi222Controller ??=
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

    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) =>
            usersRecord.where('livreur', isEqualTo: true),
      ),
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
        List<UsersRecord> moyenPaiementUsersRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
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
                  final stackUsersRecord = snapshot.data!;
                  return Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 60.0,
                                    icon: Icon(
                                      FFIcons.kfiRrArrowLeft,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 30.0,
                                    ),
                                    onPressed: () async {
                                      context.pop();
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 20.0, 0.0, 0.0),
                                    child: Text(
                                      'Paiement Commande',
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            StreamBuilder<List<PanierRecord>>(
                              stream: queryPanierRecord(
                                parent: currentUserReference,
                                queryBuilder: (panierRecord) => panierRecord
                                    .whereIn('ref', FFAppState().panieRef),
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
                                List<PanierRecord> containerPanierRecordList =
                                    snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  constraints: BoxConstraints(
                                    maxWidth: 500.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0x00272B50),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 35.0),
                                    child: StreamBuilder<PrecommandeRecord>(
                                      stream: PrecommandeRecord.getDocument(
                                          widget.refComm!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 10.0,
                                              height: 10.0,
                                              child: SpinKitPulse(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 10.0,
                                              ),
                                            ),
                                          );
                                        }
                                        final columnPrecommandeRecord =
                                            snapshot.data!;
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 20.0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      1.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x00FFFFFF),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 5.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final panChild =
                                                            FFAppState()
                                                                .panieRef
                                                                .toList();
                                                        return SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: List.generate(
                                                                panChild.length,
                                                                (panChildIndex) {
                                                              final panChildItem =
                                                                  panChild[
                                                                      panChildIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            4.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      1.0,
                                                                  height: 130.0,
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth:
                                                                        500.0,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            10.0,
                                                                            10.0,
                                                                            10.0),
                                                                    child: StreamBuilder<
                                                                        PanierRecord>(
                                                                      stream: PanierRecord
                                                                          .getDocument(
                                                                              panChildItem),
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
                                                                        final rowPanierRecord =
                                                                            snapshot.data!;
                                                                        return Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Container(
                                                                                height: MediaQuery.of(context).size.height * 1.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x00FFFFFF),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                        child: Container(
                                                                                          width: MediaQuery.of(context).size.width * 0.5,
                                                                                          height: double.infinity,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0x00FFFFFF),
                                                                                          ),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  StreamBuilder<ProduitsRecord>(
                                                                                                    stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
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
                                                                                                        'Nom:',
                                                                                                        maxLines: 2,
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'sf pro text',
                                                                                                              fontSize: 16.0,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                  Expanded(
                                                                                                    flex: 2,
                                                                                                    child: StreamBuilder<ProduitsRecord>(
                                                                                                      stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
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
                                                                                                          textProduitsRecord.nom,
                                                                                                          textAlign: TextAlign.end,
                                                                                                          maxLines: 2,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'sf pro text',
                                                                                                                fontSize: 16.0,
                                                                                                                useGoogleFonts: false,
                                                                                                              ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                                                                                                child: StreamBuilder<ProduitsRecord>(
                                                                                                  stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
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
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                          child: Text(
                                                                                                            'Quantité',
                                                                                                            textAlign: TextAlign.center,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'sf pro text',
                                                                                                                  fontSize: 18.0,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                          child: Text(
                                                                                                            rowPanierRecord.qty.toString(),
                                                                                                            textAlign: TextAlign.center,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'sf pro text',
                                                                                                                  fontSize: 18.0,
                                                                                                                  useGoogleFonts: false,
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
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                      child: StreamBuilder<ProduitsRecord>(
                                                                                                        stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
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
                                                                                                            rowPanierRecord.type,
                                                                                                            textAlign: TextAlign.start,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'sf pro text',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 13.0,
                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                          );
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Expanded(
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                      child: StreamBuilder<ProduitsRecord>(
                                                                                                        stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
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
                                                                                                            '${rowPanierRecord.mt.toString()} FCFA',
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
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 10.0),
                                                                                                child: Container(
                                                                                                  width: double.infinity,
                                                                                                  height: 1.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        30.0, 0.0, 20.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Sous Total',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'sf pro text',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          '${functions.subtotal(containerPanierRecordList.map((e) => e.mt).toList()).toString()} FCFA',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'sf pro text',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 18.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        30.0, 10.0, 20.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Jour de livraison',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'sf pro text',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: StreamBuilder<
                                                            PrecommandeRecord>(
                                                          stream: PrecommandeRecord
                                                              .getDocument(widget
                                                                  .refComm!),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 10.0,
                                                                  height: 10.0,
                                                                  child:
                                                                      SpinKitPulse(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 10.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final textPrecommandeRecord =
                                                                snapshot.data!;
                                                            return Text(
                                                              dateTimeFormat(
                                                                'd/M H:mm',
                                                                textPrecommandeRecord
                                                                    .date!,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'sf pro text',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        18.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        30.0, 10.0, 20.0, 0.0),
                                                child: StreamBuilder<
                                                    List<FraisLivrRecord>>(
                                                  stream: queryFraisLivrRecord(
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 10.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<FraisLivrRecord>
                                                        rowFraisLivrRecordList =
                                                        snapshot.data!;
                                                    final rowFraisLivrRecord =
                                                        rowFraisLivrRecordList
                                                                .isNotEmpty
                                                            ? rowFraisLivrRecordList
                                                                .first
                                                            : null;
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Frais Livraison',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'sf pro text',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                AuthUserStreamWidget(
                                                              builder: (context) =>
                                                                  StreamBuilder<
                                                                      PrecommandeRecord>(
                                                                stream: PrecommandeRecord
                                                                    .getDocument(
                                                                        widget
                                                                            .refComm!),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            10.0,
                                                                        height:
                                                                            10.0,
                                                                        child:
                                                                            SpinKitPulse(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              10.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final textPrecommandeRecord =
                                                                      snapshot
                                                                          .data!;
                                                                  return Text(
                                                                    '${functions.livreSup(functions.calculerFraisLivraison(functions.distance(columnPrecommandeRecord.posRest, textPrecommandeRecord.lieu2)!, rowFraisLivrRecord!.fraisParKilo, rowFraisLivrRecord!.min), valueOrDefault<bool>(currentUserDocument?.abonnLivraison, false)).toString()} FCFA',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'sf pro text',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              18.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                              if (_model.checkboxValue == true)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(30.0, 10.0,
                                                          20.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<FraisLivrRecord>>(
                                                    stream:
                                                        queryFraisLivrRecord(
                                                      singleRecord: true,
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
                                                      List<FraisLivrRecord>
                                                          rowFraisLivrRecordList =
                                                          snapshot.data!;
                                                      final rowFraisLivrRecord =
                                                          rowFraisLivrRecordList
                                                                  .isNotEmpty
                                                              ? rowFraisLivrRecordList
                                                                  .first
                                                              : null;
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          5.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Taxe',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'sf pro text',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                builder: (context) =>
                                                                    StreamBuilder<
                                                                        List<
                                                                            FraisLivraisonRecord>>(
                                                                  stream:
                                                                      queryFraisLivraisonRecord(
                                                                    singleRecord:
                                                                        true,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              10.0,
                                                                          height:
                                                                              10.0,
                                                                          child:
                                                                              SpinKitPulse(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                10.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<FraisLivraisonRecord>
                                                                        textFraisLivraisonRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    final textFraisLivraisonRecord = textFraisLivraisonRecordList
                                                                            .isNotEmpty
                                                                        ? textFraisLivraisonRecordList
                                                                            .first
                                                                        : null;
                                                                    return Text(
                                                                      '${functions.taxe(functions.subtotal(containerPanierRecordList.map((e) => e.mt).toList()), functions.livreSup(functions.calculerFraisLivraison(functions.distance(columnPrecommandeRecord.posRest, columnPrecommandeRecord.lieu2)!, rowFraisLivrRecord!.fraisParKilo, rowFraisLivrRecord!.min), valueOrDefault<bool>(currentUserDocument?.abonnLivraison, false))).toString()} FCFA',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'sf pro text',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                18.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        30.0, 10.0, 20.0, 0.0),
                                                child: StreamBuilder<
                                                    List<FraisLivrRecord>>(
                                                  stream: queryFraisLivrRecord(
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 10.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<FraisLivrRecord>
                                                        rowFraisLivrRecordList =
                                                        snapshot.data!;
                                                    final rowFraisLivrRecord =
                                                        rowFraisLivrRecordList
                                                                .isNotEmpty
                                                            ? rowFraisLivrRecordList
                                                                .first
                                                            : null;
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Total',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'sf pro text',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        28.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                AuthUserStreamWidget(
                                                              builder: (context) =>
                                                                  StreamBuilder<
                                                                      List<
                                                                          FraisLivraisonRecord>>(
                                                                stream:
                                                                    queryFraisLivraisonRecord(
                                                                  singleRecord:
                                                                      true,
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            10.0,
                                                                        height:
                                                                            10.0,
                                                                        child:
                                                                            SpinKitPulse(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              10.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<FraisLivraisonRecord>
                                                                      textFraisLivraisonRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  final textFraisLivraisonRecord = textFraisLivraisonRecordList
                                                                          .isNotEmpty
                                                                      ? textFraisLivraisonRecordList
                                                                          .first
                                                                      : null;
                                                                  return Text(
                                                                    '${_model.checkboxValue == false ? functions.ttc(functions.subtotal(containerPanierRecordList.map((e) => e.mt).toList()), functions.livreSup(functions.calculerFraisLivraison(functions.distance(columnPrecommandeRecord.posRest, columnPrecommandeRecord.lieu2)!, rowFraisLivrRecord!.fraisParKilo, rowFraisLivrRecord!.min), valueOrDefault<bool>(currentUserDocument?.abonnLivraison, false))).toString() : functions.totapres(functions.subtotal(containerPanierRecordList.map((e) => e.mt).toList()), functions.taxe(functions.subtotal(containerPanierRecordList.map((e) => e.mt).toList()), functions.livreSup(functions.calculerFraisLivraison(functions.distance(columnPrecommandeRecord.posRest, columnPrecommandeRecord.lieu2)!, rowFraisLivrRecord!.fraisParKilo, rowFraisLivrRecord!.min), valueOrDefault<bool>(currentUserDocument?.abonnLivraison, false))), functions.livreSup(functions.calculerFraisLivraison(functions.distance(columnPrecommandeRecord.posRest, columnPrecommandeRecord.lieu2)!, rowFraisLivrRecord!.fraisParKilo, rowFraisLivrRecord!.min), valueOrDefault<bool>(currentUserDocument?.abonnLivraison, false))).toString()} FCFA',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'sf pro text',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              22.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        25.0, 20.0, 20.0, 20.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Theme(
                                                      data: ThemeData(
                                                        checkboxTheme:
                                                            CheckboxThemeData(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                        ),
                                                        unselectedWidgetColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                      ),
                                                      child: Checkbox(
                                                        value: _model
                                                                .checkboxValue ??=
                                                            FFAppState()
                                                                .plusTard,
                                                        onChanged:
                                                            (newValue) async {
                                                          setState(() => _model
                                                                  .checkboxValue =
                                                              newValue!);
                                                          if (newValue!) {
                                                            setState(() {
                                                              FFAppState()
                                                                      .plusTard =
                                                                  true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              FFAppState()
                                                                      .plusTard =
                                                                  false;
                                                            });
                                                          }
                                                        },
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Payez à la livraison',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Form(
                                                key: _model.formKey,
                                                autovalidateMode:
                                                    AutovalidateMode.disabled,
                                                child: StreamBuilder<
                                                    List<FraisLivrRecord>>(
                                                  stream: queryFraisLivrRecord(
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 10.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<FraisLivrRecord>
                                                        columnFraisLivrRecordList =
                                                        snapshot.data!;
                                                    final columnFraisLivrRecord =
                                                        columnFraisLivrRecordList
                                                                .isNotEmpty
                                                            ? columnFraisLivrRecordList
                                                                .first
                                                            : null;
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        StreamBuilder<
                                                            UsersRecord>(
                                                          stream: UsersRecord
                                                              .getDocument(
                                                                  currentUserReference!),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 10.0,
                                                                  height: 10.0,
                                                                  child:
                                                                      SpinKitPulse(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 10.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final columnUsersRecord =
                                                                snapshot.data!;
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          30.0,
                                                                          16.0,
                                                                          20.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              TextFormField(
                                                                            controller:
                                                                                _model.textField125Controller,
                                                                            onFieldSubmitted:
                                                                                (_) async {
                                                                              FFAppState().update(() {
                                                                                FFAppState().indication = _model.textField125Controller.text;
                                                                              });
                                                                            },
                                                                            autofocus:
                                                                                true,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
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
                                                                            maxLines:
                                                                                5,
                                                                            validator:
                                                                                _model.textField125ControllerValidator.asValidator(context),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                if (!FFAppState()
                                                                    .plusTard)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            30.0,
                                                                            16.0,
                                                                            20.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        FlutterFlowDropDown<
                                                                            String>(
                                                                          controller: _model.dropDown1111ValueController ??=
                                                                              FormFieldController<String>(
                                                                            _model.dropDown1111Value ??=
                                                                                '+229',
                                                                          ),
                                                                          options: [
                                                                            '+229'
                                                                          ],
                                                                          onChanged: (val) =>
                                                                              setState(() => _model.dropDown1111Value = val),
                                                                          width:
                                                                              120.0,
                                                                          height:
                                                                              60.0,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'sf pro text',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 18.0,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                          hintText:
                                                                              'Votre Opérateur Réseau',
                                                                          icon:
                                                                              Icon(
                                                                            Icons.arrow_drop_down,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                30.0,
                                                                          ),
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          elevation:
                                                                              2.0,
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          borderWidth:
                                                                              2.0,
                                                                          borderRadius:
                                                                              10.0,
                                                                          margin: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              4.0,
                                                                              12.0,
                                                                              4.0),
                                                                          hidesUnderline:
                                                                              true,
                                                                          isSearchable:
                                                                              false,
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.textFieldmomo111Controller,
                                                                              autofocus: true,
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
                                                                              validator: _model.textFieldmomo111ControllerValidator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                if (!FFAppState()
                                                                    .plusTard)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            30.0,
                                                                            16.0,
                                                                            20.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              FlutterFlowDropDown<String>(
                                                                            controller: _model.reseau2222ValueController ??=
                                                                                FormFieldController<String>(
                                                                              _model.reseau2222Value ??= valueOrDefault<String>(
                                                                                FFAppState().reseau,
                                                                                'mtn',
                                                                              ),
                                                                            ),
                                                                            options: [
                                                                              'mtn',
                                                                              'moov'
                                                                            ],
                                                                            onChanged: (val) =>
                                                                                setState(() => _model.reseau2222Value = val),
                                                                            width:
                                                                                180.0,
                                                                            height:
                                                                                60.0,
                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'sf pro text',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 24.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                            hintText:
                                                                                'Votre Opérateur Réseau',
                                                                            icon:
                                                                                Icon(
                                                                              Icons.arrow_drop_down,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 30.0,
                                                                            ),
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            borderWidth:
                                                                                2.0,
                                                                            borderRadius:
                                                                                10.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                4.0,
                                                                                12.0,
                                                                                4.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isSearchable:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          30.0,
                                                                          16.0,
                                                                          20.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      FlutterFlowDropDown<
                                                                          String>(
                                                                        controller:
                                                                            _model.dropDown22222ValueController ??=
                                                                                FormFieldController<String>(
                                                                          _model.dropDown22222Value ??=
                                                                              '+229',
                                                                        ),
                                                                        options: [
                                                                          '+229'
                                                                        ],
                                                                        onChanged:
                                                                            (val) =>
                                                                                setState(() => _model.dropDown22222Value = val),
                                                                        width:
                                                                            120.0,
                                                                        height:
                                                                            60.0,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'sf pro text',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 18.0,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                        hintText:
                                                                            'Votre Opérateur Réseau',
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .arrow_drop_down,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              30.0,
                                                                        ),
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                        borderWidth:
                                                                            2.0,
                                                                        borderRadius:
                                                                            10.0,
                                                                        margin: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            4.0,
                                                                            12.0,
                                                                            4.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                        isSearchable:
                                                                            false,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              TextFormField(
                                                                            controller:
                                                                                _model.textFieldjoi222Controller,
                                                                            autofocus:
                                                                                true,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
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
                                                                            validator:
                                                                                _model.textFieldjoi222ControllerValidator.asValidator(context),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                if (FFAppState()
                                                                        .plusTard ==
                                                                    false)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            30.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            FraisLivraisonRecord>>(
                                                                      stream:
                                                                          queryFraisLivraisonRecord(
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
                                                                        List<FraisLivraisonRecord>
                                                                            rowFraisLivraisonRecordList =
                                                                            snapshot.data!;
                                                                        final rowFraisLivraisonRecord = rowFraisLivraisonRecordList.isNotEmpty
                                                                            ? rowFraisLivraisonRecordList.first
                                                                            : null;
                                                                        return Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                child: StreamBuilder<PrecommandeRecord>(
                                                                                  stream: PrecommandeRecord.getDocument(widget.refComm!),
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
                                                                                    final buttonPrecommandeRecord = snapshot.data!;
                                                                                    return FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        currentUserLocationValue = await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                                        if (_model.formKey.currentState == null || !_model.formKey.currentState!.validate()) {
                                                                                          return;
                                                                                        }
                                                                                        if (_model.dropDown22222Value == null) {
                                                                                          return;
                                                                                        }
                                                                                        if (await getPermissionStatus(locationPermission)) {
                                                                                          _model.apiResulty733 = await TransactionGenererCall.call(
                                                                                            description: buttonPrecommandeRecord.nom,
                                                                                            amount: functions.ttc(functions.subtotal(containerPanierRecordList.map((e) => e.mt).toList()), functions.livreSup(functions.calculerFraisLivraison(functions.distance(columnPrecommandeRecord.posRest, FFAppState().localisationClient)!, columnFraisLivrRecord!.fraisParKilo, columnFraisLivrRecord!.min), valueOrDefault<bool>(currentUserDocument?.abonnLivraison, false))).toString(),
                                                                                            currency: 'XOF',
                                                                                            callbackUrl: 'https://maplateforme.com/callback',
                                                                                            firstname: columnUsersRecord.prenom,
                                                                                            lastname: columnUsersRecord.nom,
                                                                                            email: currentUserEmail,
                                                                                            number: functions.phone(_model.dropDown1111Value!, _model.textFieldmomo111Controller.text),
                                                                                            country: 'bj',
                                                                                          );
                                                                                          if ((_model.apiResulty733?.succeeded ?? true)) {
                                                                                            _model.apiResultldm11 = await TransactionsTokenCall.call(
                                                                                              id: getJsonField(
                                                                                                (_model.apiResulty733?.jsonBody ?? ''),
                                                                                                r'''$..id''',
                                                                                              ).toString(),
                                                                                            );
                                                                                            if ((_model.apiResultldm11?.succeeded ?? true)) {
                                                                                              _model.apiResultyz12 = await PaiementSansRediCall.call(
                                                                                                token: getJsonField(
                                                                                                  (_model.apiResultldm11?.jsonBody ?? ''),
                                                                                                  r'''$.token''',
                                                                                                ).toString(),
                                                                                                moyensPaie: _model.reseau2222Value,
                                                                                              );
                                                                                              await Future.delayed(const Duration(milliseconds: 60000));
                                                                                              _model.caca12 = await StatutCall.call(
                                                                                                id: PaiementSansRediCall.idd(
                                                                                                  (_model.apiResultyz12?.jsonBody ?? ''),
                                                                                                ).toString(),
                                                                                              );
                                                                                              if (StatutCall.stat(
                                                                                                    (_model.caca12?.jsonBody ?? ''),
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

                                                                                                final precommandeUpdateData = createPrecommandeRecordData(
                                                                                                  statut: 'Payé',
                                                                                                  totalpaye: functions.ttc(functions.subtotal(containerPanierRecordList.map((e) => e.mt).toList()), functions.livreSup(functions.calculerFraisLivraison(functions.distance(columnPrecommandeRecord.posRest, buttonPrecommandeRecord.lieu2)!, columnFraisLivrRecord!.fraisParKilo, columnFraisLivrRecord!.min), valueOrDefault<bool>(currentUserDocument?.abonnLivraison, false))),
                                                                                                  datepay: getCurrentTimestamp,
                                                                                                  numero: functions.phone(_model.dropDown22222Value!, _model.textFieldjoi222Controller.text),
                                                                                                  lieu: _model.textField125Controller.text,
                                                                                                  e1: true,
                                                                                                  e2: false,
                                                                                                  e3: false,
                                                                                                  e4: false,
                                                                                                  e5: false,
                                                                                                  indication: _model.textField125Controller.text,
                                                                                                  livrer: false,
                                                                                                  attribution: false,
                                                                                                  aboLivre: false,
                                                                                                  positionClient: currentUserLocationValue,
                                                                                                  payezPlusTard: false,
                                                                                                  bon: true,
                                                                                                );
                                                                                                await widget.refComm!.update(precommandeUpdateData);
                                                                                                FFAppState().update(() {
                                                                                                  FFAppState().commande = true;
                                                                                                  FFAppState().paiementEtape = false;
                                                                                                });
                                                                                                FFAppState().update(() {
                                                                                                  FFAppState().panieRef = [];
                                                                                                });
                                                                                                FFAppState().update(() {
                                                                                                  FFAppState().indication = _model.textField125Controller.text;
                                                                                                  FFAppState().momo = _model.textFieldmomo111Controller.text;
                                                                                                  FFAppState().reseau = _model.reseau2222Value!;
                                                                                                  FFAppState().joignable = _model.textFieldjoi222Controller.text;
                                                                                                });
                                                                                                triggerPushNotification(
                                                                                                  notificationTitle: 'Félicitation !',
                                                                                                  notificationText: 'Félicitations ! Votre commande a été validée et payée avec succès. Votre livraison est en cours de préparation et arrivera sous peu. Merci d\'utiliser Zemfood !',
                                                                                                  notificationImageUrl: FFAppState().zemfoodLogo,
                                                                                                  notificationSound: 'default',
                                                                                                  userRefs: [
                                                                                                    currentUserReference!
                                                                                                  ],
                                                                                                  initialPageName: 'Accueil',
                                                                                                  parameterData: {},
                                                                                                );
                                                                                                triggerPushNotification(
                                                                                                  notificationTitle: 'Nouvelle commande',
                                                                                                  notificationText: 'Une nouvelle commande vous attend ! meri pour vos services',
                                                                                                  notificationImageUrl: FFAppState().zemfoodLogo,
                                                                                                  notificationSound: 'default',
                                                                                                  userRefs: moyenPaiementUsersRecordList.map((e) => e.reference).toList(),
                                                                                                  initialPageName: 'commandesPayee',
                                                                                                  parameterData: {},
                                                                                                );
                                                                                                FFAppState().update(() {
                                                                                                  FFAppState().tabSimple = true;
                                                                                                });

                                                                                                context.goNamed('cart2');
                                                                                              } else {
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      '3',
                                                                                                      style: TextStyle(
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).tertiary400,
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                            } else {
                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                SnackBar(
                                                                                                  content: Text(
                                                                                                    'Veuillez vérifier votre numéromomo ou Fonds insuffisants',
                                                                                                    style: TextStyle(
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    ),
                                                                                                  ),
                                                                                                  duration: Duration(milliseconds: 4000),
                                                                                                  backgroundColor: FlutterFlowTheme.of(context).alternate,
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                          } else {
                                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                                              SnackBar(
                                                                                                content: Text(
                                                                                                  'Veuillez vérifier votre numéromomo ou Fonds insuffisants',
                                                                                                  style: TextStyle(
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  ),
                                                                                                ),
                                                                                                duration: Duration(milliseconds: 4000),
                                                                                                backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                              ),
                                                                                            );
                                                                                          }
                                                                                        } else {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                'Veuillez activer votre gps',
                                                                                                style: TextStyle(
                                                                                                  color: Color(0xFF373B40),
                                                                                                  fontSize: 14.0,
                                                                                                ),
                                                                                              ),
                                                                                              duration: Duration(milliseconds: 4000),
                                                                                              backgroundColor: Color(0x7BFFFFFF),
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
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                if (FFAppState()
                                                                        .plusTard ==
                                                                    true)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            30.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            FraisLivraisonRecord>>(
                                                                      stream:
                                                                          queryFraisLivraisonRecord(
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
                                                                        List<FraisLivraisonRecord>
                                                                            rowFraisLivraisonRecordList =
                                                                            snapshot.data!;
                                                                        final rowFraisLivraisonRecord = rowFraisLivraisonRecordList.isNotEmpty
                                                                            ? rowFraisLivraisonRecordList.first
                                                                            : null;
                                                                        return Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                child: StreamBuilder<PrecommandeRecord>(
                                                                                  stream: PrecommandeRecord.getDocument(widget.refComm!),
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
                                                                                    final buttonPrecommandeRecord = snapshot.data!;
                                                                                    return FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        currentUserLocationValue = await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                                        if (_model.formKey.currentState == null || !_model.formKey.currentState!.validate()) {
                                                                                          return;
                                                                                        }
                                                                                        if (_model.dropDown22222Value == null) {
                                                                                          return;
                                                                                        }
                                                                                        if (await getPermissionStatus(locationPermission)) {
                                                                                          final precommandeUpdateData = createPrecommandeRecordData(
                                                                                            statut: 'plustard',
                                                                                            totalpaye: functions.totapres(functions.subtotal(containerPanierRecordList.map((e) => e.mt).toList()), functions.taxe(functions.subtotal(containerPanierRecordList.map((e) => e.mt).toList()), functions.livreSup(functions.calculerFraisLivraison(functions.distance(columnPrecommandeRecord.posRest, FFAppState().localisationClient)!, columnFraisLivrRecord!.fraisParKilo, columnFraisLivrRecord!.min), valueOrDefault<bool>(currentUserDocument?.abonnLivraison, false))), functions.livreSup(functions.calculerFraisLivraison(functions.distance(columnPrecommandeRecord.posRest, buttonPrecommandeRecord.lieu2)!, columnFraisLivrRecord!.fraisParKilo, columnFraisLivrRecord!.min), valueOrDefault<bool>(currentUserDocument?.abonnLivraison, false))),
                                                                                            datepay: getCurrentTimestamp,
                                                                                            numero: functions.phone(_model.dropDown22222Value!, _model.textFieldjoi222Controller.text),
                                                                                            lieu: _model.textField125Controller.text,
                                                                                            e1: true,
                                                                                            e2: false,
                                                                                            e3: false,
                                                                                            e4: false,
                                                                                            e5: false,
                                                                                            indication: _model.textField125Controller.text,
                                                                                            livrer: false,
                                                                                            attribution: false,
                                                                                            aboLivre: false,
                                                                                            positionClient: currentUserLocationValue,
                                                                                            payezPlusTard: true,
                                                                                            bon: true,
                                                                                            ttc: functions.ttc(functions.subtotal(containerPanierRecordList.map((e) => e.mt).toList()), functions.livreSup(functions.calculerFraisLivraison(functions.distance(columnPrecommandeRecord.posRest, buttonPrecommandeRecord.lieu2)!, columnFraisLivrRecord!.fraisParKilo, columnFraisLivrRecord!.min), valueOrDefault<bool>(currentUserDocument?.abonnLivraison, false))),
                                                                                          );
                                                                                          await widget.refComm!.update(precommandeUpdateData);
                                                                                          FFAppState().update(() {
                                                                                            FFAppState().commande = true;
                                                                                            FFAppState().paiementEtape = false;
                                                                                          });
                                                                                          FFAppState().update(() {
                                                                                            FFAppState().panieRef = [];
                                                                                          });
                                                                                          FFAppState().update(() {
                                                                                            FFAppState().indication = _model.textField125Controller.text;
                                                                                            FFAppState().joignable = _model.textFieldjoi222Controller.text;
                                                                                          });
                                                                                          triggerPushNotification(
                                                                                            notificationTitle: 'Félicitation !',
                                                                                            notificationText: 'Félicitations ! Votre commande a été validée et payée avec succès. Votre livraison est en cours de préparation et arrivera sous peu. Merci d\'utiliser Zemfood !',
                                                                                            notificationImageUrl: FFAppState().zemfoodLogo,
                                                                                            notificationSound: 'default',
                                                                                            userRefs: [
                                                                                              currentUserReference!
                                                                                            ],
                                                                                            initialPageName: 'Accueil',
                                                                                            parameterData: {},
                                                                                          );
                                                                                          triggerPushNotification(
                                                                                            notificationTitle: 'Nouvelle commande',
                                                                                            notificationText: 'Une nouvelle commande vous attend dans la zone ${buttonPrecommandeRecord.lieu} ! merci pour vos services',
                                                                                            notificationImageUrl: FFAppState().zemfoodLogo,
                                                                                            notificationSound: 'default',
                                                                                            userRefs: moyenPaiementUsersRecordList.map((e) => e.reference).toList(),
                                                                                            initialPageName: 'commandesPayee',
                                                                                            parameterData: {},
                                                                                          );
                                                                                          FFAppState().update(() {
                                                                                            FFAppState().tabSimple = true;
                                                                                          });

                                                                                          context.goNamed('cart2');
                                                                                        } else {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                'Veuillez activer votre gps',
                                                                                                style: TextStyle(
                                                                                                  color: Color(0xFF373B40),
                                                                                                  fontSize: 14.0,
                                                                                                ),
                                                                                              ),
                                                                                              duration: Duration(milliseconds: 4000),
                                                                                              backgroundColor: Color(0x7BFFFFFF),
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                      },
                                                                                      text: 'Confirmez la Livraison',
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
                                                                                    );
                                                                                  },
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
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
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
                    ],
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
