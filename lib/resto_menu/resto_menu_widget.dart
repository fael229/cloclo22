import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/uuuiii_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'resto_menu_model.dart';
export 'resto_menu_model.dart';

class RestoMenuWidget extends StatefulWidget {
  const RestoMenuWidget({Key? key}) : super(key: key);

  @override
  _RestoMenuWidgetState createState() => _RestoMenuWidgetState();
}

class _RestoMenuWidgetState extends State<RestoMenuWidget> {
  late RestoMenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RestoMenuModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'restoMenu'});
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

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<RestaurantsRecord>(
        stream: RestaurantsRecord.getDocument(currentUserDocument!.refresto!),
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
          final restoMenuRestaurantsRecord = snapshot.data!;
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: SafeArea(
                top: true,
                child: Stack(
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
                                      'Menu restaurant',
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
                                          length: 3,
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
                                                  } else if (FFAppState()
                                                          .tabR ==
                                                      true) {
                                                    return 3;
                                                  } else {
                                                    return 0;
                                                  }
                                                }(),
                                                0,
                                              ),
                                              2),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment(0.0, 0),
                                                child: TabBar(
                                                  isScrollable: true,
                                                  labelColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  unselectedLabelColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
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
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  tabs: [
                                                    Tab(
                                                      text: 'Commandes',
                                                    ),
                                                    Tab(
                                                      text:
                                                          'En attente de Paiement',
                                                    ),
                                                    Tab(
                                                      text: 'Payées',
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
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: StreamBuilder<
                                                          List<
                                                              PrecommandeRecord>>(
                                                        stream:
                                                            queryPrecommandeRecord(
                                                          queryBuilder: (precommandeRecord) =>
                                                              precommandeRecord
                                                                  .where(
                                                                      'livrer',
                                                                      isEqualTo:
                                                                          false)
                                                                  .where('bon',
                                                                      isEqualTo:
                                                                          true),
                                                        ),
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
                                                                return Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final panier =
                                                                        columnPrecommandeRecord
                                                                            .listecom
                                                                            .toList();
                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: List.generate(
                                                                          panier
                                                                              .length,
                                                                          (panierIndex) {
                                                                        final panierItem =
                                                                            panier[panierIndex];
                                                                        return StreamBuilder<
                                                                            PanierRecord>(
                                                                          stream:
                                                                              PanierRecord.getDocument(panierItem),
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
                                                                            final columnPanierRecord =
                                                                                snapshot.data!;
                                                                            return Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                if ((columnPanierRecord.resto == restoMenuRestaurantsRecord.nom) && (columnPanierRecord.pret == false))
                                                                                  Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 18.0),
                                                                                            child: Container(
                                                                                              width: MediaQuery.of(context).size.width * 1.0,
                                                                                              height: 170.0,
                                                                                              constraints: BoxConstraints(
                                                                                                maxWidth: 400.0,
                                                                                              ),
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.circular(15.0),
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: StreamBuilder<ProduitsRecord>(
                                                                                                      stream: ProduitsRecord.getDocument(columnPanierRecord.prodRef!),
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
                                                                                                          height: MediaQuery.of(context).size.height * 1.5,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0x00FFFFFF),
                                                                                                            image: DecorationImage(
                                                                                                              fit: BoxFit.cover,
                                                                                                              image: CachedNetworkImageProvider(
                                                                                                                containerProduitsRecord.image,
                                                                                                              ),
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(20.0),
                                                                                                          ),
                                                                                                          child: Container(
                                                                                                            width: 100.0,
                                                                                                            height: 150.0,
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
                                                                                                                                  containerProduitsRecord.nom,
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
                                                                                                                                    stream: UsersRecord.getDocument(columnPanierRecord.parentReference),
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
                                                                                                                                      columnPrecommandeRecord.date!,
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
                                                                                                                          Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                            children: [
                                                                                                                              Expanded(
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                                  child: Text(
                                                                                                                                    'Montant',
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
                                                                                                                                    '${columnPanierRecord.mt.toString()} FCFA',
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
                                                                                                                          Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                            children: [
                                                                                                                              Expanded(
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                                  child: Text(
                                                                                                                                    'Quantité',
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
                                                                                                                                    columnPanierRecord.qty.toString(),
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
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                flex: 2,
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                  child: Text(
                                                                                                    columnPanierRecord.indic,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          FFButtonWidget(
                                                                                            onPressed: () async {
                                                                                              final panierUpdateData = createPanierRecordData(
                                                                                                pret: true,
                                                                                              );
                                                                                              await columnPanierRecord.reference.update(panierUpdateData);
                                                                                            },
                                                                                            text: 'Pret',
                                                                                            options: FFButtonOptions(
                                                                                              width: 400.0,
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
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      }),
                                                                    );
                                                                  },
                                                                );
                                                              }),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      20.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  PrecommandeRecord>>(
                                                            stream:
                                                                queryPrecommandeRecord(
                                                              queryBuilder: (precommandeRecord) =>
                                                                  precommandeRecord.where(
                                                                      'livrer',
                                                                      isEqualTo:
                                                                          true),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 10.0,
                                                                    height:
                                                                        10.0,
                                                                    child:
                                                                        SpinKitPulse(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          10.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<PrecommandeRecord>
                                                                  columnPrecommandeRecordList =
                                                                  snapshot
                                                                      .data!;
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
                                                                    return Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final panier = columnPrecommandeRecord
                                                                            .listecom
                                                                            .toList();
                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: List.generate(
                                                                              panier.length,
                                                                              (panierIndex) {
                                                                            final panierItem =
                                                                                panier[panierIndex];
                                                                            return StreamBuilder<PanierRecord>(
                                                                              stream: PanierRecord.getDocument(panierItem),
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
                                                                                final columnPanierRecord = snapshot.data!;
                                                                                return Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    if ((columnPanierRecord.resto == restoMenuRestaurantsRecord.nom) && (columnPrecommandeRecord.livrer == true) && (columnPanierRecord.pay == false))
                                                                                      Container(
                                                                                        width: double.infinity,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 18.0),
                                                                                                child: Container(
                                                                                                  width: MediaQuery.of(context).size.width * 1.0,
                                                                                                  height: 170.0,
                                                                                                  constraints: BoxConstraints(
                                                                                                    maxWidth: 400.0,
                                                                                                  ),
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    borderRadius: BorderRadius.circular(15.0),
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: StreamBuilder<ProduitsRecord>(
                                                                                                          stream: ProduitsRecord.getDocument(columnPanierRecord.prodRef!),
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
                                                                                                              height: MediaQuery.of(context).size.height * 1.5,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0x00FFFFFF),
                                                                                                                image: DecorationImage(
                                                                                                                  fit: BoxFit.cover,
                                                                                                                  image: CachedNetworkImageProvider(
                                                                                                                    containerProduitsRecord.image,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                                              ),
                                                                                                              child: Container(
                                                                                                                width: 100.0,
                                                                                                                height: 150.0,
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
                                                                                                                                      containerProduitsRecord.nom,
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
                                                                                                                                        stream: UsersRecord.getDocument(columnPanierRecord.parentReference),
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
                                                                                                                                          columnPrecommandeRecord.date!,
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
                                                                                                                              Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                children: [
                                                                                                                                  Expanded(
                                                                                                                                    child: Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                                      child: Text(
                                                                                                                                        'Montant',
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
                                                                                                                                        '${columnPanierRecord.mt.toString()} FCFA',
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
                                                                                                                              Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                children: [
                                                                                                                                  Expanded(
                                                                                                                                    child: Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                                      child: Text(
                                                                                                                                        'Quantité',
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
                                                                                                                                        columnPanierRecord.qty.toString(),
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
                                                                                                                              Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                children: [
                                                                                                                                  Expanded(
                                                                                                                                    child: Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                                      child: Text(
                                                                                                                                        'Livré ?',
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
                                                                                                                                        columnPrecommandeRecord.livrer.toString(),
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
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          },
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
                                                                                  ],
                                                                                );
                                                                              },
                                                                            );
                                                                          }),
                                                                        );
                                                                      },
                                                                    );
                                                                  }),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 1.0,
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: StreamBuilder<
                                                          List<
                                                              PrecommandeRecord>>(
                                                        stream:
                                                            queryPrecommandeRecord(
                                                          queryBuilder:
                                                              (precommandeRecord) =>
                                                                  precommandeRecord.where(
                                                                      'livrer',
                                                                      isEqualTo:
                                                                          true),
                                                        ),
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
                                                                return Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final panier =
                                                                        columnPrecommandeRecord
                                                                            .listecom
                                                                            .toList();
                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: List.generate(
                                                                          panier
                                                                              .length,
                                                                          (panierIndex) {
                                                                        final panierItem =
                                                                            panier[panierIndex];
                                                                        return StreamBuilder<
                                                                            PanierRecord>(
                                                                          stream:
                                                                              PanierRecord.getDocument(panierItem),
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
                                                                            final columnPanierRecord =
                                                                                snapshot.data!;
                                                                            return Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                if ((columnPanierRecord.resto == restoMenuRestaurantsRecord.nom) && (columnPanierRecord.pay == true))
                                                                                  Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 18.0),
                                                                                            child: Container(
                                                                                              width: MediaQuery.of(context).size.width * 1.0,
                                                                                              height: 170.0,
                                                                                              constraints: BoxConstraints(
                                                                                                maxWidth: 400.0,
                                                                                              ),
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.circular(15.0),
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: StreamBuilder<ProduitsRecord>(
                                                                                                      stream: ProduitsRecord.getDocument(columnPanierRecord.prodRef!),
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
                                                                                                          height: MediaQuery.of(context).size.height * 1.5,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0x00FFFFFF),
                                                                                                            image: DecorationImage(
                                                                                                              fit: BoxFit.cover,
                                                                                                              image: CachedNetworkImageProvider(
                                                                                                                containerProduitsRecord.image,
                                                                                                              ),
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(20.0),
                                                                                                          ),
                                                                                                          child: Container(
                                                                                                            width: 100.0,
                                                                                                            height: 150.0,
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
                                                                                                                                  containerProduitsRecord.nom,
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
                                                                                                                                    stream: UsersRecord.getDocument(columnPanierRecord.parentReference),
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
                                                                                                                                      columnPrecommandeRecord.date!,
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
                                                                                                                          Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                            children: [
                                                                                                                              Expanded(
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                                  child: Text(
                                                                                                                                    'Montant',
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
                                                                                                                                    '${columnPanierRecord.mt.toString()} FCFA',
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
                                                                                                                          Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                            children: [
                                                                                                                              Expanded(
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                                  child: Text(
                                                                                                                                    'Quantité',
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
                                                                                                                                    columnPanierRecord.qty.toString(),
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
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
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
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      }),
                                                                    );
                                                                  },
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
          );
        },
      ),
    );
  }
}
