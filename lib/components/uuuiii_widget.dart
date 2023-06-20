import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'uuuiii_model.dart';
export 'uuuiii_model.dart';

class UuuiiiWidget extends StatefulWidget {
  const UuuiiiWidget({Key? key}) : super(key: key);

  @override
  _UuuiiiWidgetState createState() => _UuuiiiWidgetState();
}

class _UuuiiiWidgetState extends State<UuuiiiWidget> {
  late UuuiiiModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UuuiiiModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Lottie.asset(
              'assets/lottie_animations/lf30_editor_1sbokjwi.json',
              width: 200.0,
              height: 210.0,
              fit: BoxFit.cover,
              animate: true,
            ),
          ],
        ),
      ),
    );
  }
}
