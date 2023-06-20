import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/detail_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_pro_model.dart';
export 'card_pro_model.dart';

class CardProWidget extends StatefulWidget {
  const CardProWidget({
    Key? key,
    this.list,
  }) : super(key: key);

  final DocumentReference? list;

  @override
  _CardProWidgetState createState() => _CardProWidgetState();
}

class _CardProWidgetState extends State<CardProWidget> {
  late CardProModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardProModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 15.0),
      child: StreamBuilder<ProduitsRecord>(
        stream: ProduitsRecord.getDocument(widget.list!),
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
            width: 180.0,
            height: 250.0,
            constraints: BoxConstraints(
              maxWidth: 300.0,
              maxHeight: 280.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(9.0, 9.0, 9.0, 9.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
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
                  await containerProduitsRecord.reference
                      .update(produitsUpdateData);
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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 120.0,
                          constraints: BoxConstraints(
                            maxHeight: 120.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                containerProduitsRecord.image,
                              ).image,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        if (containerProduitsRecord.pourcentage != 0)
                          Align(
                            alignment: AlignmentDirectional(0.96, -0.95),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 5.0, 0.0),
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
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
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
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0x00FFFFFF),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        containerProduitsRecord.nom,
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'sf pro text',
                                              fontSize: 12.0,
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            containerProduitsRecord.restaurant,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'sf pro text',
                                  color:
                                      FlutterFlowTheme.of(context).tertiary400,
                                  fontSize: 12.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ],
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
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'sf pro text',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              containerProduitsRecord.moyenne.toString(),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  3.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                Icons.star_rate,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                            ),
                          ],
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 5.0, 5.0),
                            child: Text(
                              () {
                                if (containerProduitsRecord.multi == false) {
                                  return '${functions.multippl(containerProduitsRecord.prix, FFAppState().qty).toString()} FCFA';
                                } else if ((containerProduitsRecord.multi ==
                                        true) &&
                                    (FFAppState().prixDefaut == false)) {
                                  return '${functions.multippl(containerProduitsRecord.prixComplet, FFAppState().qty).toString()} FCFA';
                                } else {
                                  return '${functions.multippl(containerProduitsRecord.prixDemi, FFAppState().qty).toString()} FCFA';
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
          );
        },
      ),
    );
  }
}
