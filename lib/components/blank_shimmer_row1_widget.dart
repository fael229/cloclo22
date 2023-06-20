import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'blank_shimmer_row1_model.dart';
export 'blank_shimmer_row1_model.dart';

class BlankShimmerRow1Widget extends StatefulWidget {
  const BlankShimmerRow1Widget({Key? key}) : super(key: key);

  @override
  _BlankShimmerRow1WidgetState createState() => _BlankShimmerRow1WidgetState();
}

class _BlankShimmerRow1WidgetState extends State<BlankShimmerRow1Widget> {
  late BlankShimmerRow1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlankShimmerRow1Model());

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
