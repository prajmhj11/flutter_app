import 'package:flutter/material.dart';
import 'package:flutter_app/style/branding_color.dart';

showSnackbar({
  @required GlobalKey<ScaffoldState> key,
  @required String message,
  Color color,
}) {
  key.currentState.showSnackBar(SnackBar(
    backgroundColor: color ?? brandingColor,
    content: Text(message),
  ));
}
