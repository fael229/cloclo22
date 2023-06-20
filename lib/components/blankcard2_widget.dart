import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'blankcard2_model.dart';
export 'blankcard2_model.dart';

class Blankcard2Widget extends StatefulWidget {
  const Blankcard2Widget({Key? key}) : super(key: key);

  @override
  _Blankcard2WidgetState createState() => _Blankcard2WidgetState();
}

class _Blankcard2WidgetState extends State<Blankcard2Widget> {
  late Blankcard2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Blankcard2Model());

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

    return Container();
  }
}
