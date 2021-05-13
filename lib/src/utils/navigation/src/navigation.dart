import 'package:flutter/material.dart';

import 'transparent_route.dart';

void popToFirst(BuildContext context) =>
    // ignore: always_specify_types
    Navigator.of(context).popUntil((route) => route.isFirst);

void popView(BuildContext context) => Navigator.pop(context);

Future<void> navigateReplace(
  BuildContext context,
  Widget route, {
  bool isDialog = false,
}) =>
    Navigator.pushReplacement(
      context,
      // ignore: always_specify_types
      MaterialPageRoute(
        fullscreenDialog: isDialog,
        // ignore: always_specify_types
        builder: (context) => route,
      ),
    );

Future<void> navigate(
  BuildContext context,
  Widget route, {
  bool isDialog = false,
}) =>
    Navigator.push(
      context,
      // ignore: always_specify_types
      MaterialPageRoute(
        fullscreenDialog: isDialog,
        // ignore: always_specify_types
        builder: (context) => route,
      ),
    );

Future<void> pushAndRemoveUntil(BuildContext context, Widget newRoute) =>
    Navigator.of(context).pushAndRemoveUntil(
      // ignore: always_specify_types
      MaterialPageRoute(
        // ignore: always_specify_types
        builder: (context) => newRoute,
      ),
      // ignore: always_specify_types
      (route) => false,
    );

Future<void> navigateTransparentRoute(BuildContext context, Widget route) {
  return Navigator.push(
    context,
    TransparentRoute(
      // ignore: always_specify_types
      builder: (context) => route,
    ),
  );
}
