import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'detail2_model.dart';
export 'detail2_model.dart';

class Detail2Widget extends StatefulWidget {
  const Detail2Widget({
    Key? key,
    this.prodRef,
  }) : super(key: key);

  final DocumentReference? prodRef;

  @override
  _Detail2WidgetState createState() => _Detail2WidgetState();
}

class _Detail2WidgetState extends State<Detail2Widget> {
  late Detail2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Detail2Model());

    _model.textController ??= TextEditingController();
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
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: MediaQuery.of(context).size.height * 0.7,
                        constraints: BoxConstraints(
                          maxWidth: 450.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              18.0, 55.0, 18.0, 10.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (stackProduitsRecord.favoris
                                            .contains(currentUserEmail) ==
                                        true)
                                      StreamBuilder<List<FavRecord>>(
                                        stream: queryFavRecord(
                                          parent: currentUserReference,
                                          queryBuilder: (favRecord) =>
                                              favRecord.where('ref',
                                                  isEqualTo: stackProduitsRecord
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
                                              iconButtonFavRecordList.isNotEmpty
                                                  ? iconButtonFavRecordList
                                                      .first
                                                  : null;
                                          return FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            borderWidth: 1.0,
                                            buttonSize: 60.0,
                                            icon: Icon(
                                              Icons.favorite_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 22.0,
                                            ),
                                            onPressed: () async {
                                              await iconButtonFavRecord!
                                                  .reference
                                                  .delete();

                                              final produitsUpdateData = {
                                                'favoris':
                                                    FieldValue.arrayRemove(
                                                        [currentUserEmail]),
                                                'nbreFav':
                                                    FieldValue.increment(-(1)),
                                              };
                                              await stackProduitsRecord
                                                  .reference
                                                  .update(produitsUpdateData);
                                            },
                                          );
                                        },
                                      ),
                                    if (stackProduitsRecord.favoris
                                            .contains(currentUserEmail) ==
                                        false)
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          FFIcons.kfiRrHeart,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 20.0,
                                        ),
                                        onPressed: () async {
                                          final favCreateData =
                                              createFavRecordData(
                                            date: getCurrentTimestamp,
                                            ref: stackProduitsRecord.reference,
                                            qty: 1,
                                          );
                                          var favRecordReference =
                                              FavRecord.createDoc(
                                                  currentUserReference!);
                                          await favRecordReference
                                              .set(favCreateData);
                                          _model.ref =
                                              FavRecord.getDocumentFromData(
                                                  favCreateData,
                                                  favRecordReference);
                                          FFAppState().update(() {
                                            FFAppState().refFav =
                                                _model.ref!.reference;
                                          });

                                          final produitsUpdateData = {
                                            'favoris': FieldValue.arrayUnion(
                                                [currentUserEmail]),
                                            'nbreFav': FieldValue.increment(1),
                                          };
                                          await stackProduitsRecord.reference
                                              .update(produitsUpdateData);

                                          setState(() {});
                                        },
                                      ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        height: 80.0,
                                        constraints: BoxConstraints(
                                          maxWidth: 250.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      stackProduitsRecord.nom,
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 2,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'sf pro text',
                                                                fontSize: 20.0,
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
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            () {
                                              if (stackProduitsRecord.multi ==
                                                  false) {
                                                return '${functions.multippl(stackProduitsRecord.prix, FFAppState().qty).toString()} FCFA';
                                              } else if ((stackProduitsRecord
                                                          .multi ==
                                                      true) &&
                                                  (FFAppState().complet ==
                                                      true)) {
                                                return '${functions.multippl(stackProduitsRecord.prixComplet, FFAppState().qty).toString()} FCFA';
                                              } else {
                                                return '${functions.multippl(stackProduitsRecord.prixDemi, FFAppState().qty).toString()} FCFA';
                                              }
                                            }(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'sf pro text',
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    height: 1.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x3EA0A4A8),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Ouverture - Fermeture',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'sf pro text',
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 10.0, 8.0, 10.0),
                                          child: Text(
                                            '${dateTimeFormat(
                                              'Hm',
                                              stackProduitsRecord.ouv,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )} - ${dateTimeFormat(
                                              'Hm',
                                              stackProduitsRecord.clo,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )}',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'sf pro text',
                                                  color: Colors.white,
                                                  fontSize: 14.0,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Quantité',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'sf pro text',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      Container(
                                        width: 110.0,
                                        height: 35.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: Color(0x819E9E9E),
                                          ),
                                        ),
                                        child: FlutterFlowCountController(
                                          decrementIconBuilder: (enabled) =>
                                              FaIcon(
                                            FontAwesomeIcons.minus,
                                            color: enabled
                                                ? Color(0xDD000000)
                                                : Color(0xFFEEEEEE),
                                            size: 15.0,
                                          ),
                                          incrementIconBuilder: (enabled) =>
                                              FaIcon(
                                            FontAwesomeIcons.plus,
                                            color: enabled
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : Color(0xFFEEEEEE),
                                            size: 15.0,
                                          ),
                                          countBuilder: (count) => Text(
                                            count.toString(),
                                            style: GoogleFonts.getFont(
                                              'Roboto',
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13.0,
                                            ),
                                          ),
                                          count: _model.countControllerValue ??=
                                              1,
                                          updateCount: (count) async {
                                            setState(() => _model
                                                .countControllerValue = count);
                                            FFAppState().update(() {
                                              FFAppState().qty =
                                                  _model.countControllerValue!;
                                            });
                                          },
                                          stepSize: 1,
                                          minimum: 1,
                                          maximum: 10,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 10.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    height: 1.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x3EA0A4A8),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Type de Plat',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'sf pro text',
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (stackProduitsRecord.prix == 0)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 14.0, 0.0, 0.0),
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
                                                FFAppState().update(() {
                                                  FFAppState().complet = true;
                                                });
                                              },
                                              child: Container(
                                                width: 130.0,
                                                decoration: BoxDecoration(
                                                  color: FFAppState().complet ==
                                                          true
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 20.0,
                                                          10.0, 20.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      stackProduitsRecord
                                                          .nomComplet,
                                                      'null',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'sf pro text',
                                                          color: FFAppState()
                                                                      .complet ==
                                                                  true
                                                              ? Colors.white
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState().update(() {
                                                  FFAppState().complet = false;
                                                });
                                              },
                                              child: Container(
                                                width: 130.0,
                                                decoration: BoxDecoration(
                                                  color: FFAppState().complet ==
                                                          false
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 20.0,
                                                          10.0, 20.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      stackProduitsRecord
                                                          .nomDemi,
                                                      'null',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'sf pro text',
                                                          color: FFAppState()
                                                                      .complet ==
                                                                  true
                                                              ? FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText
                                                              : Colors.white,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: false,
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child:
                                            StreamBuilder<List<PanierRecord>>(
                                          stream: queryPanierRecord(
                                            parent: currentUserReference,
                                            queryBuilder: (panierRecord) =>
                                                panierRecord.where('prodRef',
                                                    isEqualTo:
                                                        stackProduitsRecord
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
                                              onPressed: () async {
                                                if (FFAppState()
                                                        .panieRef
                                                        .length <
                                                    4) {
                                                  final panierCreateData =
                                                      createPanierRecordData(
                                                    prodRef: stackProduitsRecord
                                                        .reference,
                                                    qty: FFAppState().qty,
                                                    mt: functions.reduce(() {
                                                      if (stackProduitsRecord
                                                              .multi ==
                                                          false) {
                                                        return functions.multippl(
                                                            stackProduitsRecord
                                                                .prix,
                                                            FFAppState().qty);
                                                      } else if ((stackProduitsRecord
                                                                  .multi ==
                                                              true) &&
                                                          (FFAppState()
                                                                  .complet ==
                                                              true)) {
                                                        return functions.multippl(
                                                            stackProduitsRecord
                                                                .prixComplet,
                                                            FFAppState().qty);
                                                      } else {
                                                        return functions.multippl(
                                                            stackProduitsRecord
                                                                .prixDemi,
                                                            FFAppState().qty);
                                                      }
                                                    }(),
                                                        stackProduitsRecord
                                                            .pourcentage),
                                                    type: () {
                                                      if (stackProduitsRecord
                                                              .multi ==
                                                          false) {
                                                        return 'simple';
                                                      } else if ((stackProduitsRecord
                                                                  .multi ==
                                                              true) &&
                                                          (FFAppState()
                                                                  .complet ==
                                                              true)) {
                                                        return 'plat complet';
                                                      } else {
                                                        return 'demi plat';
                                                      }
                                                    }(),
                                                  );
                                                  var panierRecordReference =
                                                      PanierRecord.createDoc(
                                                          currentUserReference!);
                                                  await panierRecordReference
                                                      .set(panierCreateData);
                                                  _model.refpanier = PanierRecord
                                                      .getDocumentFromData(
                                                          panierCreateData,
                                                          panierRecordReference);
                                                  FFAppState().update(() {
                                                    FFAppState().addToPanieRef(
                                                        _model.refpanier!
                                                            .reference);
                                                  });

                                                  final panierUpdateData =
                                                      createPanierRecordData(
                                                    ref: _model
                                                        .refpanier!.reference,
                                                  );
                                                  await _model
                                                      .refpanier!.reference
                                                      .update(panierUpdateData);
                                                  ScaffoldMessenger.of(context)
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

                                                  context.pushNamed('cart2');
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

                                                setState(() {});
                                              },
                                              text: 'Ajouter au Panier',
                                              options: FFButtonOptions(
                                                width: 130.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'sf pro text',
                                                          color: Colors.white,
                                                          useGoogleFonts: false,
                                                        ),
                                                elevation: 2.0,
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
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Stack(
                                        children: [
                                          if (stackProduitsRecord.noteUser
                                                  .contains(currentUserEmail) ==
                                              false)
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Votre note : ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                                RatingBar.builder(
                                                  onRatingUpdate:
                                                      (newValue) async {
                                                    setState(() =>
                                                        _model.ratingBarValue =
                                                            newValue);

                                                    final noteCreateData =
                                                        createNoteRecordData(
                                                      prodRef:
                                                          stackProduitsRecord
                                                              .reference,
                                                      rate:
                                                          _model.ratingBarValue,
                                                    );
                                                    await NoteRecord.createDoc(
                                                            currentUserReference!)
                                                        .set(noteCreateData);

                                                    final produitsUpdateData = {
                                                      ...createProduitsRecordData(
                                                        moyenne: functions.rate(
                                                            stackProduitsRecord
                                                                .note
                                                                .toList(),
                                                            stackProduitsRecord
                                                                .note.length),
                                                      ),
                                                      'note': FieldValue
                                                          .arrayUnion([
                                                        _model.ratingBarValue
                                                      ]),
                                                      'noteUser': FieldValue
                                                          .arrayUnion([
                                                        currentUserEmail
                                                      ]),
                                                    };
                                                    await stackProduitsRecord
                                                        .reference
                                                        .update(
                                                            produitsUpdateData);
                                                  },
                                                  itemBuilder:
                                                      (context, index) => Icon(
                                                    Icons.star_rounded,
                                                    color: Color(0xFFFFCC53),
                                                  ),
                                                  direction: Axis.horizontal,
                                                  initialRating: _model
                                                      .ratingBarValue ??= 0.0,
                                                  unratedColor:
                                                      Color(0xFF9E9E9E),
                                                  itemCount: 5,
                                                  itemSize: 31.0,
                                                  glowColor: Color(0xFFFFCC53),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Moyenne:',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  functions
                                                      .rate(
                                                          stackProduitsRecord
                                                              .note
                                                              .toList(),
                                                          stackProduitsRecord
                                                              .note.length)
                                                      .toString(),
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
                                                        fontSize: 18.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Icon(
                                                    Icons.star_sharp,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Laisser un Commantaire:',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            TextFormField(
                                              controller: _model.textController,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: 'Votre commentaire',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              maxLines: 8,
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      final avisCreateData =
                                                          createAvisRecordData(
                                                        pp: currentUserPhoto,
                                                        comment: _model
                                                            .textController
                                                            .text,
                                                        nom:
                                                            currentUserDisplayName,
                                                        date:
                                                            getCurrentTimestamp,
                                                      );
                                                      await AvisRecord.createDoc(
                                                              stackProduitsRecord
                                                                  .reference)
                                                          .set(avisCreateData);

                                                      final produitsUpdateData =
                                                          {
                                                        'nbreAvis': FieldValue
                                                            .increment(1),
                                                      };
                                                      await stackProduitsRecord
                                                          .reference
                                                          .update(
                                                              produitsUpdateData);
                                                    },
                                                    text: 'Envoyer',
                                                    options: FFButtonOptions(
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
                                                      elevation: 2.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: StreamBuilder<List<AvisRecord>>(
                                          stream: queryAvisRecord(
                                            parent:
                                                stackProduitsRecord.reference,
                                            queryBuilder: (avisRecord) =>
                                                avisRecord.orderBy('date',
                                                    descending: true),
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
                                            List<AvisRecord>
                                                columnAvisRecordList =
                                                snapshot.data!;
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  columnAvisRecordList.length,
                                                  (columnIndex) {
                                                final columnAvisRecord =
                                                    columnAvisRecordList[
                                                        columnIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 0.0),
                                                  child:
                                                      StreamBuilder<AvisRecord>(
                                                    stream:
                                                        AvisRecord.getDocument(
                                                            columnAvisRecord
                                                                .reference),
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
                                                      final menuItemAvisRecord =
                                                          snapshot.data!;
                                                      return Container(
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 500.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 3.0,
                                                              color: Color(
                                                                  0x411D2429),
                                                              offset: Offset(
                                                                  0.0, 1.0),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      8.0,
                                                                      8.0,
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            1.0,
                                                                            1.0,
                                                                            1.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .network(
                                                                    menuItemAvisRecord
                                                                        .pp,
                                                                    width: 40.0,
                                                                    height:
                                                                        40.0,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                4.0,
                                                                                8.0),
                                                                            child:
                                                                                Text(
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
                                                                        menuItemAvisRecord
                                                                            .nom,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: 'sf pro text',
                                                                              fontSize: 15.0,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                Padding(
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
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.6, -0.5),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 25.0,
                              color: Color(0x335A5A5A),
                              offset: Offset(0.0, 20.0),
                              spreadRadius: 20.0,
                            )
                          ],
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          width: 210.0,
                          height: 210.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: CachedNetworkImage(
                            imageUrl: stackProduitsRecord.image,
                            fit: BoxFit.cover,
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
      ],
    );
  }
}
