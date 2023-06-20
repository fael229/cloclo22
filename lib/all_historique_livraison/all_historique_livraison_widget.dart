import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/uuuiii_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'all_historique_livraison_model.dart';
export 'all_historique_livraison_model.dart';

class AllHistoriqueLivraisonWidget extends StatefulWidget {
  const AllHistoriqueLivraisonWidget({Key? key}) : super(key: key);

  @override
  _AllHistoriqueLivraisonWidgetState createState() =>
      _AllHistoriqueLivraisonWidgetState();
}

class _AllHistoriqueLivraisonWidgetState
    extends State<AllHistoriqueLivraisonWidget> {
  late AllHistoriqueLivraisonModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllHistoriqueLivraisonModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'allHistoriqueLivraison'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.lockOrientation();
    });

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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Visibility(
            visible:
                valueOrDefault<bool>(currentUserDocument?.approuv, false) ==
                    true,
            child: AuthUserStreamWidget(
              builder: (context) => Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, -5.65),
                    child: SingleChildScrollView(
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
                                    Icons.arrow_back_ios_sharp,
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
                                    'Historique',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0x00272B50),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              1.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x00272B50),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(30.0),
                                        ),
                                      ),
                                      child: DefaultTabController(
                                        length: 4,
                                        initialIndex: min(
                                            valueOrDefault<int>(
                                              () {
                                                if (FFAppState().tabSimple ==
                                                    true) {
                                                  return 1;
                                                } else if (FFAppState()
                                                        .tabAbo ==
                                                    true) {
                                                  return 2;
                                                } else if (FFAppState().tabR ==
                                                    true) {
                                                  return 3;
                                                } else {
                                                  return 0;
                                                }
                                              }(),
                                              0,
                                            ),
                                            3),
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment(0.0, 0),
                                              child: TabBar(
                                                isScrollable: true,
                                                labelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                unselectedLabelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'sf pro text',
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                        ),
                                                indicatorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                tabs: [
                                                  Tab(
                                                    text: 'Livrés',
                                                  ),
                                                  Tab(
                                                    text:
                                                        'En attente de livraison',
                                                  ),
                                                  Tab(
                                                    text: 'Payées',
                                                  ),
                                                  Tab(
                                                    text:
                                                        'En attente de paiement',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: TabBarView(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 20.0,
                                                                0.0, 5.0),
                                                    child: StreamBuilder<
                                                        List<
                                                            PrecommandeRecord>>(
                                                      stream: _model.livre(
                                                        requestFn: () =>
                                                            queryPrecommandeRecord(
                                                          queryBuilder: (precommandeRecord) =>
                                                              precommandeRecord
                                                                  .where(
                                                                      'livrer',
                                                                      isEqualTo:
                                                                          true)
                                                                  .orderBy(
                                                                      'heurelivre',
                                                                      descending:
                                                                          true),
                                                        ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
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
                                                        List<PrecommandeRecord>
                                                            columnPrecommandeRecordList =
                                                            snapshot.data!;
                                                        if (columnPrecommandeRecordList
                                                            .isEmpty) {
                                                          return Container(
                                                            width: 300.0,
                                                            child:
                                                                UuuiiiWidget(),
                                                          );
                                                        }
                                                        return SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: List.generate(
                                                                columnPrecommandeRecordList
                                                                    .length,
                                                                (columnIndex) {
                                                              final columnPrecommandeRecord =
                                                                  columnPrecommandeRecordList[
                                                                      columnIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
                                                                child: StreamBuilder<
                                                                    PrecommandeRecord>(
                                                                  stream: PrecommandeRecord
                                                                      .getDocument(
                                                                          columnPrecommandeRecord
                                                                              .reference),
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
                                                                    final columnPrecommandeRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              18.0),
                                                                          child:
                                                                              StreamBuilder<List<PanierRecord>>(
                                                                            stream:
                                                                                queryPanierRecord(
                                                                              parent: columnPrecommandeRecord.refcli,
                                                                              queryBuilder: (panierRecord) => panierRecord.whereIn('ref', columnPrecommandeRecord.listecom),
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
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      size: 10.0,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<PanierRecord> containerPanierRecordList = snapshot.data!;
                                                                              // Return an empty Container when the item does not exist.
                                                                              if (snapshot.data!.isEmpty) {
                                                                                return Container();
                                                                              }
                                                                              final containerPanierRecord = containerPanierRecordList.isNotEmpty ? containerPanierRecordList.first : null;
                                                                              return Container(
                                                                                width: MediaQuery.of(context).size.width * 1.0,
                                                                                height: 130.0,
                                                                                constraints: BoxConstraints(
                                                                                  maxWidth: 400.0,
                                                                                ),
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.circular(15.0),
                                                                                ),
                                                                                child: StreamBuilder<PrecommandeRecord>(
                                                                                  stream: PrecommandeRecord.getDocument(columnPrecommandeRecord.reference),
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
                                                                                    final rowPrecommandeRecord = snapshot.data!;
                                                                                    return Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: StreamBuilder<ProduitsRecord>(
                                                                                            stream: ProduitsRecord.getDocument(containerPanierRecord!.prodRef!),
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
                                                                                              final containerProduitsRecord = snapshot.data!;
                                                                                              return Container(
                                                                                                height: MediaQuery.of(context).size.height * 1.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Color(0x00FFFFFF),
                                                                                                  image: DecorationImage(
                                                                                                    fit: BoxFit.cover,
                                                                                                    image: Image.network(
                                                                                                      containerProduitsRecord.image,
                                                                                                    ).image,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                                ),
                                                                                                child: Container(
                                                                                                  width: 100.0,
                                                                                                  height: 100.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).customColor2,
                                                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                          child: Container(
                                                                                                            width: MediaQuery.of(context).size.width * 0.5,
                                                                                                            height: double.infinity,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: Color(0x00FFFFFF),
                                                                                                            ),
                                                                                                            child: InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                context.pushNamed(
                                                                                                                  'Tracking',
                                                                                                                  queryParameters: {
                                                                                                                    'refTrack': serializeParam(
                                                                                                                      rowPrecommandeRecord.reference,
                                                                                                                      ParamType.DocumentReference,
                                                                                                                    ),
                                                                                                                  }.withoutNulls,
                                                                                                                );
                                                                                                              },
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        flex: 2,
                                                                                                                        child: Text(
                                                                                                                          rowPrecommandeRecord.nom,
                                                                                                                          maxLines: 2,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'sf pro text',
                                                                                                                                fontSize: 16.0,
                                                                                                                                useGoogleFonts: false,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            'client',
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
                                                                                                                      Expanded(
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                          child: StreamBuilder<UsersRecord>(
                                                                                                                            stream: UsersRecord.getDocument(rowPrecommandeRecord.refcli!),
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
                                                                                                                              final textUsersRecord = snapshot.data!;
                                                                                                                              return Text(
                                                                                                                                textUsersRecord.displayName,
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
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            'Heure livraison',
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
                                                                                                                      Expanded(
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            dateTimeFormat(
                                                                                                                              'd/M H:mm',
                                                                                                                              rowPrecommandeRecord.heurelivre!,
                                                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                                                            ),
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
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                        StreamBuilder<
                                                                            PrecommandeRecord>(
                                                                          stream:
                                                                              PrecommandeRecord.getDocument(columnPrecommandeRecord.reference),
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
                                                                            final buttonPrecommandeRecord =
                                                                                snapshot.data!;
                                                                            return FFButtonWidget(
                                                                              onPressed: () async {
                                                                                context.pushNamed(
                                                                                  'listePanier',
                                                                                  queryParameters: {
                                                                                    'refPanier': serializeParam(
                                                                                      buttonPrecommandeRecord.reference,
                                                                                      ParamType.DocumentReference,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              text: 'Voir le contenu',
                                                                              options: FFButtonOptions(
                                                                                width: double.infinity,
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'sf pro text',
                                                                                      color: Colors.white,
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
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                              );
                                                            }),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 20.0,
                                                                0.0, 5.0),
                                                    child: StreamBuilder<
                                                        List<
                                                            PrecommandeRecord>>(
                                                      stream:
                                                          queryPrecommandeRecord(
                                                        queryBuilder:
                                                            (precommandeRecord) =>
                                                                precommandeRecord
                                                                    .where(
                                                                        'livrer',
                                                                        isEqualTo:
                                                                            false),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
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
                                                        List<PrecommandeRecord>
                                                            columnPrecommandeRecordList =
                                                            snapshot.data!;
                                                        if (columnPrecommandeRecordList
                                                            .isEmpty) {
                                                          return Container(
                                                            width: 300.0,
                                                            child:
                                                                UuuiiiWidget(),
                                                          );
                                                        }
                                                        return SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: List.generate(
                                                                columnPrecommandeRecordList
                                                                    .length,
                                                                (columnIndex) {
                                                              final columnPrecommandeRecord =
                                                                  columnPrecommandeRecordList[
                                                                      columnIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
                                                                child: StreamBuilder<
                                                                    PrecommandeRecord>(
                                                                  stream: PrecommandeRecord
                                                                      .getDocument(
                                                                          columnPrecommandeRecord
                                                                              .reference),
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
                                                                    final columnPrecommandeRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              18.0),
                                                                          child:
                                                                              StreamBuilder<List<PanierRecord>>(
                                                                            stream:
                                                                                queryPanierRecord(
                                                                              parent: columnPrecommandeRecord.refcli,
                                                                              queryBuilder: (panierRecord) => panierRecord.whereIn('ref', columnPrecommandeRecord.listecom),
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
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      size: 10.0,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<PanierRecord> containerPanierRecordList = snapshot.data!;
                                                                              // Return an empty Container when the item does not exist.
                                                                              if (snapshot.data!.isEmpty) {
                                                                                return Container();
                                                                              }
                                                                              final containerPanierRecord = containerPanierRecordList.isNotEmpty ? containerPanierRecordList.first : null;
                                                                              return Container(
                                                                                width: MediaQuery.of(context).size.width * 1.0,
                                                                                height: 130.0,
                                                                                constraints: BoxConstraints(
                                                                                  maxWidth: 400.0,
                                                                                ),
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.circular(15.0),
                                                                                ),
                                                                                child: StreamBuilder<PrecommandeRecord>(
                                                                                  stream: PrecommandeRecord.getDocument(columnPrecommandeRecord.reference),
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
                                                                                    final rowPrecommandeRecord = snapshot.data!;
                                                                                    return Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: StreamBuilder<ProduitsRecord>(
                                                                                            stream: ProduitsRecord.getDocument(containerPanierRecord!.prodRef!),
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
                                                                                              final containerProduitsRecord = snapshot.data!;
                                                                                              return Container(
                                                                                                height: MediaQuery.of(context).size.height * 1.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Color(0x00FFFFFF),
                                                                                                  image: DecorationImage(
                                                                                                    fit: BoxFit.cover,
                                                                                                    image: Image.network(
                                                                                                      containerProduitsRecord.image,
                                                                                                    ).image,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                                ),
                                                                                                child: Container(
                                                                                                  width: 100.0,
                                                                                                  height: 100.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).customColor2,
                                                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                          child: Container(
                                                                                                            width: MediaQuery.of(context).size.width * 0.5,
                                                                                                            height: double.infinity,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: Color(0x00FFFFFF),
                                                                                                            ),
                                                                                                            child: InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                context.pushNamed(
                                                                                                                  'Tracking',
                                                                                                                  queryParameters: {
                                                                                                                    'refTrack': serializeParam(
                                                                                                                      rowPrecommandeRecord.reference,
                                                                                                                      ParamType.DocumentReference,
                                                                                                                    ),
                                                                                                                  }.withoutNulls,
                                                                                                                );
                                                                                                              },
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        flex: 2,
                                                                                                                        child: Text(
                                                                                                                          rowPrecommandeRecord.nom,
                                                                                                                          maxLines: 2,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'sf pro text',
                                                                                                                                fontSize: 16.0,
                                                                                                                                useGoogleFonts: false,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            'client',
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
                                                                                                                      Expanded(
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                          child: StreamBuilder<UsersRecord>(
                                                                                                                            stream: UsersRecord.getDocument(rowPrecommandeRecord.refcli!),
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
                                                                                                                              final textUsersRecord = snapshot.data!;
                                                                                                                              return Text(
                                                                                                                                textUsersRecord.displayName,
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
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            'Destination',
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
                                                                                                                      Expanded(
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            rowPrecommandeRecord.lieu,
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
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                        StreamBuilder<
                                                                            PrecommandeRecord>(
                                                                          stream:
                                                                              PrecommandeRecord.getDocument(columnPrecommandeRecord.reference),
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
                                                                            final buttonPrecommandeRecord =
                                                                                snapshot.data!;
                                                                            return FFButtonWidget(
                                                                              onPressed: () async {
                                                                                context.pushNamed(
                                                                                  'listePanier',
                                                                                  queryParameters: {
                                                                                    'refPanier': serializeParam(
                                                                                      buttonPrecommandeRecord.reference,
                                                                                      ParamType.DocumentReference,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              text: 'Voir le contenu',
                                                                              options: FFButtonOptions(
                                                                                width: double.infinity,
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'sf pro text',
                                                                                      color: Colors.white,
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
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                              );
                                                            }),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 20.0,
                                                                0.0, 5.0),
                                                    child: StreamBuilder<
                                                        List<
                                                            PrecommandeRecord>>(
                                                      stream:
                                                          queryPrecommandeRecord(
                                                        queryBuilder: (precommandeRecord) =>
                                                            precommandeRecord
                                                                .where('livrer',
                                                                    isEqualTo:
                                                                        true)
                                                                .where(
                                                                    'livrPai',
                                                                    isEqualTo:
                                                                        true),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
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
                                                        List<PrecommandeRecord>
                                                            columnPrecommandeRecordList =
                                                            snapshot.data!;
                                                        if (columnPrecommandeRecordList
                                                            .isEmpty) {
                                                          return Container(
                                                            width: 300.0,
                                                            child:
                                                                UuuiiiWidget(),
                                                          );
                                                        }
                                                        return SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: List.generate(
                                                                columnPrecommandeRecordList
                                                                    .length,
                                                                (columnIndex) {
                                                              final columnPrecommandeRecord =
                                                                  columnPrecommandeRecordList[
                                                                      columnIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
                                                                child: StreamBuilder<
                                                                    PrecommandeRecord>(
                                                                  stream: PrecommandeRecord
                                                                      .getDocument(
                                                                          columnPrecommandeRecord
                                                                              .reference),
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
                                                                    final columnPrecommandeRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              18.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 1.0,
                                                                            height:
                                                                                130.0,
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxWidth: 400.0,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(15.0),
                                                                            ),
                                                                            child:
                                                                                StreamBuilder<PrecommandeRecord>(
                                                                              stream: PrecommandeRecord.getDocument(columnPrecommandeRecord.reference),
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
                                                                                final rowPrecommandeRecord = snapshot.data!;
                                                                                return Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        height: MediaQuery.of(context).size.height * 1.0,
                                                                                        decoration: BoxDecoration(
                                                                                          image: DecorationImage(
                                                                                            fit: BoxFit.cover,
                                                                                            image: Image.network(
                                                                                              '',
                                                                                            ).image,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(20.0),
                                                                                        ),
                                                                                        child: StreamBuilder<List<PanierRecord>>(
                                                                                          stream: queryPanierRecord(
                                                                                            parent: columnPrecommandeRecord.refcli,
                                                                                            queryBuilder: (panierRecord) => panierRecord.whereIn('ref', rowPrecommandeRecord.listecom),
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
                                                                                            List<PanierRecord> containerPanierRecordList = snapshot.data!;
                                                                                            // Return an empty Container when the item does not exist.
                                                                                            if (snapshot.data!.isEmpty) {
                                                                                              return Container();
                                                                                            }
                                                                                            final containerPanierRecord = containerPanierRecordList.isNotEmpty ? containerPanierRecordList.first : null;
                                                                                            return Container(
                                                                                              width: 100.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                      child: StreamBuilder<ProduitsRecord>(
                                                                                                        stream: ProduitsRecord.getDocument(containerPanierRecord!.prodRef!),
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
                                                                                                          final containerProduitsRecord = snapshot.data!;
                                                                                                          return Material(
                                                                                                            color: Colors.transparent,
                                                                                                            elevation: 2.0,
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                                                            ),
                                                                                                            child: Container(
                                                                                                              width: MediaQuery.of(context).size.width * 0.5,
                                                                                                              height: double.infinity,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0x00FFFFFF),
                                                                                                                image: DecorationImage(
                                                                                                                  fit: BoxFit.cover,
                                                                                                                  image: Image.network(
                                                                                                                    containerProduitsRecord.image,
                                                                                                                  ).image,
                                                                                                                ),
                                                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                                              ),
                                                                                                              child: Container(
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: Color(0xA0FFFFFF),
                                                                                                                ),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                                                  child: InkWell(
                                                                                                                    splashColor: Colors.transparent,
                                                                                                                    focusColor: Colors.transparent,
                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                    onTap: () async {
                                                                                                                      context.pushNamed(
                                                                                                                        'Tracking',
                                                                                                                        queryParameters: {
                                                                                                                          'refTrack': serializeParam(
                                                                                                                            rowPrecommandeRecord.reference,
                                                                                                                            ParamType.DocumentReference,
                                                                                                                          ),
                                                                                                                        }.withoutNulls,
                                                                                                                      );
                                                                                                                    },
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                      children: [
                                                                                                                        Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              flex: 2,
                                                                                                                              child: Text(
                                                                                                                                rowPrecommandeRecord.nom,
                                                                                                                                maxLines: 2,
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                                      fontSize: 16.0,
                                                                                                                                      useGoogleFonts: false,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                        Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                                child: Text(
                                                                                                                                  'client',
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
                                                                                                                            Expanded(
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                child: StreamBuilder<UsersRecord>(
                                                                                                                                  stream: UsersRecord.getDocument(rowPrecommandeRecord.refcli!),
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
                                                                                                                                    final textUsersRecord = snapshot.data!;
                                                                                                                                    return Text(
                                                                                                                                      textUsersRecord.displayName,
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
                                                                                                                        Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                                child: Text(
                                                                                                                                  'Heure livraison',
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
                                                                                                                            Expanded(
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                child: Text(
                                                                                                                                  dateTimeFormat(
                                                                                                                                    'd/M H:mm',
                                                                                                                                    rowPrecommandeRecord.heurelivre!,
                                                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                                                  ),
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
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
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
                                                                        ),
                                                                        StreamBuilder<
                                                                            List<PanierRecord>>(
                                                                          stream:
                                                                              queryPanierRecord(
                                                                            parent:
                                                                                columnPrecommandeRecord.refcli,
                                                                            queryBuilder: (panierRecord) =>
                                                                                panierRecord.whereIn('ref', columnPrecommandeRecord.listecom),
                                                                            singleRecord:
                                                                                true,
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
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    size: 10.0,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            List<PanierRecord>
                                                                                buttonPanierRecordList =
                                                                                snapshot.data!;
                                                                            // Return an empty Container when the item does not exist.
                                                                            if (snapshot.data!.isEmpty) {
                                                                              return Container();
                                                                            }
                                                                            final buttonPanierRecord = buttonPanierRecordList.isNotEmpty
                                                                                ? buttonPanierRecordList.first
                                                                                : null;
                                                                            return FFButtonWidget(
                                                                              onPressed: () async {
                                                                                context.pushNamed(
                                                                                  'listePanier',
                                                                                  queryParameters: {
                                                                                    'refPanier': serializeParam(
                                                                                      columnPrecommandeRecord.reference,
                                                                                      ParamType.DocumentReference,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              text: 'Voir le contenu',
                                                                              options: FFButtonOptions(
                                                                                width: double.infinity,
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'sf pro text',
                                                                                      color: Colors.white,
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
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                              );
                                                            }),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 20.0,
                                                                0.0, 5.0),
                                                    child: StreamBuilder<
                                                        List<
                                                            PrecommandeRecord>>(
                                                      stream:
                                                          queryPrecommandeRecord(
                                                        queryBuilder: (precommandeRecord) =>
                                                            precommandeRecord
                                                                .where('livrer',
                                                                    isEqualTo:
                                                                        true)
                                                                .where(
                                                                    'livrPai',
                                                                    isEqualTo:
                                                                        false),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
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
                                                        List<PrecommandeRecord>
                                                            columnPrecommandeRecordList =
                                                            snapshot.data!;
                                                        if (columnPrecommandeRecordList
                                                            .isEmpty) {
                                                          return Container(
                                                            width: 300.0,
                                                            child:
                                                                UuuiiiWidget(),
                                                          );
                                                        }
                                                        return SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: List.generate(
                                                                columnPrecommandeRecordList
                                                                    .length,
                                                                (columnIndex) {
                                                              final columnPrecommandeRecord =
                                                                  columnPrecommandeRecordList[
                                                                      columnIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
                                                                child: StreamBuilder<
                                                                    PrecommandeRecord>(
                                                                  stream: PrecommandeRecord
                                                                      .getDocument(
                                                                          columnPrecommandeRecord
                                                                              .reference),
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
                                                                    final columnPrecommandeRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              18.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 1.0,
                                                                            height:
                                                                                130.0,
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxWidth: 400.0,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(15.0),
                                                                            ),
                                                                            child:
                                                                                StreamBuilder<PrecommandeRecord>(
                                                                              stream: PrecommandeRecord.getDocument(columnPrecommandeRecord.reference),
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
                                                                                final rowPrecommandeRecord = snapshot.data!;
                                                                                return Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        height: MediaQuery.of(context).size.height * 1.0,
                                                                                        decoration: BoxDecoration(
                                                                                          image: DecorationImage(
                                                                                            fit: BoxFit.cover,
                                                                                            image: Image.network(
                                                                                              '',
                                                                                            ).image,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(20.0),
                                                                                        ),
                                                                                        child: StreamBuilder<List<PanierRecord>>(
                                                                                          stream: queryPanierRecord(
                                                                                            parent: columnPrecommandeRecord.refcli,
                                                                                            queryBuilder: (panierRecord) => panierRecord.whereIn('ref', rowPrecommandeRecord.listecom),
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
                                                                                            List<PanierRecord> containerPanierRecordList = snapshot.data!;
                                                                                            // Return an empty Container when the item does not exist.
                                                                                            if (snapshot.data!.isEmpty) {
                                                                                              return Container();
                                                                                            }
                                                                                            final containerPanierRecord = containerPanierRecordList.isNotEmpty ? containerPanierRecordList.first : null;
                                                                                            return Container(
                                                                                              width: 100.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                      child: StreamBuilder<ProduitsRecord>(
                                                                                                        stream: ProduitsRecord.getDocument(containerPanierRecord!.prodRef!),
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
                                                                                                          final containerProduitsRecord = snapshot.data!;
                                                                                                          return Material(
                                                                                                            color: Colors.transparent,
                                                                                                            elevation: 2.0,
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                                                            ),
                                                                                                            child: Container(
                                                                                                              width: MediaQuery.of(context).size.width * 0.5,
                                                                                                              height: double.infinity,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0x00FFFFFF),
                                                                                                                image: DecorationImage(
                                                                                                                  fit: BoxFit.cover,
                                                                                                                  image: Image.network(
                                                                                                                    containerProduitsRecord.image,
                                                                                                                  ).image,
                                                                                                                ),
                                                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                                              ),
                                                                                                              child: Container(
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: Color(0xA0FFFFFF),
                                                                                                                ),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                                                  child: InkWell(
                                                                                                                    splashColor: Colors.transparent,
                                                                                                                    focusColor: Colors.transparent,
                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                    onTap: () async {
                                                                                                                      context.pushNamed(
                                                                                                                        'Tracking',
                                                                                                                        queryParameters: {
                                                                                                                          'refTrack': serializeParam(
                                                                                                                            rowPrecommandeRecord.reference,
                                                                                                                            ParamType.DocumentReference,
                                                                                                                          ),
                                                                                                                        }.withoutNulls,
                                                                                                                      );
                                                                                                                    },
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                      children: [
                                                                                                                        Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              flex: 2,
                                                                                                                              child: Text(
                                                                                                                                rowPrecommandeRecord.nom,
                                                                                                                                maxLines: 2,
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                                      fontSize: 16.0,
                                                                                                                                      useGoogleFonts: false,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                        Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                                child: Text(
                                                                                                                                  'client',
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
                                                                                                                            Expanded(
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                child: StreamBuilder<UsersRecord>(
                                                                                                                                  stream: UsersRecord.getDocument(rowPrecommandeRecord.refcli!),
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
                                                                                                                                    final textUsersRecord = snapshot.data!;
                                                                                                                                    return Text(
                                                                                                                                      textUsersRecord.displayName,
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
                                                                                                                        Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                                child: Text(
                                                                                                                                  'Heure livraison',
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
                                                                                                                            Expanded(
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                child: Text(
                                                                                                                                  dateTimeFormat(
                                                                                                                                    'd/M H:mm',
                                                                                                                                    rowPrecommandeRecord.heurelivre!,
                                                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                                                  ),
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
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
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
                                                                        ),
                                                                        StreamBuilder<
                                                                            PrecommandeRecord>(
                                                                          stream:
                                                                              PrecommandeRecord.getDocument(columnPrecommandeRecord.reference),
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
                                                                            final buttonPrecommandeRecord =
                                                                                snapshot.data!;
                                                                            return FFButtonWidget(
                                                                              onPressed: () async {
                                                                                final precommandeUpdateData = createPrecommandeRecordData(
                                                                                  livrPai: true,
                                                                                );
                                                                                await buttonPrecommandeRecord.reference.update(precommandeUpdateData);
                                                                              },
                                                                              text: 'Payer',
                                                                              options: FFButtonOptions(
                                                                                width: double.infinity,
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'sf pro text',
                                                                                      color: Colors.white,
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
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                              );
                                                            }),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
