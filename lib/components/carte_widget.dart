import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'carte_model.dart';
export 'carte_model.dart';

class CarteWidget extends StatefulWidget {
  const CarteWidget({
    Key? key,
    this.prodRef,
    this.jour,
    this.panRef,
    this.precom,
    this.ride,
  }) : super(key: key);

  final DocumentReference? prodRef;
  final String? jour;
  final DocumentReference? panRef;
  final DocumentReference? precom;
  final DocumentReference? ride;

  @override
  _CarteWidgetState createState() => _CarteWidgetState();
}

class _CarteWidgetState extends State<CarteWidget> {
  late CarteModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarteModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
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
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
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
              final containerUsersRecord = snapshot.data!;
              return Container(
                constraints: BoxConstraints(
                  maxWidth: 450.0,
                ),
                decoration: BoxDecoration(
                  color: Color(0x00272B50),
                ),
                child: StreamBuilder<PrecommandeRecord>(
                  stream: PrecommandeRecord.getDocument(widget.precom!),
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
                    final stackPrecommandeRecord = snapshot.data!;
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
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0),
                              ),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: StreamBuilder<List<RefcliRecord>>(
                                stream: queryRefcliRecord(
                                  parent: currentUserReference,
                                  queryBuilder: (refcliRecord) =>
                                      refcliRecord.where('num',
                                          isEqualTo:
                                              stackPrecommandeRecord.num),
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
                                  List<RefcliRecord> googleMapRefcliRecordList =
                                      snapshot.data!;
                                  return FlutterFlowGoogleMap(
                                    controller: _model.googleMapsController,
                                    onCameraIdle: (latLng) => setState(
                                        () => _model.googleMapsCenter = latLng),
                                    initialLocation: _model.googleMapsCenter ??=
                                        currentUserLocationValue!,
                                    markers: googleMapRefcliRecordList
                                        .map(
                                          (googleMapRefcliRecord) =>
                                              FlutterFlowMarker(
                                            googleMapRefcliRecord
                                                .reference.path,
                                            googleMapRefcliRecord.lan!,
                                          ),
                                        )
                                        .toList(),
                                    markerColor: GoogleMarkerColor.violet,
                                    mapType: MapType.normal,
                                    style: GoogleMapStyle.standard,
                                    initialZoom: 16.0,
                                    allowInteraction: true,
                                    allowZoom: true,
                                    showZoomControls: true,
                                    showLocation: true,
                                    showCompass: false,
                                    showMapToolbar: true,
                                    showTraffic: true,
                                    centerMapOnMarkerTap: true,
                                  );
                                },
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
                        Align(
                          alignment: AlignmentDirectional(-0.02, -0.75),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 80.0,
                            icon: Icon(
                              Icons.loop,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 60.0,
                            ),
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                barrierColor: Color(0x00000000),
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: CarteWidget(
                                      precom: widget.precom,
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
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
      ],
    );
  }
}
