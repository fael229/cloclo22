import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/blank_card2_widget.dart';
import '/components/blank_card_widget.dart';
import '/components/blank_list_col1_widget.dart';
import '/components/detail_widget.dart';
import '/components/livraion_abo_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'accueil_model.dart';
export 'accueil_model.dart';

class AccueilWidget extends StatefulWidget {
  const AccueilWidget({
    Key? key,
    bool? parain,
    this.parainref,
  })  : this.parain = parain ?? false,
        super(key: key);

  final bool parain;
  final DocumentReference? parainref;

  @override
  _AccueilWidgetState createState() => _AccueilWidgetState();
}

class _AccueilWidgetState extends State<AccueilWidget>
    with TickerProviderStateMixin {
  late AccueilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'circleImageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccueilModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Accueil'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((FFAppState().enDette == true) ||
          (valueOrDefault<bool>(currentUserDocument?.endete, false) == true)) {
        context.pushNamed(
          'Signature',
          queryParameters: {
            'refTrack': serializeParam(
              currentUserDocument?.refDette,
              ParamType.DocumentReference,
            ),
          }.withoutNulls,
        );
      }
      if (!loggedIn) {
        context.goNamed('connexion');
      } else {
        if (valueOrDefault<bool>(currentUserDocument?.abonnLivraison, false) !=
            null) {
          if (valueOrDefault<bool>(
                  currentUserDocument?.abonnLivraison, false) ==
              true) {
            if (functions.abo(
                    currentUserDocument!.debutAbo!, getCurrentTimestamp) ==
                false) {
              final usersUpdateData1 = createUsersRecordData(
                abonnLivraison: false,
              );
              await currentUserReference!.update(usersUpdateData1);
            }
          }
          if (valueOrDefault<bool>(
                  currentUserDocument?.abonnLivraison, false) ==
              true) {
            if (functions.abo(
                    currentUserDocument!.debutAbo!, getCurrentTimestamp) ==
                false) {
              final usersUpdateData2 = createUsersRecordData(
                abonnLivraison: false,
              );
              await currentUserReference!.update(usersUpdateData2);
            }
          }
        }
        if (FFAppState().isActive == true) {
          setDarkModeSetting(context, ThemeMode.light);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Bienvenue',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 14.0,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: Color(0xC0FFFFFF),
            ),
          );
        } else {
          setDarkModeSetting(context, ThemeMode.dark);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Bienvenue',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 14.0,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: Color(0xC0FFFFFF),
            ),
          );
        }

        FFAppState().update(() {
          FFAppState().prixDefaut = true;
          FFAppState().refFav = null;
        });
        FFAppState().update(() {
          FFAppState().qty = 1;
        });
        if (FFAppState().newnew == true) {
          triggerPushNotification(
            notificationTitle: 'Bienvenue chez Zemfood !',
            notificationText:
                'Merci d\'avoir téléchargé Zemfood ! Commandez maintenant vos plats préférés chez les meilleurs restaurants au Bénin',
            userRefs: [currentUserReference!],
            initialPageName: 'Accueil',
            parameterData: {},
          );
          setState(() {
            FFAppState().newnew = false;
          });
        }
        if (valueOrDefault<bool>(currentUserDocument?.abonnLivraison, false) ==
            true) {
          if (functions.abo(
                  currentUserDocument!.debutAbo!, getCurrentTimestamp) ==
              false) {
            final usersUpdateData3 = createUsersRecordData(
              abonnLivraison: false,
            );
            await currentUserReference!.update(usersUpdateData3);
          }
        }

        final lastConnexionHourUpdateData = createLastConnexionHourRecordData(
          last: getCurrentTimestamp,
        );
        await currentUserDocument!.last!.update(lastConnexionHourUpdateData);
      }
    });

    _model.searchFieldController ??= TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 1.0,
              decoration: BoxDecoration(
                color: Color(0x00272B50),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: StreamBuilder<UsersRecord>(
                                  stream: UsersRecord.getDocument(
                                      currentUserReference!),
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
                                    final rowUsersRecord = snapshot.data!;
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Bienvenu  ${rowUsersRecord.prenom}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'sf pro text',
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons.phone,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 20.0,
                                                              ),
                                                              Expanded(
                                                                flex: 2,
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: StreamBuilder<
                                                                      List<
                                                                          RideRecord>>(
                                                                    stream:
                                                                        queryRideRecord(
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
                                                                            width:
                                                                                10.0,
                                                                            height:
                                                                                10.0,
                                                                            child:
                                                                                SpinKitPulse(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 10.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<RideRecord>
                                                                          textRideRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      // Return an empty Container when the item does not exist.
                                                                      if (snapshot
                                                                          .data!
                                                                          .isEmpty) {
                                                                        return Container();
                                                                      }
                                                                      final textRideRecord = textRideRecordList
                                                                              .isNotEmpty
                                                                          ? textRideRecordList
                                                                              .first
                                                                          : null;
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await launchUrl(
                                                                              Uri(
                                                                            scheme:
                                                                                'tel',
                                                                            path:
                                                                                textRideRecord!.userName,
                                                                          ));
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          'Service Client: ${textRideRecord!.userAddress}',
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'sf pro text',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                fontSize: 13.0,
                                                                                fontWeight: FontWeight.w300,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-0.6, -0.5),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.12,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.12,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 15.0,
                                                  color: Color(0x205A5A5A),
                                                  spreadRadius: 3.0,
                                                )
                                              ],
                                              shape: BoxShape.circle,
                                            ),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed('profile');
                                              },
                                              child: Container(
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      rowUsersRecord.photoUrl,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'circleImageOnPageLoadAnimation']!),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 12.0, 20.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 5.0,
                                        color: Color(0x3416202A),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 8.0, 8.0, 8.0),
                                    child: StreamBuilder<List<UsersRecord>>(
                                      stream: queryUsersRecord(
                                        queryBuilder: (usersRecord) =>
                                            usersRecord.where('email',
                                                isEqualTo:
                                                    'faeltoutcourt@gmail.com'),
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 10.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<UsersRecord> rowUsersRecordList =
                                            snapshot.data!;
                                        final rowUsersRecord =
                                            rowUsersRecordList.isNotEmpty
                                                ? rowUsersRecordList.first
                                                : null;
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'chatDetails',
                                              queryParameters: {
                                                'chatUser': serializeParam(
                                                  rowUsersRecord,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'chatUser': rowUsersRecord,
                                              },
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Support Client',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              FaIcon(
                                                FontAwesomeIcons.edit,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 25.0,
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 16.0, 20.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                constraints: BoxConstraints(
                                  maxWidth: 500.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(28.0),
                                ),
                                child: TextFormField(
                                  controller: _model.searchFieldController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.searchFieldController',
                                    Duration(milliseconds: 200),
                                    () async {
                                      setState(() =>
                                          _model.algoliaSearchResults = null);
                                      await ProduitsRecord.search(
                                        term: _model.searchFieldController.text,
                                        useCache: true,
                                      )
                                          .then((r) =>
                                              _model.algoliaSearchResults = r)
                                          .onError((_, __) =>
                                              _model.algoliaSearchResults = [])
                                          .whenComplete(() => setState(() {}));
                                    },
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    hintText: 'Recherchez un plat ici',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 0.0,
                                      ),
                                      borderRadius: BorderRadius.circular(29.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 0.0,
                                      ),
                                      borderRadius: BorderRadius.circular(29.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 0.0,
                                      ),
                                      borderRadius: BorderRadius.circular(29.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 0.0,
                                      ),
                                      borderRadius: BorderRadius.circular(29.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            14.0, 24.0, 14.0, 24.0),
                                    prefixIcon: Icon(
                                      FFIcons.ksearchFael,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                    suffixIcon: _model.searchFieldController!
                                            .text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.searchFieldController
                                                  ?.clear();
                                              setState(() => _model
                                                  .algoliaSearchResults = null);
                                              await ProduitsRecord.search(
                                                term: _model
                                                    .searchFieldController.text,
                                                useCache: true,
                                              )
                                                  .then((r) => _model
                                                      .algoliaSearchResults = r)
                                                  .onError((_, __) => _model
                                                          .algoliaSearchResults =
                                                      [])
                                                  .whenComplete(
                                                      () => setState(() {}));

                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color: Color(0xFF757575),
                                              size: 22.0,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model
                                      .searchFieldControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            if (_model.searchFieldController.text != null &&
                                _model.searchFieldController.text != '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child:
                                            FutureBuilder<List<ProduitsRecord>>(
                                          future: ProduitsRecord.search(
                                            term: _model
                                                .searchFieldController.text,
                                            useCache: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: BlankListCol1Widget(),
                                              );
                                            }
                                            List<ProduitsRecord>
                                                columnProduitsRecordList =
                                                snapshot.data!;
                                            // Customize what your widget looks like with no search results.
                                            if (snapshot.data!.isEmpty) {
                                              return Container(
                                                height: 100,
                                                child: Center(
                                                  child: Text('No results.'),
                                                ),
                                              );
                                            }
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  columnProduitsRecordList
                                                      .length, (columnIndex) {
                                                final columnProduitsRecord =
                                                    columnProduitsRecordList[
                                                        columnIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            1.0,
                                                    height: 200.0,
                                                    constraints: BoxConstraints(
                                                      maxWidth: 500.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: StreamBuilder<
                                                        ProduitsRecord>(
                                                      stream: ProduitsRecord
                                                          .getDocument(
                                                              columnProduitsRecord
                                                                  .reference),
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
                                                        final rowProduitsRecord =
                                                            snapshot.data!;
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .prixDefaut =
                                                                  true;
                                                              FFAppState()
                                                                      .refFav =
                                                                  null;
                                                            });
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState().qty =
                                                                  1;
                                                            });

                                                            final produitsUpdateData =
                                                                {
                                                              'vue': FieldValue
                                                                  .increment(1),
                                                            };
                                                            await rowProduitsRecord
                                                                .reference
                                                                .update(
                                                                    produitsUpdateData);
                                                            showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              barrierColor: Color(
                                                                  0x00000000),
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        1.0,
                                                                    child:
                                                                        DetailWidget(
                                                                      prodRef:
                                                                          rowProduitsRecord
                                                                              .reference,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          },
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                child: Image
                                                                    .network(
                                                                  rowProduitsRecord
                                                                      .image,
                                                                  width: 100.0,
                                                                  height: 100.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      1.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x00FFFFFF),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.5,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    flex: 2,
                                                                                    child: Text(
                                                                                      rowProduitsRecord.nom,
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
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      '${dateTimeFormat(
                                                                                        'Hm',
                                                                                        rowProduitsRecord.ouv,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      )} - ${dateTimeFormat(
                                                                                        'Hm',
                                                                                        rowProduitsRecord.clo,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      )}',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'sf pro text',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            useGoogleFonts: false,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      rowProduitsRecord.restaurant,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'sf pro text',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            useGoogleFonts: false,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        () {
                                                                                          if (rowProduitsRecord.multi == false) {
                                                                                            return '${functions.multippl(rowProduitsRecord.prix, FFAppState().qty).toString()} FCFA';
                                                                                          } else if ((rowProduitsRecord.multi == true) && (FFAppState().prixDefaut == false)) {
                                                                                            return '${functions.multippl(rowProduitsRecord.prixComplet, FFAppState().qty).toString()} FCFA';
                                                                                          } else {
                                                                                            return '${functions.multippl(rowProduitsRecord.prixDemi, FFAppState().qty).toString()} FCFA';
                                                                                          }
                                                                                        }(),
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'sf pro text',
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              fontSize: 18.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Text(
                                                                                rowProduitsRecord.disponible.toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                );
                                              }),
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
                      StreamBuilder<List<RestaurantsRecord>>(
                        stream: queryRestaurantsRecord(
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
                          List<RestaurantsRecord>
                              containerRestaurantsRecordList = snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final containerRestaurantsRecord =
                              containerRestaurantsRecordList.isNotEmpty
                                  ? containerRestaurantsRecordList.first
                                  : null;
                          return Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Explorez  les Catégories',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'sf pro text',
                                                          fontSize: 16.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed('category');
                                                },
                                                child: Text(
                                                  'Voir plus',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'sf pro text',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 18.0, 0.0, 0.0),
                                          child: StreamBuilder<List<CatRecord>>(
                                            stream: FFAppState().accCatList(
                                              overrideCache: true,
                                              requestFn: () => queryCatRecord(
                                                queryBuilder: (catRecord) =>
                                                    catRecord.orderBy('nbr',
                                                        descending: true),
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
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
                                                  ),
                                                );
                                              }
                                              List<CatRecord> rowCatRecordList =
                                                  snapshot.data!;
                                              return SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: List.generate(
                                                      rowCatRecordList.length,
                                                      (rowIndex) {
                                                    final rowCatRecord =
                                                        rowCatRecordList[
                                                            rowIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  12.0,
                                                                  12.0,
                                                                  12.0),
                                                      child: StreamBuilder<
                                                          CatRecord>(
                                                        stream: CatRecord
                                                            .getDocument(
                                                                rowCatRecord
                                                                    .reference),
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
                                                          final containerCatRecord =
                                                              snapshot.data!;
                                                          return Container(
                                                            width: 120.0,
                                                            height: 135.0,
                                                            constraints:
                                                                BoxConstraints(
                                                              maxHeight: 135.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .cate,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'catDetails',
                                                                    queryParameters:
                                                                        {
                                                                      'refcat':
                                                                          serializeParam(
                                                                        containerCatRecord
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    CachedNetworkImage(
                                                                      imageUrl:
                                                                          containerCatRecord
                                                                              .img,
                                                                      height:
                                                                          50.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        containerCatRecord
                                                                            .nom,
                                                                        maxLines:
                                                                            2,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'sf pro text',
                                                                              color: Colors.white,
                                                                              fontSize: 12.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          3.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        '${containerCatRecord.nbr.toString()} Plats',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'sf pro text',
                                                                              color: Colors.white,
                                                                              fontSize: 11.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: false,
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
                                                  }),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Les meilleurs restaurants',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'sf pro text',
                                                fontSize: 16.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed('restaurants');
                                          },
                                          child: Text(
                                            'Voir plus',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'sf pro text',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 16.0, 0.0, 0.0),
                                    child:
                                        StreamBuilder<List<RestaurantsRecord>>(
                                      stream: _model.meilleurResto(
                                        requestFn: () => queryRestaurantsRecord(
                                          queryBuilder: (restaurantsRecord) =>
                                              restaurantsRecord
                                                  .orderBy('prio',
                                                      descending: true)
                                                  .orderBy('note',
                                                      descending: true),
                                          limit: 50,
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: BlankCardWidget(),
                                          );
                                        }
                                        List<RestaurantsRecord>
                                            rowRestaurantsRecordList =
                                            snapshot.data!;
                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                rowRestaurantsRecordList.length,
                                                (rowIndex) {
                                              final rowRestaurantsRecord =
                                                  rowRestaurantsRecordList[
                                                      rowIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 16.0, 16.0, 16.0),
                                                child: StreamBuilder<
                                                    RestaurantsRecord>(
                                                  stream: RestaurantsRecord
                                                      .getDocument(
                                                          rowRestaurantsRecord
                                                              .reference),
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
                                                    final containerRestaurantsRecord =
                                                        snapshot.data!;
                                                    return Material(
                                                      color: Colors.transparent,
                                                      elevation: 5.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      child: Container(
                                                        width: 230.0,
                                                        height: 320.0,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 400.0,
                                                          maxHeight: 320.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .complet =
                                                                  false;
                                                              FFAppState()
                                                                      .refFav =
                                                                  null;
                                                            });
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState().qty =
                                                                  1;
                                                            });

                                                            context.pushNamed(
                                                              'restauDetail',
                                                              queryParameters: {
                                                                'ref':
                                                                    serializeParam(
                                                                  containerRestaurantsRecord
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 170.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxHeight:
                                                                      170.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  image:
                                                                      DecorationImage(
                                                                    fit: BoxFit
                                                                        .fitHeight,
                                                                    image:
                                                                        CachedNetworkImageProvider(
                                                                      rowRestaurantsRecord
                                                                          .img,
                                                                    ),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            15.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            15.0),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                9.0,
                                                                                0.0,
                                                                                9.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 2,
                                                                                      child: Text(
                                                                                        rowRestaurantsRecord.nom,
                                                                                        maxLines: 2,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'sf pro text',
                                                                                              fontSize: 14.0,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 2,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                        child: Text(
                                                                                          rowRestaurantsRecord.zone,
                                                                                          maxLines: 2,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'sf pro text',
                                                                                                color: FlutterFlowTheme.of(context).tertiary400,
                                                                                                fontSize: 14.0,
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
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            9.0,
                                                                            0.0,
                                                                            9.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      '${dateTimeFormat(
                                                                        'Hm',
                                                                        rowRestaurantsRecord
                                                                            .ouv,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )} - ${dateTimeFormat(
                                                                        'Hm',
                                                                        rowRestaurantsRecord
                                                                            .clo,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'sf pro text',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                12.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            9.0,
                                                                            10.0,
                                                                            9.0,
                                                                            9.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    RatingBarIndicator(
                                                                      itemBuilder:
                                                                          (context, index) =>
                                                                              Icon(
                                                                        Icons
                                                                            .star_rounded,
                                                                        color: Color(
                                                                            0xFFFFCC53),
                                                                      ),
                                                                      direction:
                                                                          Axis.horizontal,
                                                                      rating: functions.rate(
                                                                          rowRestaurantsRecord
                                                                              .ratelist
                                                                              .toList(),
                                                                          rowRestaurantsRecord
                                                                              .ratelist
                                                                              .length),
                                                                      unratedColor:
                                                                          Color(
                                                                              0xFF9E9E9E),
                                                                      itemCount:
                                                                          5,
                                                                      itemSize:
                                                                          18.0,
                                                                    ),
                                                                  ],
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
                                            }),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      StreamBuilder<List<CatRecord>>(
                        stream: queryCatRecord(
                          queryBuilder: (catRecord) => catRecord.where('nom',
                              isNotEqualTo: 'Ravitaillement'),
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
                          List<CatRecord> containerCatRecordList =
                              snapshot.data!;
                          return Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Pour vous',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'sf pro text',
                                                fontSize: 16.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed('pourVous');
                                          },
                                          child: Text(
                                            'Voir plus',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'sf pro text',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 16.0, 0.0, 0.0),
                                    child: StreamBuilder<List<ProduitsRecord>>(
                                      stream: _model.pourVous(
                                        requestFn: () => queryProduitsRecord(
                                          queryBuilder: (produitsRecord) =>
                                              produitsRecord
                                                  .whereIn(
                                                      'category',
                                                      containerCatRecordList
                                                          .map((e) => e.nom)
                                                          .toList())
                                                  .where('disponible',
                                                      isEqualTo: true)
                                                  .orderBy('prio',
                                                      descending: true)
                                                  .orderBy('vue',
                                                      descending: true),
                                          limit: 20,
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: BlankCardWidget(),
                                          );
                                        }
                                        List<ProduitsRecord>
                                            rowProduitsRecordList =
                                            snapshot.data!;
                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                rowProduitsRecordList.length,
                                                (rowIndex) {
                                              final rowProduitsRecord =
                                                  rowProduitsRecordList[
                                                      rowIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 16.0, 16.0, 16.0),
                                                child: StreamBuilder<
                                                    ProduitsRecord>(
                                                  stream: ProduitsRecord
                                                      .getDocument(
                                                          rowProduitsRecord
                                                              .reference),
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
                                                    final containerProduitsRecord =
                                                        snapshot.data!;
                                                    return Material(
                                                      color: Colors.transparent,
                                                      elevation: 5.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      child: Container(
                                                        width: 230.0,
                                                        height: 360.0,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 400.0,
                                                          maxHeight: 320.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      9.0,
                                                                      9.0,
                                                                      9.0,
                                                                      9.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .complet =
                                                                    false;
                                                                FFAppState()
                                                                        .refFav =
                                                                    null;
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                    .qty = 1;
                                                              });

                                                              final produitsUpdateData =
                                                                  {
                                                                'vue': FieldValue
                                                                    .increment(
                                                                        1),
                                                              };
                                                              await containerProduitsRecord
                                                                  .reference
                                                                  .update(
                                                                      produitsUpdateData);
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                barrierColor: Color(
                                                                    0x00000000),
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Padding(
                                                                    padding: MediaQuery.of(
                                                                            context)
                                                                        .viewInsets,
                                                                    child:
                                                                        Container(
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          1.0,
                                                                      child:
                                                                          DetailWidget(
                                                                        prodRef:
                                                                            containerProduitsRecord.reference,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));
                                                            },
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Stack(
                                                                  children: [
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          170.0,
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxHeight:
                                                                            170.0,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        image:
                                                                            DecorationImage(
                                                                          fit: BoxFit
                                                                              .fitHeight,
                                                                          image:
                                                                              CachedNetworkImageProvider(
                                                                            containerProduitsRecord.image,
                                                                          ),
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(15.0),
                                                                      ),
                                                                    ),
                                                                    if (containerProduitsRecord
                                                                            .pourcentage !=
                                                                        0)
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.96,
                                                                            -0.95),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              8.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                40.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xAC40249B),
                                                                              borderRadius: BorderRadius.circular(2.0),
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                SelectionArea(
                                                                                    child: Text(
                                                                                  '- ${containerProduitsRecord.pourcentage.toString()} %',
                                                                                  textAlign: TextAlign.center,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'sf pro text',
                                                                                        color: Colors.white,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                )),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x00FFFFFF),
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
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
                                                                                              fontSize: 14.0,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 2,
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                          child: Text(
                                                                                            containerProduitsRecord.restaurant,
                                                                                            textAlign: TextAlign.start,
                                                                                            maxLines: 2,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'sf pro text',
                                                                                                  color: FlutterFlowTheme.of(context).tertiary400,
                                                                                                  fontSize: 14.0,
                                                                                                  useGoogleFonts: false,
                                                                                                ),
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
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      '${dateTimeFormat(
                                                                        'Hm',
                                                                        containerProduitsRecord
                                                                            .ouv,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )} - ${dateTimeFormat(
                                                                        'Hm',
                                                                        containerProduitsRecord
                                                                            .clo,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'sf pro text',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                12.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    RatingBarIndicator(
                                                                      itemBuilder:
                                                                          (context, index) =>
                                                                              Icon(
                                                                        Icons
                                                                            .star_rounded,
                                                                        color: Color(
                                                                            0xFFFFCC53),
                                                                      ),
                                                                      direction:
                                                                          Axis.horizontal,
                                                                      rating: functions.rate(
                                                                          containerProduitsRecord
                                                                              .note
                                                                              .toList(),
                                                                          containerProduitsRecord
                                                                              .note
                                                                              .length),
                                                                      unratedColor:
                                                                          Color(
                                                                              0xFF9E9E9E),
                                                                      itemCount:
                                                                          5,
                                                                      itemSize:
                                                                          18.0,
                                                                    ),
                                                                    Container(
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxWidth:
                                                                            140.0,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(5.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            5.0),
                                                                        child:
                                                                            Text(
                                                                          () {
                                                                            if (containerProduitsRecord.multi ==
                                                                                false) {
                                                                              return '${functions.reduce(functions.multippl(containerProduitsRecord.prix, FFAppState().qty), containerProduitsRecord.pourcentage).toString()} FCFA';
                                                                            } else if ((containerProduitsRecord.multi == true) &&
                                                                                (FFAppState().prixDefaut == false)) {
                                                                              return '${functions.reduce(functions.multippl(containerProduitsRecord.prixComplet, FFAppState().qty), containerProduitsRecord.pourcentage).toString()} FCFA';
                                                                            } else {
                                                                              return '${functions.reduce(functions.multippl(containerProduitsRecord.prixDemi, FFAppState().qty), containerProduitsRecord.pourcentage).toString()} FCFA';
                                                                            }
                                                                          }(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'sf pro text',
                                                                                color: Colors.white,
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
                          );
                        },
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: StreamBuilder<List<CatRecord>>(
                          stream: queryCatRecord(
                            queryBuilder: (catRecord) => catRecord.where('nom',
                                isEqualTo: 'Ravitaillement'),
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
                            List<CatRecord> columnCatRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final columnCatRecord =
                                columnCatRecordList.isNotEmpty
                                    ? columnCatRecordList.first
                                    : null;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Packages Ravitaillement',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'sf pro text',
                                              fontSize: 16.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      StreamBuilder<List<DetailsRecord>>(
                                        stream: queryDetailsRecord(
                                          parent: columnCatRecord!.reference,
                                          queryBuilder: (detailsRecord) =>
                                              detailsRecord.where('nom',
                                                  isEqualTo: 'Packages'),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 10.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<DetailsRecord>
                                              textDetailsRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final textDetailsRecord =
                                              textDetailsRecordList.isNotEmpty
                                                  ? textDetailsRecordList.first
                                                  : null;
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'catDetails2',
                                                queryParameters: {
                                                  'refcat': serializeParam(
                                                    columnCatRecord!.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'refDet': serializeParam(
                                                    textDetailsRecord!
                                                        .reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Text(
                                              'Voir plus',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'sf pro text',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 16.0, 0.0, 0.0),
                                  child: StreamBuilder<List<ProduitsRecord>>(
                                    stream: _model.ravit(
                                      requestFn: () => queryProduitsRecord(
                                        queryBuilder: (produitsRecord) =>
                                            produitsRecord
                                                .where('category',
                                                    isEqualTo: 'Ravitaillement')
                                                .where('catList',
                                                    arrayContains: 'Packages'),
                                      ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: BlankCardWidget(),
                                        );
                                      }
                                      List<ProduitsRecord>
                                          rowProduitsRecordList =
                                          snapshot.data!;
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              rowProduitsRecordList.length,
                                              (rowIndex) {
                                            final rowProduitsRecord =
                                                rowProduitsRecordList[rowIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 16.0, 16.0),
                                              child:
                                                  StreamBuilder<ProduitsRecord>(
                                                stream:
                                                    ProduitsRecord.getDocument(
                                                        rowProduitsRecord
                                                            .reference),
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
                                                  final containerProduitsRecord =
                                                      snapshot.data!;
                                                  return Material(
                                                    color: Colors.transparent,
                                                    elevation: 5.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    child: Container(
                                                      width: 230.0,
                                                      height: 300.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 400.0,
                                                        maxHeight: 300.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    9.0,
                                                                    9.0,
                                                                    9.0,
                                                                    9.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .complet =
                                                                  false;
                                                              FFAppState()
                                                                      .refFav =
                                                                  null;
                                                            });
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState().qty =
                                                                  1;
                                                            });

                                                            final produitsUpdateData =
                                                                {
                                                              'vue': FieldValue
                                                                  .increment(1),
                                                            };
                                                            await containerProduitsRecord
                                                                .reference
                                                                .update(
                                                                    produitsUpdateData);
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              barrierColor: Color(
                                                                  0x00000000),
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        1.0,
                                                                    child:
                                                                        DetailWidget(
                                                                      prodRef:
                                                                          containerProduitsRecord
                                                                              .reference,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          },
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        170.0,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxHeight:
                                                                          170.0,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      image:
                                                                          DecorationImage(
                                                                        fit: BoxFit
                                                                            .fitHeight,
                                                                        image:
                                                                            CachedNetworkImageProvider(
                                                                          containerProduitsRecord
                                                                              .image,
                                                                        ),
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15.0),
                                                                    ),
                                                                  ),
                                                                  if (containerProduitsRecord
                                                                          .pourcentage !=
                                                                      0)
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          0.96,
                                                                          -0.95),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              40.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xAC40249B),
                                                                            borderRadius:
                                                                                BorderRadius.circular(2.0),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              SelectionArea(
                                                                                  child: Text(
                                                                                '- ${containerProduitsRecord.pourcentage.toString()} %',
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'sf pro text',
                                                                                      color: Colors.white,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              )),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                flex: 2,
                                                                                child: Text(
                                                                                  containerProduitsRecord.nom,
                                                                                  maxLines: 2,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'sf pro text',
                                                                                        fontSize: 14.0,
                                                                                        useGoogleFonts: false,
                                                                                      ),
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
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    '${dateTimeFormat(
                                                                      'Hm',
                                                                      containerProduitsRecord
                                                                          .ouv,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )} - ${dateTimeFormat(
                                                                      'Hm',
                                                                      containerProduitsRecord
                                                                          .clo,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'sf pro text',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  RatingBarIndicator(
                                                                    itemBuilder:
                                                                        (context,
                                                                                index) =>
                                                                            Icon(
                                                                      Icons
                                                                          .star_rounded,
                                                                      color: Color(
                                                                          0xFFFFCC53),
                                                                    ),
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    rating: functions.rate(
                                                                        containerProduitsRecord
                                                                            .note
                                                                            .toList(),
                                                                        containerProduitsRecord
                                                                            .note
                                                                            .length),
                                                                    unratedColor:
                                                                        Color(
                                                                            0xFF9E9E9E),
                                                                    itemCount:
                                                                        5,
                                                                    itemSize:
                                                                        18.0,
                                                                  ),
                                                                  Container(
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          140.0,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          5.0),
                                                                      child:
                                                                          Text(
                                                                        () {
                                                                          if (containerProduitsRecord.multi ==
                                                                              false) {
                                                                            return '${functions.reduce(functions.multippl(containerProduitsRecord.prix, FFAppState().qty), containerProduitsRecord.pourcentage).toString()} FCFA';
                                                                          } else if ((containerProduitsRecord.multi == true) &&
                                                                              (FFAppState().prixDefaut == false)) {
                                                                            return '${functions.reduce(functions.multippl(containerProduitsRecord.prixComplet, FFAppState().qty), containerProduitsRecord.pourcentage).toString()} FCFA';
                                                                          } else {
                                                                            return '${functions.reduce(functions.multippl(containerProduitsRecord.prixDemi, FFAppState().qty), containerProduitsRecord.pourcentage).toString()} FCFA';
                                                                          }
                                                                        }(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'sf pro text',
                                                                              color: Colors.white,
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
                            );
                          },
                        ),
                      ),
                      if (valueOrDefault<bool>(
                              currentUserDocument?.abonnLivraison, false) ==
                          false)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) =>
                                StreamBuilder<List<FraisLivraisonRecord>>(
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 10.0,
                                      ),
                                    ),
                                  );
                                }
                                List<FraisLivraisonRecord>
                                    rowFraisLivraisonRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final rowFraisLivraisonRecord =
                                    rowFraisLivraisonRecordList.isNotEmpty
                                        ? rowFraisLivraisonRecordList.first
                                        : null;
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (valueOrDefault<bool>(
                                            currentUserDocument?.abonnLivraison,
                                            false) ==
                                        false)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor: Color(0x00000000),
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: Container(
                                                  height: 500.0,
                                                  child: LivraionAboWidget(),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1.0,
                                          height: 180.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.asset(
                                                'assets/images/mois,_Profitez_de_tous_nos_services_sans_frais_de_livraison_pendant_1_Mois_(700__380_px)h.png',
                                              ).image,
                                            ),
                                          ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                barrierColor: Color(0x00000000),
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child: Container(
                                                      height: 500.0,
                                                      child:
                                                          LivraionAboWidget(),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<BanniereRecord>>(
                                                    stream: _model.promo1(
                                                      requestFn: () =>
                                                          queryBanniereRecord(
                                                        queryBuilder:
                                                            (banniereRecord) =>
                                                                banniereRecord.where(
                                                                    'nom',
                                                                    isEqualTo:
                                                                        'fraisab'),
                                                        singleRecord: true,
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
                                                            child: SpinKitPulse(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 10.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<BanniereRecord>
                                                          imageBanniereRecordList =
                                                          snapshot.data!;
                                                      final imageBanniereRecord =
                                                          imageBanniereRecordList
                                                                  .isNotEmpty
                                                              ? imageBanniereRecordList
                                                                  .first
                                                              : null;
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            barrierColor: Color(
                                                                0x00000000),
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: 500.0,
                                                                  child:
                                                                      LivraionAboWidget(),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));
                                                        },
                                                        child: Image.network(
                                                          imageBanniereRecord!
                                                              .img,
                                                          width: 300.0,
                                                          height: 180.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            StreamBuilder<List<ProduitsRecord>>(
                              stream: queryProduitsRecord(
                                queryBuilder: (produitsRecord) => produitsRecord
                                    .where('pourcentage', isNotEqualTo: 0)
                                    .orderBy('pourcentage', descending: true),
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 10.0,
                                      ),
                                    ),
                                  );
                                }
                                List<ProduitsRecord>
                                    containerProduitsRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final containerProduitsRecord =
                                    containerProduitsRecordList.isNotEmpty
                                        ? containerProduitsRecordList.first
                                        : null;
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Réductions',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'sf pro text',
                                                fontSize: 16.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed('Reduction');
                                          },
                                          child: Text(
                                            'Voir plus',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'sf pro text',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 16.0, 0.0, 0.0),
                              child: StreamBuilder<List<ProduitsRecord>>(
                                stream: _model.reductions(
                                  requestFn: () => queryProduitsRecord(
                                    queryBuilder: (produitsRecord) =>
                                        produitsRecord
                                            .where('pourcentage',
                                                isNotEqualTo: 0)
                                            .where('disponible',
                                                isEqualTo: true)
                                            .orderBy('pourcentage',
                                                descending: true),
                                    limit: 20,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: BlankCardWidget(),
                                    );
                                  }
                                  List<ProduitsRecord> rowProduitsRecordList =
                                      snapshot.data!;
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          rowProduitsRecordList.length,
                                          (rowIndex) {
                                        final rowProduitsRecord =
                                            rowProduitsRecordList[rowIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 12.0, 12.0, 12.0),
                                          child: StreamBuilder<ProduitsRecord>(
                                            stream: ProduitsRecord.getDocument(
                                                rowProduitsRecord.reference),
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
                                              final containerProduitsRecord =
                                                  snapshot.data!;
                                              return Material(
                                                color: Colors.transparent,
                                                elevation: 5.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                child: Container(
                                                  width: 230.0,
                                                  height: 360.0,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 400.0,
                                                    maxHeight: 320.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(9.0, 9.0,
                                                                9.0, 9.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        FFAppState().update(() {
                                                          FFAppState().complet =
                                                              false;
                                                          FFAppState().refFav =
                                                              null;
                                                        });
                                                        FFAppState().update(() {
                                                          FFAppState().qty = 1;
                                                        });

                                                        final produitsUpdateData =
                                                            {
                                                          'vue': FieldValue
                                                              .increment(1),
                                                        };
                                                        await containerProduitsRecord
                                                            .reference
                                                            .update(
                                                                produitsUpdateData);
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          barrierColor:
                                                              Color(0x00000000),
                                                          context: context,
                                                          builder: (context) {
                                                            return Padding(
                                                              padding: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets,
                                                              child: Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    1.0,
                                                                child:
                                                                    DetailWidget(
                                                                  prodRef:
                                                                      containerProduitsRecord
                                                                          .reference,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 170.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxHeight:
                                                                      170.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  image:
                                                                      DecorationImage(
                                                                    fit: BoxFit
                                                                        .fitHeight,
                                                                    image:
                                                                        CachedNetworkImageProvider(
                                                                      containerProduitsRecord
                                                                          .image,
                                                                    ),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                ),
                                                              ),
                                                              if (containerProduitsRecord
                                                                      .pourcentage !=
                                                                  0)
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.96,
                                                                          -0.95),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xAC40249B),
                                                                        borderRadius:
                                                                            BorderRadius.circular(2.0),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          SelectionArea(
                                                                              child: Text(
                                                                            '- ${containerProduitsRecord.pourcentage.toString()} %',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'sf pro text',
                                                                                  color: Colors.white,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          )),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0x00FFFFFF),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                flex: 2,
                                                                                child: Text(
                                                                                  containerProduitsRecord.nom,
                                                                                  maxLines: 2,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'sf pro text',
                                                                                        fontSize: 14.0,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Expanded(
                                                                                flex: 2,
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                    child: Text(
                                                                                      containerProduitsRecord.restaurant,
                                                                                      textAlign: TextAlign.start,
                                                                                      maxLines: 2,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'sf pro text',
                                                                                            color: FlutterFlowTheme.of(context).tertiary400,
                                                                                            fontSize: 14.0,
                                                                                            useGoogleFonts: false,
                                                                                          ),
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
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '${dateTimeFormat(
                                                                  'Hm',
                                                                  containerProduitsRecord
                                                                      .ouv,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )} - ${dateTimeFormat(
                                                                  'Hm',
                                                                  containerProduitsRecord
                                                                      .clo,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'sf pro text',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              RatingBarIndicator(
                                                                itemBuilder:
                                                                    (context,
                                                                            index) =>
                                                                        Icon(
                                                                  Icons
                                                                      .star_rounded,
                                                                  color: Color(
                                                                      0xFFFFCC53),
                                                                ),
                                                                direction: Axis
                                                                    .horizontal,
                                                                rating: functions.rate(
                                                                    containerProduitsRecord
                                                                        .note
                                                                        .toList(),
                                                                    containerProduitsRecord
                                                                        .note
                                                                        .length),
                                                                unratedColor: Color(
                                                                    0xFF9E9E9E),
                                                                itemCount: 5,
                                                                itemSize: 18.0,
                                                              ),
                                                              Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth:
                                                                      140.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          5.0),
                                                                  child: Text(
                                                                    () {
                                                                      if (containerProduitsRecord
                                                                              .multi ==
                                                                          false) {
                                                                        return '${functions.reduce(functions.multippl(containerProduitsRecord.prix, FFAppState().qty), containerProduitsRecord.pourcentage).toString()} FCFA';
                                                                      } else if ((containerProduitsRecord.multi ==
                                                                              true) &&
                                                                          (FFAppState().prixDefaut ==
                                                                              false)) {
                                                                        return '${functions.reduce(functions.multippl(containerProduitsRecord.prixComplet, FFAppState().qty), containerProduitsRecord.pourcentage).toString()} FCFA';
                                                                      } else {
                                                                        return '${functions.reduce(functions.multippl(containerProduitsRecord.prixDemi, FFAppState().qty), containerProduitsRecord.pourcentage).toString()} FCFA';
                                                                      }
                                                                    }(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'sf pro text',
                                                                          color:
                                                                              Colors.white,
                                                                          useGoogleFonts:
                                                                              false,
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: StreamBuilder<List<CatRecord>>(
                                stream: _model.catlist(
                                  requestFn: () => queryCatRecord(
                                    queryBuilder: (catRecord) =>
                                        catRecord.where('nom',
                                            isNotEqualTo: 'Ravitaillement'),
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: BlankCard2Widget(),
                                    );
                                  }
                                  List<CatRecord> columnCatRecordList =
                                      snapshot.data!;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        columnCatRecordList.length,
                                        (columnIndex) {
                                      final columnCatRecord =
                                          columnCatRecordList[columnIndex];
                                      return StreamBuilder<CatRecord>(
                                        stream: CatRecord.getDocument(
                                            columnCatRecord.reference),
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
                                          final containerCatRecord =
                                              snapshot.data!;
                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  StreamBuilder<
                                                      List<ProduitsRecord>>(
                                                    stream: queryProduitsRecord(
                                                      queryBuilder: (produitsRecord) =>
                                                          produitsRecord.where(
                                                              'category',
                                                              isEqualTo:
                                                                  containerCatRecord
                                                                      .nom),
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
                                                      List<ProduitsRecord>
                                                          containerProduitsRecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the item does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final containerProduitsRecord =
                                                          containerProduitsRecordList
                                                                  .isNotEmpty
                                                              ? containerProduitsRecordList
                                                                  .first
                                                              : null;
                                                      return Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      0.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                containerCatRecord
                                                                    .nom,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'sf pro text',
                                                                      fontSize:
                                                                          16.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'catDetails',
                                                                    queryParameters:
                                                                        {
                                                                      'refcat':
                                                                          serializeParam(
                                                                        containerCatRecord
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child: Text(
                                                                  'Voir plus',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'sf pro text',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0,
                                                                16.0, 0.0, 0.0),
                                                    child: StreamBuilder<
                                                        List<ProduitsRecord>>(
                                                      stream:
                                                          queryProduitsRecord(
                                                        queryBuilder: (produitsRecord) =>
                                                            produitsRecord
                                                                .where(
                                                                    'category',
                                                                    isEqualTo:
                                                                        containerCatRecord
                                                                            .nom)
                                                                .where(
                                                                    'disponible',
                                                                    isEqualTo:
                                                                        true)
                                                                .orderBy('vue',
                                                                    descending:
                                                                        true),
                                                        limit: 20,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child:
                                                                BlankCardWidget(),
                                                          );
                                                        }
                                                        List<ProduitsRecord>
                                                            rowProduitsRecordList =
                                                            snapshot.data!;
                                                        return SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: List.generate(
                                                                rowProduitsRecordList
                                                                    .length,
                                                                (rowIndex) {
                                                              final rowProduitsRecord =
                                                                  rowProduitsRecordList[
                                                                      rowIndex];
                                                              return Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        12.0,
                                                                        12.0,
                                                                        12.0),
                                                                child: StreamBuilder<
                                                                    ProduitsRecord>(
                                                                  stream: ProduitsRecord
                                                                      .getDocument(
                                                                          rowProduitsRecord
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
                                                                    final containerProduitsRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return Material(
                                                                      color: Colors
                                                                          .transparent,
                                                                      elevation:
                                                                          5.0,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(15.0),
                                                                      ),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            230.0,
                                                                        height:
                                                                            360.0,
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          maxWidth:
                                                                              400.0,
                                                                          maxHeight:
                                                                              320.0,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              9.0,
                                                                              9.0,
                                                                              9.0,
                                                                              9.0),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              FFAppState().update(() {
                                                                                FFAppState().complet = false;
                                                                                FFAppState().refFav = null;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().qty = 1;
                                                                              });

                                                                              final produitsUpdateData = {
                                                                                'vue': FieldValue.increment(1),
                                                                              };
                                                                              await containerProduitsRecord.reference.update(produitsUpdateData);
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Colors.transparent,
                                                                                barrierColor: Color(0x00000000),
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return Padding(
                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                    child: Container(
                                                                                      height: MediaQuery.of(context).size.height * 1.0,
                                                                                      child: DetailWidget(
                                                                                        prodRef: containerProduitsRecord.reference,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => setState(() {}));
                                                                            },
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Stack(
                                                                                  children: [
                                                                                    Container(
                                                                                      width: double.infinity,
                                                                                      height: 170.0,
                                                                                      constraints: BoxConstraints(
                                                                                        maxHeight: 170.0,
                                                                                      ),
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        image: DecorationImage(
                                                                                          fit: BoxFit.fitHeight,
                                                                                          image: CachedNetworkImageProvider(
                                                                                            containerProduitsRecord.image,
                                                                                          ),
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                    ),
                                                                                    if (containerProduitsRecord.pourcentage != 0)
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.96, -0.95),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                          child: Container(
                                                                                            width: 50.0,
                                                                                            height: 40.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0xAC40249B),
                                                                                              borderRadius: BorderRadius.circular(2.0),
                                                                                            ),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                SelectionArea(
                                                                                                    child: Text(
                                                                                                  '- ${containerProduitsRecord.pourcentage.toString()} %',
                                                                                                  textAlign: TextAlign.center,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'sf pro text',
                                                                                                        color: Colors.white,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                )),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0x00FFFFFF),
                                                                                            ),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
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
                                                                                                              fontSize: 14.0,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      flex: 2,
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                          child: Text(
                                                                                                            containerProduitsRecord.restaurant,
                                                                                                            textAlign: TextAlign.start,
                                                                                                            maxLines: 2,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'sf pro text',
                                                                                                                  color: FlutterFlowTheme.of(context).tertiary400,
                                                                                                                  fontSize: 14.0,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
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
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      '${dateTimeFormat(
                                                                                        'Hm',
                                                                                        containerProduitsRecord.ouv,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      )} - ${dateTimeFormat(
                                                                                        'Hm',
                                                                                        containerProduitsRecord.clo,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      )}',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'sf pro text',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontSize: 12.0,
                                                                                            useGoogleFonts: false,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    RatingBarIndicator(
                                                                                      itemBuilder: (context, index) => Icon(
                                                                                        Icons.star_rounded,
                                                                                        color: Color(0xFFFFCC53),
                                                                                      ),
                                                                                      direction: Axis.horizontal,
                                                                                      rating: functions.rate(containerProduitsRecord.note.toList(), containerProduitsRecord.note.length),
                                                                                      unratedColor: Color(0xFF9E9E9E),
                                                                                      itemCount: 5,
                                                                                      itemSize: 18.0,
                                                                                    ),
                                                                                    Container(
                                                                                      constraints: BoxConstraints(
                                                                                        maxWidth: 140.0,
                                                                                      ),
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                        child: Text(
                                                                                          () {
                                                                                            if (containerProduitsRecord.multi == false) {
                                                                                              return '${functions.reduce(functions.multippl(containerProduitsRecord.prix, FFAppState().qty), containerProduitsRecord.pourcentage).toString()} FCFA';
                                                                                            } else if ((containerProduitsRecord.multi == true) && (FFAppState().prixDefaut == false)) {
                                                                                              return '${functions.reduce(functions.multippl(containerProduitsRecord.prixComplet, FFAppState().qty), containerProduitsRecord.pourcentage).toString()} FCFA';
                                                                                            } else {
                                                                                              return '${functions.reduce(functions.multippl(containerProduitsRecord.prixDemi, FFAppState().qty), containerProduitsRecord.pourcentage).toString()} FCFA';
                                                                                            }
                                                                                          }(),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'sf pro text',
                                                                                                color: Colors.white,
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
                                          );
                                        },
                                      );
                                    }),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('Abonnement');
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                height: 180.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/mois,_Profitez_de_tous_nos_services_sans_frais_de_livraison_pendant_1_Mois_(700__380_px)h.png',
                                    ).image,
                                  ),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('Abonnement');
                                  },
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child:
                                            StreamBuilder<List<BanniereRecord>>(
                                          stream: _model.promo2(
                                            requestFn: () =>
                                                queryBanniereRecord(
                                              queryBuilder: (banniereRecord) =>
                                                  banniereRecord.where('nom',
                                                      isEqualTo: 'programme'),
                                              singleRecord: true,
                                            ),
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
                                            List<BanniereRecord>
                                                imageBanniereRecordList =
                                                snapshot.data!;
                                            final imageBanniereRecord =
                                                imageBanniereRecordList
                                                        .isNotEmpty
                                                    ? imageBanniereRecordList
                                                        .first
                                                    : null;
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed('Abonnement');
                                              },
                                              child: Image.network(
                                                imageBanniereRecord!.img,
                                                width: 300.0,
                                                height: 180.0,
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          },
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
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Nos Recommandations',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'sf pro text',
                                          fontSize: 16.0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('nosRecommandations');
                                    },
                                    child: Text(
                                      'Voir plus',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'sf pro text',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 16.0, 0.0, 0.0),
                              child: StreamBuilder<List<ProduitsRecord>>(
                                stream: _model.recomm(
                                  requestFn: () => queryProduitsRecord(
                                    queryBuilder: (produitsRecord) =>
                                        produitsRecord
                                            .where('moyenne',
                                                isGreaterThanOrEqualTo: 4.0)
                                            .where('disponible',
                                                isEqualTo: true)
                                            .orderBy('moyenne',
                                                descending: true),
                                    limit: 20,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: BlankCardWidget(),
                                    );
                                  }
                                  List<ProduitsRecord> rowProduitsRecordList =
                                      snapshot.data!;
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          rowProduitsRecordList.length,
                                          (rowIndex) {
                                        final rowProduitsRecord =
                                            rowProduitsRecordList[rowIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 12.0, 12.0, 12.0),
                                          child: StreamBuilder<ProduitsRecord>(
                                            stream: ProduitsRecord.getDocument(
                                                rowProduitsRecord.reference),
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
                                              final containerProduitsRecord =
                                                  snapshot.data!;
                                              return Material(
                                                color: Colors.transparent,
                                                elevation: 5.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                child: Container(
                                                  width: 230.0,
                                                  height: 360.0,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 400.0,
                                                    maxHeight: 320.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(9.0, 9.0,
                                                                9.0, 9.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        FFAppState().update(() {
                                                          FFAppState().complet =
                                                              false;
                                                          FFAppState().refFav =
                                                              null;
                                                        });
                                                        FFAppState().update(() {
                                                          FFAppState().qty = 1;
                                                        });

                                                        final produitsUpdateData =
                                                            {
                                                          'vue': FieldValue
                                                              .increment(1),
                                                        };
                                                        await containerProduitsRecord
                                                            .reference
                                                            .update(
                                                                produitsUpdateData);
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          barrierColor:
                                                              Color(0x00000000),
                                                          context: context,
                                                          builder: (context) {
                                                            return Padding(
                                                              padding: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets,
                                                              child: Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    1.0,
                                                                child:
                                                                    DetailWidget(
                                                                  prodRef:
                                                                      containerProduitsRecord
                                                                          .reference,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 170.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxHeight:
                                                                      170.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  image:
                                                                      DecorationImage(
                                                                    fit: BoxFit
                                                                        .fitHeight,
                                                                    image:
                                                                        CachedNetworkImageProvider(
                                                                      containerProduitsRecord
                                                                          .image,
                                                                    ),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                ),
                                                              ),
                                                              if (containerProduitsRecord
                                                                      .pourcentage !=
                                                                  0)
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.96,
                                                                          -0.95),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xAC40249B),
                                                                        borderRadius:
                                                                            BorderRadius.circular(2.0),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          SelectionArea(
                                                                              child: Text(
                                                                            '- ${containerProduitsRecord.pourcentage.toString()} %',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'sf pro text',
                                                                                  color: Colors.white,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          )),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0x00FFFFFF),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                flex: 2,
                                                                                child: Text(
                                                                                  containerProduitsRecord.nom,
                                                                                  maxLines: 2,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'sf pro text',
                                                                                        fontSize: 14.0,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Expanded(
                                                                                flex: 2,
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                    child: Text(
                                                                                      containerProduitsRecord.restaurant,
                                                                                      textAlign: TextAlign.start,
                                                                                      maxLines: 2,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'sf pro text',
                                                                                            color: FlutterFlowTheme.of(context).tertiary400,
                                                                                            fontSize: 14.0,
                                                                                            useGoogleFonts: false,
                                                                                          ),
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
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '${dateTimeFormat(
                                                                  'Hm',
                                                                  containerProduitsRecord
                                                                      .ouv,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )} - ${dateTimeFormat(
                                                                  'Hm',
                                                                  containerProduitsRecord
                                                                      .clo,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'sf pro text',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              RatingBarIndicator(
                                                                itemBuilder:
                                                                    (context,
                                                                            index) =>
                                                                        Icon(
                                                                  Icons
                                                                      .star_rounded,
                                                                  color: Color(
                                                                      0xFFFFCC53),
                                                                ),
                                                                direction: Axis
                                                                    .horizontal,
                                                                rating: functions.rate(
                                                                    containerProduitsRecord
                                                                        .note
                                                                        .toList(),
                                                                    containerProduitsRecord
                                                                        .note
                                                                        .length),
                                                                unratedColor: Color(
                                                                    0xFF9E9E9E),
                                                                itemCount: 5,
                                                                itemSize: 18.0,
                                                              ),
                                                              Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth:
                                                                      140.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          5.0),
                                                                  child: Text(
                                                                    () {
                                                                      if (containerProduitsRecord
                                                                              .multi ==
                                                                          false) {
                                                                        return '${functions.reduce(functions.multippl(containerProduitsRecord.prix, FFAppState().qty), containerProduitsRecord.pourcentage).toString()} FCFA';
                                                                      } else if ((containerProduitsRecord.multi ==
                                                                              true) &&
                                                                          (FFAppState().prixDefaut ==
                                                                              false)) {
                                                                        return '${functions.reduce(functions.multippl(containerProduitsRecord.prixComplet, FFAppState().qty), containerProduitsRecord.pourcentage).toString()} FCFA';
                                                                      } else {
                                                                        return '${functions.reduce(functions.multippl(containerProduitsRecord.prixDemi, FFAppState().qty), containerProduitsRecord.pourcentage).toString()} FCFA';
                                                                      }
                                                                    }(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'sf pro text',
                                                                          color:
                                                                              Colors.white,
                                                                          useGoogleFonts:
                                                                              false,
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 16.0, 0.0, 16.0),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.6,
                          constraints: BoxConstraints(
                            maxHeight: 600.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 20.0),
                            child: DefaultTabController(
                              length: 5,
                              initialIndex: 0,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment(0.0, 0),
                                    child: TabBar(
                                      isScrollable: true,
                                      labelColor:
                                          FlutterFlowTheme.of(context).primary,
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'sf pro text',
                                            fontSize: 16.0,
                                            useGoogleFonts: false,
                                          ),
                                      indicatorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      indicatorWeight: 2.0,
                                      tabs: [
                                        Tab(
                                          text: 'Tendance',
                                        ),
                                        Tab(
                                          text: 'Populaire',
                                        ),
                                        Tab(
                                          text: 'Nouveauté',
                                        ),
                                        Tab(
                                          text: 'Les mieux notés',
                                        ),
                                        Tab(
                                          text: 'Les plus commenté',
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      children: [
                                        KeepAliveWidgetWrapper(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 50.0),
                                            child: StreamBuilder<
                                                List<ProduitsRecord>>(
                                              stream: _model.pop(
                                                requestFn: () =>
                                                    queryProduitsRecord(
                                                  queryBuilder:
                                                      (produitsRecord) =>
                                                          produitsRecord
                                                              .where(
                                                                  'disponible',
                                                                  isEqualTo:
                                                                      true)
                                                              .orderBy(
                                                                  'nbreFav',
                                                                  descending:
                                                                      true),
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child:
                                                        BlankListCol1Widget(),
                                                  );
                                                }
                                                List<ProduitsRecord>
                                                    columnProduitsRecordList =
                                                    snapshot.data!;
                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        columnProduitsRecordList
                                                            .length,
                                                        (columnIndex) {
                                                      final columnProduitsRecord =
                                                          columnProduitsRecordList[
                                                              columnIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    4.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              1.0,
                                                          height: 150.0,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 500.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x001E2039),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        20.0),
                                                            child: StreamBuilder<
                                                                ProduitsRecord>(
                                                              stream: ProduitsRecord
                                                                  .getDocument(
                                                                      columnProduitsRecord
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            10.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final rowProduitsRecord =
                                                                    snapshot
                                                                        .data!;
                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                              .prixDefaut =
                                                                          true;
                                                                      FFAppState()
                                                                              .complet =
                                                                          false;
                                                                    });
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                              .refFav =
                                                                          null;
                                                                      FFAppState()
                                                                          .qty = 1;
                                                                    });

                                                                    final produitsUpdateData =
                                                                        {
                                                                      'vue': FieldValue
                                                                          .increment(
                                                                              1),
                                                                    };
                                                                    await rowProduitsRecord
                                                                        .reference
                                                                        .update(
                                                                            produitsUpdateData);
                                                                    showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      barrierColor:
                                                                          Color(
                                                                              0x00000000),
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return Padding(
                                                                          padding:
                                                                              MediaQuery.of(context).viewInsets,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 1.0,
                                                                            child:
                                                                                DetailWidget(
                                                                              prodRef: rowProduitsRecord.reference,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          imageUrl:
                                                                              rowProduitsRecord.image,
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              100.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
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
                                                                                            Expanded(
                                                                                              flex: 2,
                                                                                              child: Text(
                                                                                                rowProduitsRecord.nom,
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
                                                                                          children: [
                                                                                            Expanded(
                                                                                              flex: 2,
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                child: Text(
                                                                                                  rowProduitsRecord.restaurant,
                                                                                                  maxLines: 2,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'sf pro text',
                                                                                                        color: FlutterFlowTheme.of(context).tertiary400,
                                                                                                        fontSize: 16.0,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                '${dateTimeFormat(
                                                                                                  'Hm',
                                                                                                  rowProduitsRecord.ouv,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                )} - ${dateTimeFormat(
                                                                                                  'Hm',
                                                                                                  rowProduitsRecord.clo,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                )}',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'sf pro text',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      useGoogleFonts: false,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  () {
                                                                                                    if (rowProduitsRecord.multi == false) {
                                                                                                      return '${functions.multippl(rowProduitsRecord.prix, FFAppState().qty).toString()} FCFA';
                                                                                                    } else if ((rowProduitsRecord.multi == true) && (FFAppState().prixDefaut == false)) {
                                                                                                      return '${functions.multippl(rowProduitsRecord.prixComplet, FFAppState().qty).toString()} FCFA';
                                                                                                    } else {
                                                                                                      return '${functions.multippl(rowProduitsRecord.prixDemi, FFAppState().qty).toString()} FCFA';
                                                                                                    }
                                                                                                  }(),
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'sf pro text',
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 18.0,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            if (rowProduitsRecord.pourcentage != 0)
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                '- ${rowProduitsRecord.pourcentage.toString()} %',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                              )),
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
                                                                      ),
                                                                    ],
                                                                  ),
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
                                        KeepAliveWidgetWrapper(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 50.0),
                                            child: StreamBuilder<
                                                List<ProduitsRecord>>(
                                              stream: _model.tendance(
                                                requestFn: () =>
                                                    queryProduitsRecord(
                                                  queryBuilder:
                                                      (produitsRecord) =>
                                                          produitsRecord
                                                              .where(
                                                                  'disponible',
                                                                  isEqualTo:
                                                                      true)
                                                              .orderBy('vue',
                                                                  descending:
                                                                      true),
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child:
                                                        BlankListCol1Widget(),
                                                  );
                                                }
                                                List<ProduitsRecord>
                                                    columnProduitsRecordList =
                                                    snapshot.data!;
                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        columnProduitsRecordList
                                                            .length,
                                                        (columnIndex) {
                                                      final columnProduitsRecord =
                                                          columnProduitsRecordList[
                                                              columnIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    4.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              1.0,
                                                          height: 150.0,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 500.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x001E2039),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        20.0),
                                                            child: StreamBuilder<
                                                                ProduitsRecord>(
                                                              stream: ProduitsRecord
                                                                  .getDocument(
                                                                      columnProduitsRecord
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            10.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final rowProduitsRecord =
                                                                    snapshot
                                                                        .data!;
                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                              .prixDefaut =
                                                                          true;
                                                                      FFAppState()
                                                                              .complet =
                                                                          false;
                                                                    });
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                              .refFav =
                                                                          null;
                                                                      FFAppState()
                                                                          .qty = 1;
                                                                    });

                                                                    final produitsUpdateData =
                                                                        {
                                                                      'vue': FieldValue
                                                                          .increment(
                                                                              1),
                                                                    };
                                                                    await rowProduitsRecord
                                                                        .reference
                                                                        .update(
                                                                            produitsUpdateData);
                                                                    showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      barrierColor:
                                                                          Color(
                                                                              0x00000000),
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return Padding(
                                                                          padding:
                                                                              MediaQuery.of(context).viewInsets,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 1.0,
                                                                            child:
                                                                                DetailWidget(
                                                                              prodRef: rowProduitsRecord.reference,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          imageUrl:
                                                                              rowProduitsRecord.image,
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              100.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
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
                                                                                            Expanded(
                                                                                              flex: 2,
                                                                                              child: Text(
                                                                                                rowProduitsRecord.nom,
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
                                                                                          children: [
                                                                                            Expanded(
                                                                                              flex: 2,
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                child: Text(
                                                                                                  rowProduitsRecord.restaurant,
                                                                                                  maxLines: 2,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'sf pro text',
                                                                                                        color: FlutterFlowTheme.of(context).tertiary400,
                                                                                                        fontSize: 16.0,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                '${dateTimeFormat(
                                                                                                  'Hm',
                                                                                                  rowProduitsRecord.ouv,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                )} - ${dateTimeFormat(
                                                                                                  'Hm',
                                                                                                  rowProduitsRecord.clo,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                )}',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'sf pro text',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      useGoogleFonts: false,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  () {
                                                                                                    if (rowProduitsRecord.multi == false) {
                                                                                                      return '${functions.multippl(rowProduitsRecord.prix, FFAppState().qty).toString()} FCFA';
                                                                                                    } else if ((rowProduitsRecord.multi == true) && (FFAppState().prixDefaut == false)) {
                                                                                                      return '${functions.multippl(rowProduitsRecord.prixComplet, FFAppState().qty).toString()} FCFA';
                                                                                                    } else {
                                                                                                      return '${functions.multippl(rowProduitsRecord.prixDemi, FFAppState().qty).toString()} FCFA';
                                                                                                    }
                                                                                                  }(),
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'sf pro text',
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 18.0,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            if (rowProduitsRecord.pourcentage != 0)
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                '- ${rowProduitsRecord.pourcentage.toString()} %',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                              )),
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
                                                                      ),
                                                                    ],
                                                                  ),
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
                                        KeepAliveWidgetWrapper(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 50.0),
                                            child: StreamBuilder<
                                                List<ProduitsRecord>>(
                                              stream: _model.nouveaute(
                                                requestFn: () =>
                                                    queryProduitsRecord(
                                                  queryBuilder:
                                                      (produitsRecord) =>
                                                          produitsRecord
                                                              .where(
                                                                  'disponible',
                                                                  isEqualTo:
                                                                      true)
                                                              .orderBy('date',
                                                                  descending:
                                                                      true),
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child:
                                                        BlankListCol1Widget(),
                                                  );
                                                }
                                                List<ProduitsRecord>
                                                    columnProduitsRecordList =
                                                    snapshot.data!;
                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        columnProduitsRecordList
                                                            .length,
                                                        (columnIndex) {
                                                      final columnProduitsRecord =
                                                          columnProduitsRecordList[
                                                              columnIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    4.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              1.0,
                                                          height: 150.0,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 500.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x001E2039),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        20.0),
                                                            child: StreamBuilder<
                                                                ProduitsRecord>(
                                                              stream: ProduitsRecord
                                                                  .getDocument(
                                                                      columnProduitsRecord
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            10.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final rowProduitsRecord =
                                                                    snapshot
                                                                        .data!;
                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                              .prixDefaut =
                                                                          true;
                                                                      FFAppState()
                                                                              .complet =
                                                                          false;
                                                                    });
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                              .refFav =
                                                                          null;
                                                                      FFAppState()
                                                                          .qty = 1;
                                                                    });

                                                                    final produitsUpdateData =
                                                                        {
                                                                      'vue': FieldValue
                                                                          .increment(
                                                                              1),
                                                                    };
                                                                    await rowProduitsRecord
                                                                        .reference
                                                                        .update(
                                                                            produitsUpdateData);
                                                                    showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      barrierColor:
                                                                          Color(
                                                                              0x00000000),
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return Padding(
                                                                          padding:
                                                                              MediaQuery.of(context).viewInsets,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 1.0,
                                                                            child:
                                                                                DetailWidget(
                                                                              prodRef: rowProduitsRecord.reference,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          imageUrl:
                                                                              rowProduitsRecord.image,
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              100.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
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
                                                                                            Expanded(
                                                                                              flex: 2,
                                                                                              child: Text(
                                                                                                rowProduitsRecord.nom,
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
                                                                                          children: [
                                                                                            Expanded(
                                                                                              flex: 2,
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                child: Text(
                                                                                                  rowProduitsRecord.restaurant,
                                                                                                  maxLines: 2,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'sf pro text',
                                                                                                        color: FlutterFlowTheme.of(context).tertiary400,
                                                                                                        fontSize: 16.0,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                '${dateTimeFormat(
                                                                                                  'Hm',
                                                                                                  rowProduitsRecord.ouv,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                )} - ${dateTimeFormat(
                                                                                                  'Hm',
                                                                                                  rowProduitsRecord.clo,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                )}',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'sf pro text',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      useGoogleFonts: false,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  () {
                                                                                                    if (rowProduitsRecord.multi == false) {
                                                                                                      return '${functions.multippl(rowProduitsRecord.prix, FFAppState().qty).toString()} FCFA';
                                                                                                    } else if ((rowProduitsRecord.multi == true) && (FFAppState().prixDefaut == false)) {
                                                                                                      return '${functions.multippl(rowProduitsRecord.prixComplet, FFAppState().qty).toString()} FCFA';
                                                                                                    } else {
                                                                                                      return '${functions.multippl(rowProduitsRecord.prixDemi, FFAppState().qty).toString()} FCFA';
                                                                                                    }
                                                                                                  }(),
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'sf pro text',
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 18.0,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            if (rowProduitsRecord.pourcentage != 0)
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                '- ${rowProduitsRecord.pourcentage.toString()} %',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                              )),
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
                                                                      ),
                                                                    ],
                                                                  ),
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
                                        KeepAliveWidgetWrapper(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 50.0),
                                            child: StreamBuilder<
                                                List<ProduitsRecord>>(
                                              stream: _model.mieuxnote(
                                                requestFn: () =>
                                                    queryProduitsRecord(
                                                  queryBuilder:
                                                      (produitsRecord) =>
                                                          produitsRecord
                                                              .where(
                                                                  'disponible',
                                                                  isEqualTo:
                                                                      true)
                                                              .orderBy(
                                                                  'moyenne',
                                                                  descending:
                                                                      true),
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child:
                                                        BlankListCol1Widget(),
                                                  );
                                                }
                                                List<ProduitsRecord>
                                                    columnProduitsRecordList =
                                                    snapshot.data!;
                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        columnProduitsRecordList
                                                            .length,
                                                        (columnIndex) {
                                                      final columnProduitsRecord =
                                                          columnProduitsRecordList[
                                                              columnIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    4.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              1.0,
                                                          height: 150.0,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 500.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x001E2039),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        20.0),
                                                            child: StreamBuilder<
                                                                ProduitsRecord>(
                                                              stream: ProduitsRecord
                                                                  .getDocument(
                                                                      columnProduitsRecord
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            10.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final rowProduitsRecord =
                                                                    snapshot
                                                                        .data!;
                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                              .prixDefaut =
                                                                          true;
                                                                      FFAppState()
                                                                              .complet =
                                                                          false;
                                                                    });
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                              .refFav =
                                                                          null;
                                                                      FFAppState()
                                                                          .qty = 1;
                                                                    });

                                                                    final produitsUpdateData =
                                                                        {
                                                                      'vue': FieldValue
                                                                          .increment(
                                                                              1),
                                                                    };
                                                                    await rowProduitsRecord
                                                                        .reference
                                                                        .update(
                                                                            produitsUpdateData);
                                                                    showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      barrierColor:
                                                                          Color(
                                                                              0x00000000),
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return Padding(
                                                                          padding:
                                                                              MediaQuery.of(context).viewInsets,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 1.0,
                                                                            child:
                                                                                DetailWidget(
                                                                              prodRef: rowProduitsRecord.reference,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          imageUrl:
                                                                              rowProduitsRecord.image,
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              100.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
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
                                                                                            Expanded(
                                                                                              flex: 2,
                                                                                              child: Text(
                                                                                                rowProduitsRecord.nom,
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
                                                                                          children: [
                                                                                            Expanded(
                                                                                              flex: 2,
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                child: Text(
                                                                                                  rowProduitsRecord.restaurant,
                                                                                                  maxLines: 2,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'sf pro text',
                                                                                                        color: FlutterFlowTheme.of(context).tertiary400,
                                                                                                        fontSize: 16.0,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                '${dateTimeFormat(
                                                                                                  'Hm',
                                                                                                  rowProduitsRecord.ouv,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                )} - ${dateTimeFormat(
                                                                                                  'Hm',
                                                                                                  rowProduitsRecord.clo,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                )}',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'sf pro text',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      useGoogleFonts: false,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  () {
                                                                                                    if (rowProduitsRecord.multi == false) {
                                                                                                      return '${functions.multippl(rowProduitsRecord.prix, FFAppState().qty).toString()} FCFA';
                                                                                                    } else if ((rowProduitsRecord.multi == true) && (FFAppState().prixDefaut == false)) {
                                                                                                      return '${functions.multippl(rowProduitsRecord.prixComplet, FFAppState().qty).toString()} FCFA';
                                                                                                    } else {
                                                                                                      return '${functions.multippl(rowProduitsRecord.prixDemi, FFAppState().qty).toString()} FCFA';
                                                                                                    }
                                                                                                  }(),
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'sf pro text',
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 18.0,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            if (rowProduitsRecord.pourcentage != 0)
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                '- ${rowProduitsRecord.pourcentage.toString()} %',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                              )),
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
                                                                      ),
                                                                    ],
                                                                  ),
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
                                        KeepAliveWidgetWrapper(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 50.0),
                                            child: StreamBuilder<
                                                List<ProduitsRecord>>(
                                              stream: _model.plusCommente(
                                                requestFn: () =>
                                                    queryProduitsRecord(
                                                  queryBuilder:
                                                      (produitsRecord) =>
                                                          produitsRecord
                                                              .where(
                                                                  'disponible',
                                                                  isEqualTo:
                                                                      true)
                                                              .orderBy(
                                                                  'nbreFav',
                                                                  descending:
                                                                      true),
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child:
                                                        BlankListCol1Widget(),
                                                  );
                                                }
                                                List<ProduitsRecord>
                                                    columnProduitsRecordList =
                                                    snapshot.data!;
                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        columnProduitsRecordList
                                                            .length,
                                                        (columnIndex) {
                                                      final columnProduitsRecord =
                                                          columnProduitsRecordList[
                                                              columnIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    4.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              1.0,
                                                          height: 150.0,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 500.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x001E2039),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        20.0),
                                                            child: StreamBuilder<
                                                                ProduitsRecord>(
                                                              stream: ProduitsRecord
                                                                  .getDocument(
                                                                      columnProduitsRecord
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            10.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final rowProduitsRecord =
                                                                    snapshot
                                                                        .data!;
                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                              .prixDefaut =
                                                                          true;
                                                                      FFAppState()
                                                                              .complet =
                                                                          false;
                                                                    });
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                              .refFav =
                                                                          null;
                                                                      FFAppState()
                                                                          .qty = 1;
                                                                    });

                                                                    final produitsUpdateData =
                                                                        {
                                                                      'vue': FieldValue
                                                                          .increment(
                                                                              1),
                                                                    };
                                                                    await rowProduitsRecord
                                                                        .reference
                                                                        .update(
                                                                            produitsUpdateData);
                                                                    showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      barrierColor:
                                                                          Color(
                                                                              0x00000000),
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return Padding(
                                                                          padding:
                                                                              MediaQuery.of(context).viewInsets,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 1.0,
                                                                            child:
                                                                                DetailWidget(
                                                                              prodRef: rowProduitsRecord.reference,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          imageUrl:
                                                                              rowProduitsRecord.image,
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              100.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
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
                                                                                            Expanded(
                                                                                              flex: 2,
                                                                                              child: Text(
                                                                                                rowProduitsRecord.nom,
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
                                                                                          children: [
                                                                                            Expanded(
                                                                                              flex: 2,
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                child: Text(
                                                                                                  rowProduitsRecord.restaurant,
                                                                                                  maxLines: 2,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'sf pro text',
                                                                                                        color: FlutterFlowTheme.of(context).tertiary400,
                                                                                                        fontSize: 16.0,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                '${dateTimeFormat(
                                                                                                  'Hm',
                                                                                                  rowProduitsRecord.ouv,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                )} - ${dateTimeFormat(
                                                                                                  'Hm',
                                                                                                  rowProduitsRecord.clo,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                )}',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'sf pro text',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      useGoogleFonts: false,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  () {
                                                                                                    if (rowProduitsRecord.multi == false) {
                                                                                                      return '${functions.multippl(rowProduitsRecord.prix, FFAppState().qty).toString()} FCFA';
                                                                                                    } else if ((rowProduitsRecord.multi == true) && (FFAppState().prixDefaut == false)) {
                                                                                                      return '${functions.multippl(rowProduitsRecord.prixComplet, FFAppState().qty).toString()} FCFA';
                                                                                                    } else {
                                                                                                      return '${functions.multippl(rowProduitsRecord.prixDemi, FFAppState().qty).toString()} FCFA';
                                                                                                    }
                                                                                                  }(),
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'sf pro text',
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 18.0,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            if (rowProduitsRecord.pourcentage != 0)
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                '- ${rowProduitsRecord.pourcentage.toString()} %',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                              )),
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
                                                                      ),
                                                                    ],
                                                                  ),
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
              ),
            ),
            if (responsiveVisibility(
              context: context,
              tabletLandscape: false,
              desktop: false,
            ))
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                height: 70.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).menucol,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 12.0,
                                      color: Color(0x33000000),
                                      offset: Offset(0.0, 5.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                child: ClipRRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 2.0,
                                      sigmaY: 2.0,
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          1.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .menucol,
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed('Accueil');
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.12,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00272B50),
                                                ),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 30.0,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.home,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    context
                                                        .pushNamed('Accueil');
                                                  },
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.12,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x00272B50),
                                              ),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 30.0,
                                                icon: Icon(
                                                  FFIcons.kfiRrApps,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 20.0,
                                                ),
                                                onPressed: () async {
                                                  context.pushNamed('category');
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.3,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.3,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary400,
                                                            Color(0x85202034)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  0, 1.0),
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 32.0,
                                                        icon: Icon(
                                                          FFIcons.kfiRrShop,
                                                          color: Colors.white,
                                                          size: 22.0,
                                                        ),
                                                        onPressed: () async {
                                                          context.pushNamed(
                                                              'restaurants');
                                                        },
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                            Color(0x85202034)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  0, 1.0),
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 32.0,
                                                        icon: Icon(
                                                          FFIcons.kfiRrUtensils,
                                                          color: Colors.white,
                                                          size: 22.0,
                                                        ),
                                                        onPressed: () async {
                                                          context.pushNamed(
                                                              'cart2');
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.12,
                                              height: 100.0,
                                              decoration: BoxDecoration(),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 30.0,
                                                icon: Icon(
                                                  FFIcons.kfiRrHeart,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 20.0,
                                                ),
                                                onPressed: () async {
                                                  context.pushNamed('favoris');
                                                },
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.13,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x00272B50),
                                              ),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                icon: Icon(
                                                  Icons.person_outline,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 25.0,
                                                ),
                                                onPressed: () async {
                                                  context.pushNamed('user');
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            ))
              Align(
                alignment: AlignmentDirectional(0.0, 0.44),
                child: StreamBuilder<List<ProduitsRecord>>(
                  stream: queryProduitsRecord(),
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
                    List<ProduitsRecord> columnProduitsRecordList =
                        snapshot.data!;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(columnProduitsRecordList.length,
                          (columnIndex) {
                        final columnProduitsRecord =
                            columnProduitsRecordList[columnIndex];
                        return Align(
                          alignment: AlignmentDirectional(0.02, 0.67),
                          child: StreamBuilder<ProduitsRecord>(
                            stream: ProduitsRecord.getDocument(
                                columnProduitsRecord.reference),
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
                              final buttonProduitsRecord = snapshot.data!;
                              return FFButtonWidget(
                                onPressed: () async {
                                  FFAppState().update(() {
                                    FFAppState().prixDefaut = false;
                                    FFAppState().refFav = null;
                                  });
                                  FFAppState().update(() {
                                    FFAppState().qty = 1;
                                  });
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    barrierColor: Color(0x00000000),
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              1.0,
                                          child: DetailWidget(
                                            prodRef:
                                                buttonProduitsRecord.reference,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                text: 'Button',
                                options: FFButtonOptions(
                                  width: 130.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
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
                        );
                      }),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
