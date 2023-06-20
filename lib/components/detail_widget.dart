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
import 'detail_model.dart';
export 'detail_model.dart';

class DetailWidget extends StatefulWidget {
  const DetailWidget({
    Key? key,
    this.prodRef,
  }) : super(key: key);

  final DocumentReference? prodRef;

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  late DetailModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailModel());

    _model.indicController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<ProduitsRecord>(
      stream: ProduitsRecord.getDocument(widget.prodRef!),
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
        final stackProduitsRecord = snapshot.data!;
        return Stack(
          children: [
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10.0,
                  sigmaY: 10.0,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 1.0,
                  decoration: BoxDecoration(
                    color: Color(0x00FFFFFF),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 450.0,
                ),
                decoration: BoxDecoration(
                  color: Color(0x00272B50),
                ),
                child: StreamBuilder<ProduitsRecord>(
                  stream: ProduitsRecord.getDocument(widget.prodRef!),
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
                    final stackProduitsRecord = snapshot.data!;
                    return Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: StreamBuilder<List<RestaurantsRecord>>(
                            stream: queryRestaurantsRecord(
                              queryBuilder: (restaurantsRecord) =>
                                  restaurantsRecord.where('nom',
                                      isEqualTo:
                                          stackProduitsRecord.restaurant),
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
                                          FlutterFlowTheme.of(context).primary,
                                      size: 10.0,
                                    ),
                                  ),
                                );
                              }
                              List<RestaurantsRecord>
                                  containerRestaurantsRecordList =
                                  snapshot.data!;
                              final containerRestaurantsRecord =
                                  containerRestaurantsRecordList.isNotEmpty
                                      ? containerRestaurantsRecordList.first
                                      : null;
                              return Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                constraints: BoxConstraints(
                                  maxWidth: 450.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(40.0),
                                    topRight: Radius.circular(40.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 140.0, 0.0, 0.0),
                                  child: StreamBuilder<List<PanierRecord>>(
                                    stream: queryPanierRecord(
                                      parent: currentUserReference,
                                      queryBuilder: (panierRecord) =>
                                          panierRecord.whereIn(
                                              'ref', FFAppState().panieRef),
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
                                      List<PanierRecord>
                                          containerPanierRecordList =
                                          snapshot.data!;
                                      return Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  18.0, 0.0, 18.0, 10.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    if (stackProduitsRecord
                                                            .favoris
                                                            .contains(
                                                                currentUserEmail) ==
                                                        true)
                                                      StreamBuilder<
                                                          List<FavRecord>>(
                                                        stream: queryFavRecord(
                                                          parent:
                                                              currentUserReference,
                                                          queryBuilder: (favRecord) =>
                                                              favRecord.where(
                                                                  'ref',
                                                                  isEqualTo:
                                                                      stackProduitsRecord
                                                                          .reference),
                                                          singleRecord: true,
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
                                                          List<FavRecord>
                                                              iconButtonFavRecordList =
                                                              snapshot.data!;
                                                          final iconButtonFavRecord =
                                                              iconButtonFavRecordList
                                                                      .isNotEmpty
                                                                  ? iconButtonFavRecordList
                                                                      .first
                                                                  : null;
                                                          return FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 60.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .favorite_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 22.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await iconButtonFavRecord!
                                                                  .reference
                                                                  .delete();

                                                              final produitsUpdateData =
                                                                  {
                                                                'favoris':
                                                                    FieldValue
                                                                        .arrayRemove([
                                                                  currentUserEmail
                                                                ]),
                                                                'nbreFav': FieldValue
                                                                    .increment(
                                                                        -(1)),
                                                              };
                                                              await stackProduitsRecord
                                                                  .reference
                                                                  .update(
                                                                      produitsUpdateData);
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    if (stackProduitsRecord
                                                            .favoris
                                                            .contains(
                                                                currentUserEmail) ==
                                                        false)
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          FFIcons.kfiRrHeart,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          final favCreateData =
                                                              createFavRecordData(
                                                            date:
                                                                getCurrentTimestamp,
                                                            ref:
                                                                stackProduitsRecord
                                                                    .reference,
                                                            qty: 1,
                                                          );
                                                          var favRecordReference =
                                                              FavRecord.createDoc(
                                                                  currentUserReference!);
                                                          await favRecordReference
                                                              .set(
                                                                  favCreateData);
                                                          _model.ref = FavRecord
                                                              .getDocumentFromData(
                                                                  favCreateData,
                                                                  favRecordReference);
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .refFav =
                                                                _model.ref!
                                                                    .reference;
                                                          });

                                                          final produitsUpdateData =
                                                              {
                                                            'favoris': FieldValue
                                                                .arrayUnion([
                                                              currentUserEmail
                                                            ]),
                                                            'nbreFav':
                                                                FieldValue
                                                                    .increment(
                                                                        1),
                                                          };
                                                          await stackProduitsRecord
                                                              .reference
                                                              .update(
                                                                  produitsUpdateData);

                                                          setState(() {});
                                                        },
                                                      ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                        height: 80.0,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 250.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      stackProduitsRecord
                                                                          .nom,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      maxLines:
                                                                          2,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'sf pro text',
                                                                            fontSize:
                                                                                20.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
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
                                                          Text(
                                                            () {
                                                              if (stackProduitsRecord
                                                                      .multi ==
                                                                  false) {
                                                                return '${functions.multippl(stackProduitsRecord.prix, FFAppState().qty).toString()} FCFA';
                                                              } else if ((stackProduitsRecord
                                                                          .multi ==
                                                                      true) &&
                                                                  (FFAppState()
                                                                          .complet ==
                                                                      true)) {
                                                                return '${functions.multippl(stackProduitsRecord.prixComplet, FFAppState().qty).toString()} FCFA';
                                                              } else {
                                                                return '${functions.multippl(stackProduitsRecord.prixDemi, FFAppState().qty).toString()} FCFA';
                                                              }
                                                            }(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'sf pro text',
                                                                  fontSize:
                                                                      18.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.85,
                                                    height: 1.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x3EA0A4A8),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Ouverture - Fermeture',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'sf pro text',
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      10.0,
                                                                      8.0,
                                                                      10.0),
                                                          child: Text(
                                                            '${dateTimeFormat(
                                                              'Hm',
                                                              stackProduitsRecord
                                                                  .ouv,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            )} - ${dateTimeFormat(
                                                              'Hm',
                                                              stackProduitsRecord
                                                                  .clo,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            )}',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'sf pro text',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      14.0,
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
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Quantité',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'sf pro text',
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                      Container(
                                                        width: 110.0,
                                                        height: 35.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: Color(
                                                                0x819E9E9E),
                                                          ),
                                                        ),
                                                        child:
                                                            FlutterFlowCountController(
                                                          decrementIconBuilder:
                                                              (enabled) =>
                                                                  FaIcon(
                                                            FontAwesomeIcons
                                                                .minus,
                                                            color: enabled
                                                                ? Color(
                                                                    0xDD000000)
                                                                : Color(
                                                                    0xFFEEEEEE),
                                                            size: 15.0,
                                                          ),
                                                          incrementIconBuilder:
                                                              (enabled) =>
                                                                  FaIcon(
                                                            FontAwesomeIcons
                                                                .plus,
                                                            color: enabled
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : Color(
                                                                    0xFFEEEEEE),
                                                            size: 15.0,
                                                          ),
                                                          countBuilder:
                                                              (count) => Text(
                                                            count.toString(),
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Roboto',
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 13.0,
                                                            ),
                                                          ),
                                                          count: _model
                                                              .countControllerValue ??= 1,
                                                          updateCount:
                                                              (count) async {
                                                            setState(() => _model
                                                                    .countControllerValue =
                                                                count);
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState().qty =
                                                                  _model
                                                                      .countControllerValue!;
                                                            });
                                                          },
                                                          stepSize: 1,
                                                          minimum: 1,
                                                          maximum: 10,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 10.0),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.85,
                                                    height: 1.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x3EA0A4A8),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (stackProduitsRecord
                                                            .description !=
                                                        '0')
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  flex: 2,
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      stackProduitsRecord
                                                                          .description,
                                                                      'Aucune description',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
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
                                                                          10.0),
                                                              child: Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.85,
                                                                height: 1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0x3EA0A4A8),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                  ],
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
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            stackProduitsRecord
                                                                .restaurant,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'sf pro text',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary400,
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (stackProduitsRecord
                                                            .prix ==
                                                        0)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    14.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
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
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .complet =
                                                                      true;
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 130.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FFAppState()
                                                                              .complet ==
                                                                          true
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          20.0,
                                                                          10.0,
                                                                          20.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      stackProduitsRecord
                                                                          .nomComplet,
                                                                      'null',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'sf pro text',
                                                                          color: FFAppState().complet == true
                                                                              ? Colors.white
                                                                              : FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ),
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
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .complet =
                                                                      false;
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 130.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FFAppState()
                                                                              .complet ==
                                                                          false
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          20.0,
                                                                          10.0,
                                                                          20.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      stackProduitsRecord
                                                                          .nomDemi,
                                                                      'null',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'sf pro text',
                                                                          color: FFAppState().complet == true
                                                                              ? FlutterFlowTheme.of(context).primaryText
                                                                              : Colors.white,
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.4,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              'Voulez vous personnaliser cette commande ?',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
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
                                                                      .primaryText,
                                                            ),
                                                            child: Checkbox(
                                                              value: _model
                                                                      .checkboxkkValue ??=
                                                                  false,
                                                              onChanged:
                                                                  (newValue) async {
                                                                setState(() =>
                                                                    _model.checkboxkkValue =
                                                                        newValue!);
                                                                if (newValue!) {
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .prixpers =
                                                                        stackProduitsRecord
                                                                            .prix;
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .prixpers =
                                                                        stackProduitsRecord
                                                                            .prix;
                                                                  });
                                                                }
                                                              },
                                                              activeColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              checkColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (_model
                                                                  .checkboxkkValue ==
                                                              true)
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            18.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.45,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            'Personnalisez le prix unitaire',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'sf pro text',
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                140.0,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.prixpers1Controller ??= TextEditingController(
                                                                                text: stackProduitsRecord.prix.toString(),
                                                                              ),
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
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
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              textAlign: TextAlign.center,
                                                                              keyboardType: TextInputType.number,
                                                                              validator: _model.prixpers1ControllerValidator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            20.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .indicController,
                                                                      onFieldSubmitted:
                                                                          (_) async {
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().indication = _model
                                                                              .indicController
                                                                              .text;
                                                                        });
                                                                      },
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            'Entrez une indication pour cette commande. Cela sera pris en compte par le livreur',
                                                                        hintStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'sf pro text',
                                                                              fontSize: 16.0,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'sf pro text',
                                                                            fontSize:
                                                                                18.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                            lineHeight:
                                                                                2.0,
                                                                          ),
                                                                      maxLines:
                                                                          5,
                                                                      validator: _model
                                                                          .indicControllerValidator
                                                                          .asValidator(
                                                                              context),
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: StreamBuilder<
                                                            List<PanierRecord>>(
                                                          stream:
                                                              queryPanierRecord(
                                                            parent:
                                                                currentUserReference,
                                                            queryBuilder: (panierRecord) =>
                                                                panierRecord.where(
                                                                    'prodRef',
                                                                    isEqualTo:
                                                                        stackProduitsRecord
                                                                            .reference),
                                                            singleRecord: true,
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
                                                            List<PanierRecord>
                                                                buttonPanierRecordList =
                                                                snapshot.data!;
                                                            final buttonPanierRecord =
                                                                buttonPanierRecordList
                                                                        .isNotEmpty
                                                                    ? buttonPanierRecordList
                                                                        .first
                                                                    : null;
                                                            return FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                currentUserLocationValue =
                                                                    await getCurrentUserLocation(
                                                                        defaultLocation: LatLng(
                                                                            0.0,
                                                                            0.0));
                                                                if (await getPermissionStatus(
                                                                    locationPermission)) {
                                                                  FFAppState()
                                                                      .update(
                                                                          () {
                                                                    FFAppState()
                                                                        .panieRef = [];
                                                                    FFAppState()
                                                                            .loc =
                                                                        true;
                                                                  });
                                                                  if (FFAppState()
                                                                          .panieRef
                                                                          .length ==
                                                                      0) {
                                                                    if (!_model
                                                                        .checkboxkkValue!) {
                                                                      setState(
                                                                          () {
                                                                        FFAppState().prixpers =
                                                                            stackProduitsRecord.prix;
                                                                      });
                                                                    } else {
                                                                      setState(
                                                                          () {
                                                                        FFAppState().prixpers = int.parse(_model
                                                                            .prixpers1Controller
                                                                            .text);
                                                                      });
                                                                    }

                                                                    if (stackProduitsRecord
                                                                            .disponible ==
                                                                        true) {
                                                                      if (FFAppState()
                                                                              .prixpers >=
                                                                          stackProduitsRecord
                                                                              .prix) {
                                                                        final panierCreateData =
                                                                            createPanierRecordData(
                                                                          prodRef:
                                                                              stackProduitsRecord.reference,
                                                                          qty: valueOrDefault<
                                                                              int>(
                                                                            FFAppState().qty,
                                                                            1,
                                                                          ),
                                                                          mt: functions.reduce(
                                                                              FFAppState().prixpers > stackProduitsRecord.prix
                                                                                  ? functions.multippl(FFAppState().prixpers, FFAppState().qty)
                                                                                  : () {
                                                                                      if (stackProduitsRecord.multi == false) {
                                                                                        return functions.multippl(stackProduitsRecord.prix, FFAppState().qty);
                                                                                      } else if ((stackProduitsRecord.multi == true) && (FFAppState().complet == true)) {
                                                                                        return functions.multippl(stackProduitsRecord.prixComplet, FFAppState().qty);
                                                                                      } else {
                                                                                        return functions.multippl(stackProduitsRecord.prixDemi, FFAppState().qty);
                                                                                      }
                                                                                    }(),
                                                                              stackProduitsRecord.pourcentage),
                                                                          type:
                                                                              () {
                                                                            if (stackProduitsRecord.multi ==
                                                                                false) {
                                                                              return 'simple';
                                                                            } else if ((stackProduitsRecord.multi == true) &&
                                                                                (FFAppState().complet == true)) {
                                                                              return 'plat complet';
                                                                            } else if (stackProduitsRecord.category ==
                                                                                'Ravitaillement') {
                                                                              return 'Ravitaillement';
                                                                            } else {
                                                                              return 'demi plat';
                                                                            }
                                                                          }(),
                                                                          resto:
                                                                              valueOrDefault<String>(
                                                                            containerRestaurantsRecord!.nom,
                                                                            'zemfood',
                                                                          ),
                                                                          adress:
                                                                              valueOrDefault<String>(
                                                                            containerRestaurantsRecord!.adresse,
                                                                            'cotonou',
                                                                          ),
                                                                          num: valueOrDefault<
                                                                              String>(
                                                                            containerRestaurantsRecord!.tel,
                                                                            '-',
                                                                          ),
                                                                          pret:
                                                                              false,
                                                                          pay:
                                                                              false,
                                                                          indic:
                                                                              valueOrDefault<String>(
                                                                            _model.indicController.text,
                                                                            'rass',
                                                                          ),
                                                                          prixperso:
                                                                              FFAppState().prixpers,
                                                                        );
                                                                        var panierRecordReference =
                                                                            PanierRecord.createDoc(currentUserReference!);
                                                                        await panierRecordReference
                                                                            .set(panierCreateData);
                                                                        _model.refpanier = PanierRecord.getDocumentFromData(
                                                                            panierCreateData,
                                                                            panierRecordReference);
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().addToPanieRef(_model
                                                                              .refpanier!
                                                                              .reference);
                                                                        });

                                                                        final panierUpdateData =
                                                                            createPanierRecordData(
                                                                          ref: _model
                                                                              .refpanier!
                                                                              .reference,
                                                                        );
                                                                        await _model
                                                                            .refpanier!
                                                                            .reference
                                                                            .update(panierUpdateData);
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Ajouté au panier',
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                        );
                                                                        if (FFAppState().paiementEtape ==
                                                                            true) {
                                                                          await FFAppState()
                                                                              .refPrep!
                                                                              .delete();
                                                                        }

                                                                        final precommandeCreateData =
                                                                            {
                                                                          ...createPrecommandeRecordData(
                                                                            refcli:
                                                                                currentUserReference,
                                                                            soustot: functions.reduce(
                                                                                FFAppState().prixpers > stackProduitsRecord.prix
                                                                                    ? functions.multippl(FFAppState().prixpers, FFAppState().qty)
                                                                                    : () {
                                                                                        if (stackProduitsRecord.multi == false) {
                                                                                          return functions.multippl(stackProduitsRecord.prix, FFAppState().qty);
                                                                                        } else if ((stackProduitsRecord.multi == true) && (FFAppState().complet == true)) {
                                                                                          return functions.multippl(stackProduitsRecord.prixComplet, FFAppState().qty);
                                                                                        } else {
                                                                                          return functions.multippl(stackProduitsRecord.prixDemi, FFAppState().qty);
                                                                                        }
                                                                                      }(),
                                                                                stackProduitsRecord.pourcentage),
                                                                            date:
                                                                                getCurrentTimestamp,
                                                                            nom:
                                                                                random_data.randomString(
                                                                              12,
                                                                              25,
                                                                              true,
                                                                              true,
                                                                              true,
                                                                            ),
                                                                            statut:
                                                                                'Soumis',
                                                                            livrer:
                                                                                false,
                                                                            dateAjout:
                                                                                getCurrentTimestamp,
                                                                            posRest:
                                                                                containerRestaurantsRecord!.pos,
                                                                            lieu2:
                                                                                currentUserLocationValue,
                                                                          ),
                                                                          'listecom':
                                                                              FFAppState().panieRef,
                                                                        };
                                                                        var precommandeRecordReference = PrecommandeRecord
                                                                            .collection
                                                                            .doc();
                                                                        await precommandeRecordReference
                                                                            .set(precommandeCreateData);
                                                                        _model.precommande = PrecommandeRecord.getDocumentFromData(
                                                                            precommandeCreateData,
                                                                            precommandeRecordReference);
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().refPrep = _model
                                                                              .precommande!
                                                                              .reference;
                                                                          FFAppState().prixpers =
                                                                              0;
                                                                        });

                                                                        context
                                                                            .pushNamed(
                                                                          'moyenPaiement',
                                                                          queryParameters:
                                                                              {
                                                                            'refComm':
                                                                                serializeParam(
                                                                              _model.precommande!.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                            'prod':
                                                                                serializeParam(
                                                                              widget.prodRef,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      } else {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Erreur',
                                                                              style: GoogleFonts.getFont(
                                                                                'Roboto',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 13.0,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                          ),
                                                                        );
                                                                      }
                                                                    } else {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Cet article n\'est pas disponible pour le moment',
                                                                            style:
                                                                                GoogleFonts.getFont(
                                                                              'Roboto',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 13.0,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                        ),
                                                                      );
                                                                    }
                                                                  } else {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Maximum atteint',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                    );
                                                                  }
                                                                } else {
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .loc =
                                                                        false;
                                                                  });
                                                                }

                                                                setState(() {});
                                                              },
                                                              text:
                                                                  'Ajouter au Panier',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 130.0,
                                                                height: 40.0,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'sf pro text',
                                                                      color: Colors
                                                                          .white,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                                elevation: 2.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Moyenne:',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  functions
                                                                      .rate(
                                                                          stackProduitsRecord
                                                                              .note
                                                                              .toList(),
                                                                          stackProduitsRecord
                                                                              .note
                                                                              .length)
                                                                      .toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'sf pro text',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            18.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .star_sharp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: StreamBuilder<
                                                            List<AvisRecord>>(
                                                          stream:
                                                              queryAvisRecord(
                                                            parent:
                                                                stackProduitsRecord
                                                                    .reference,
                                                            queryBuilder: (avisRecord) =>
                                                                avisRecord.orderBy(
                                                                    'date',
                                                                    descending:
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
                                                            List<AvisRecord>
                                                                columnAvisRecordList =
                                                                snapshot.data!;
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List.generate(
                                                                  columnAvisRecordList
                                                                      .length,
                                                                  (columnIndex) {
                                                                final columnAvisRecord =
                                                                    columnAvisRecordList[
                                                                        columnIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: StreamBuilder<
                                                                      AvisRecord>(
                                                                    stream: AvisRecord.getDocument(
                                                                        columnAvisRecord
                                                                            .reference),
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
                                                                      final menuItemAvisRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return Container(
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          maxWidth:
                                                                              500.0,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 3.0,
                                                                              color: Color(0x411D2429),
                                                                              offset: Offset(0.0, 1.0),
                                                                            )
                                                                          ],
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              8.0,
                                                                              8.0,
                                                                              8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 1.0, 1.0),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  child: CachedNetworkImage(
                                                                                    imageUrl: menuItemAvisRecord.pp,
                                                                                    width: 40.0,
                                                                                    height: 40.0,
                                                                                    fit: BoxFit.fill,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 8.0),
                                                                                            child: Text(
                                                                                              dateTimeFormat(
                                                                                                'relative',
                                                                                                menuItemAvisRecord.date!,
                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                              ),
                                                                                              textAlign: TextAlign.end,
                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                    fontFamily: 'sf pro text',
                                                                                                    fontSize: 12.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Text(
                                                                                        menuItemAvisRecord.nom,
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: 'sf pro text',
                                                                                              fontSize: 15.0,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 8.0, 0.0),
                                                                                              child: AutoSizeText(
                                                                                                menuItemAvisRecord.comment,
                                                                                                textAlign: TextAlign.start,
                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                      fontFamily: 'sf pro text',
                                                                                                      fontSize: 12.0,
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
                                ),
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.6, -0.5),
                          child: Container(
                            width: 240.0,
                            height: 240.0,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 25.0,
                                  color: Color(0x335A5A5A),
                                  offset: Offset(0.0, 20.0),
                                  spreadRadius: 20.0,
                                )
                              ],
                              shape: BoxShape.rectangle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(-0.55, -0.54),
                              child: CachedNetworkImage(
                                imageUrl: stackProduitsRecord.image,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, -0.9),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 80.0,
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 60.0,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                              FFAppState().update(() {
                                FFAppState().prixDefaut = true;
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            if (FFAppState().loc == false)
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 10.0,
                    sigmaY: 10.0,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 1.0,
                    decoration: BoxDecoration(
                      color: Color(0x00FFFFFF),
                    ),
                  ),
                ),
              ),
            if (FFAppState().loc == false)
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: StreamBuilder<List<RestaurantsRecord>>(
                  stream: queryRestaurantsRecord(
                    queryBuilder: (restaurantsRecord) =>
                        restaurantsRecord.where('nom',
                            isEqualTo: stackProduitsRecord.restaurant),
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
                    List<RestaurantsRecord> containerRestaurantsRecordList =
                        snapshot.data!;
                    final containerRestaurantsRecord =
                        containerRestaurantsRecordList.isNotEmpty
                            ? containerRestaurantsRecordList.first
                            : null;
                    return Material(
                      color: Colors.transparent,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        constraints: BoxConstraints(
                          maxWidth: 350.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 20.0, 10.0, 20.0),
                          child: StreamBuilder<ProduitsRecord>(
                            stream: ProduitsRecord.getDocument(widget.prodRef!),
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
                              final columnProduitsRecord = snapshot.data!;
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.location_off_outlined,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 62.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: AutoSizeText(
                                      'Veuillez s\'il vous plait activer la localisation sur votre appareil afin de faciliter la livraison',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'sf pro text',
                                            fontSize: 16.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 15.0, 0.0, 0.0),
                                    child: StreamBuilder<List<PanierRecord>>(
                                      stream: queryPanierRecord(
                                        parent: currentUserReference,
                                        queryBuilder: (panierRecord) =>
                                            panierRecord.where('prodRef',
                                                isEqualTo: columnProduitsRecord
                                                    .reference),
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
                                        List<PanierRecord>
                                            buttonPanierRecordList =
                                            snapshot.data!;
                                        final buttonPanierRecord =
                                            buttonPanierRecordList.isNotEmpty
                                                ? buttonPanierRecordList.first
                                                : null;
                                        return FFButtonWidget(
                                          onPressed: () async {
                                            currentUserLocationValue =
                                                await getCurrentUserLocation(
                                                    defaultLocation:
                                                        LatLng(0.0, 0.0));
                                            if (await getPermissionStatus(
                                                locationPermission)) {
                                              FFAppState().update(() {
                                                FFAppState().panieRef = [];
                                                FFAppState().loc = true;
                                              });
                                              if (FFAppState()
                                                      .panieRef
                                                      .length ==
                                                  0) {
                                                if (!_model.checkboxkkValue!) {
                                                  setState(() {
                                                    FFAppState().prixpers =
                                                        columnProduitsRecord
                                                            .prix;
                                                  });
                                                } else {
                                                  setState(() {
                                                    FFAppState().prixpers =
                                                        int.parse(_model
                                                            .prixpers1Controller
                                                            .text);
                                                  });
                                                }

                                                if (columnProduitsRecord
                                                        .disponible ==
                                                    true) {
                                                  if (FFAppState().prixpers >=
                                                      columnProduitsRecord
                                                          .prix) {
                                                    final panierCreateData =
                                                        createPanierRecordData(
                                                      prodRef:
                                                          columnProduitsRecord
                                                              .reference,
                                                      qty: valueOrDefault<int>(
                                                        FFAppState().qty,
                                                        1,
                                                      ),
                                                      mt: functions.reduce(
                                                          FFAppState().prixpers >
                                                                  columnProduitsRecord
                                                                      .prix
                                                              ? functions.multippl(
                                                                  FFAppState()
                                                                      .prixpers,
                                                                  FFAppState()
                                                                      .qty)
                                                              : functions.multippl(
                                                                  columnProduitsRecord
                                                                      .prix,
                                                                  FFAppState()
                                                                      .qty),
                                                          columnProduitsRecord
                                                              .pourcentage),
                                                      type: 'simple',
                                                      resto:
                                                          containerRestaurantsRecord!
                                                              .nom,
                                                      adress:
                                                          containerRestaurantsRecord!
                                                              .adresse,
                                                      num:
                                                          containerRestaurantsRecord!
                                                              .tel,
                                                      pret: false,
                                                      pay: false,
                                                      indic: valueOrDefault<
                                                          String>(
                                                        _model.indicController
                                                            .text,
                                                        'rass',
                                                      ),
                                                      prixperso:
                                                          FFAppState().prixpers,
                                                    );
                                                    var panierRecordReference =
                                                        PanierRecord.createDoc(
                                                            currentUserReference!);
                                                    await panierRecordReference
                                                        .set(panierCreateData);
                                                    _model.refpanier1 = PanierRecord
                                                        .getDocumentFromData(
                                                            panierCreateData,
                                                            panierRecordReference);
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .addToPanieRef(_model
                                                              .refpanier1!
                                                              .reference);
                                                      FFAppState().prixpers = 0;
                                                    });

                                                    final panierUpdateData =
                                                        createPanierRecordData(
                                                      ref: _model
                                                          .refpanier!.reference,
                                                    );
                                                    await _model
                                                        .refpanier!.reference
                                                        .update(
                                                            panierUpdateData);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Ajouté au panier',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                    if (FFAppState()
                                                            .paiementEtape ==
                                                        true) {
                                                      await FFAppState()
                                                          .refPrep!
                                                          .delete();
                                                    }

                                                    final precommandeCreateData =
                                                        {
                                                      ...createPrecommandeRecordData(
                                                        refcli:
                                                            currentUserReference,
                                                        soustot: functions.reduce(
                                                            FFAppState().prixpers >
                                                                    columnProduitsRecord
                                                                        .prix
                                                                ? functions.multippl(
                                                                    FFAppState()
                                                                        .prixpers,
                                                                    FFAppState()
                                                                        .qty)
                                                                : functions.multippl(
                                                                    columnProduitsRecord
                                                                        .prix,
                                                                    FFAppState()
                                                                        .qty),
                                                            columnProduitsRecord
                                                                .pourcentage),
                                                        date:
                                                            getCurrentTimestamp,
                                                        nom: random_data
                                                            .randomString(
                                                          12,
                                                          25,
                                                          true,
                                                          true,
                                                          true,
                                                        ),
                                                        statut: 'Soumis',
                                                        livrer: false,
                                                        dateAjout:
                                                            getCurrentTimestamp,
                                                        posRest:
                                                            containerRestaurantsRecord!
                                                                .pos,
                                                        lieu2:
                                                            currentUserLocationValue,
                                                      ),
                                                      'listecom':
                                                          FFAppState().panieRef,
                                                    };
                                                    var precommandeRecordReference =
                                                        PrecommandeRecord
                                                            .collection
                                                            .doc();
                                                    await precommandeRecordReference
                                                        .set(
                                                            precommandeCreateData);
                                                    _model.precommande1 =
                                                        PrecommandeRecord
                                                            .getDocumentFromData(
                                                                precommandeCreateData,
                                                                precommandeRecordReference);
                                                    FFAppState().update(() {
                                                      FFAppState().refPrep =
                                                          _model.precommande!
                                                              .reference;
                                                    });

                                                    context.pushNamed(
                                                      'moyenPaiement',
                                                      queryParameters: {
                                                        'refComm':
                                                            serializeParam(
                                                          _model.precommande1!
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                        'prod': serializeParam(
                                                          widget.prodRef,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Erreur',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Roboto',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 13.0,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    );
                                                  }
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Cet article n\'est pas disponible pour le moment',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 13.0,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  );
                                                }
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Maximum atteint',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              }
                                            } else {
                                              setState(() {
                                                FFAppState().loc = false;
                                              });
                                            }

                                            setState(() {});
                                          },
                                          text: 'Fait ?',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'sf pro text',
                                                      color: Colors.white,
                                                      useGoogleFonts: false,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                      ),
                    );
                  },
                ),
              ),
            StreamBuilder<List<RestaurantsRecord>>(
              stream: queryRestaurantsRecord(
                queryBuilder: (restaurantsRecord) => restaurantsRecord
                    .where('nom', isEqualTo: stackProduitsRecord.restaurant),
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
                List<RestaurantsRecord> columnRestaurantsRecordList =
                    snapshot.data!;
                final columnRestaurantsRecord =
                    columnRestaurantsRecordList.isNotEmpty
                        ? columnRestaurantsRecordList.first
                        : null;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (valueOrDefault<bool>(
                          functions.cloSup(
                                  stackProduitsRecord.clo!,
                                  getCurrentTimestamp,
                                  stackProduitsRecord.ouv!) ==
                              'inf',
                          false,
                        ) &&
                        (columnRestaurantsRecord!.jours.contains(dateTimeFormat(
                              'EEEE',
                              getCurrentTimestamp,
                              locale: FFLocalizations.of(context).languageCode,
                            )) ==
                            false))
                      ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10.0,
                            sigmaY: 10.0,
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: MediaQuery.of(context).size.height * 1.0,
                            decoration: BoxDecoration(
                              color: Color(0x00FFFFFF),
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: StreamBuilder<List<RestaurantsRecord>>(
                stream: queryRestaurantsRecord(
                  queryBuilder: (restaurantsRecord) => restaurantsRecord
                      .where('nom', isEqualTo: stackProduitsRecord.restaurant),
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
                  List<RestaurantsRecord> columnRestaurantsRecordList =
                      snapshot.data!;
                  final columnRestaurantsRecord =
                      columnRestaurantsRecordList.isNotEmpty
                          ? columnRestaurantsRecordList.first
                          : null;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (valueOrDefault<bool>(
                            functions.cloSup(
                                    stackProduitsRecord.clo!,
                                    getCurrentTimestamp,
                                    stackProduitsRecord.ouv!) ==
                                'inf',
                            false,
                          ) &&
                          (columnRestaurantsRecord!.jours
                                  .contains(dateTimeFormat(
                                'EEEE',
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              )) ==
                              false))
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: StreamBuilder<List<RestaurantsRecord>>(
                            stream: queryRestaurantsRecord(
                              queryBuilder: (restaurantsRecord) =>
                                  restaurantsRecord.where('nom',
                                      isEqualTo:
                                          stackProduitsRecord.restaurant),
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
                                          FlutterFlowTheme.of(context).primary,
                                      size: 10.0,
                                    ),
                                  ),
                                );
                              }
                              List<RestaurantsRecord>
                                  containerRestaurantsRecordList =
                                  snapshot.data!;
                              final containerRestaurantsRecord =
                                  containerRestaurantsRecordList.isNotEmpty
                                      ? containerRestaurantsRecordList.first
                                      : null;
                              return Material(
                                color: Colors.transparent,
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  constraints: BoxConstraints(
                                    maxWidth: 350.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 20.0, 10.0, 20.0),
                                    child: StreamBuilder<ProduitsRecord>(
                                      stream: ProduitsRecord.getDocument(
                                          widget.prodRef!),
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
                                        final columnProduitsRecord =
                                            snapshot.data!;
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              FFIcons.kfiRrTimeDelete,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 42.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: AutoSizeText(
                                                'Ce restaurant est actuellement fermé réessayez à partir de ${dateTimeFormat(
                                                  'Hm',
                                                  stackProduitsRecord.ouv,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                )}',
                                                textAlign: TextAlign.center,
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
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 0.0),
                                              child: StreamBuilder<
                                                  List<PanierRecord>>(
                                                stream: queryPanierRecord(
                                                  parent: currentUserReference,
                                                  queryBuilder: (panierRecord) =>
                                                      panierRecord.where(
                                                          'prodRef',
                                                          isEqualTo:
                                                              columnProduitsRecord
                                                                  .reference),
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
                                                  List<PanierRecord>
                                                      buttonPanierRecordList =
                                                      snapshot.data!;
                                                  final buttonPanierRecord =
                                                      buttonPanierRecordList
                                                              .isNotEmpty
                                                          ? buttonPanierRecordList
                                                              .first
                                                          : null;
                                                  return FFButtonWidget(
                                                    onPressed: () async {
                                                      Navigator.pop(context);
                                                    },
                                                    text: 'OK',
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'sf pro text',
                                                                color: Colors
                                                                    .white,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
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
          ],
        );
      },
    );
  }
}
