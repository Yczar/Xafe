import 'package:flutter/material.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

class XMargin extends StatelessWidget {
  const XMargin(this._x);
  final double _x;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: context.scale(_x));
  }
}

class XMarginScale extends StatelessWidget {
  const XMarginScale(this._x);
  final double _x;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: context.width * _x);
  }
}

class YMargin extends StatelessWidget {
  const YMargin(this._y);
  final double _y;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.scaleY(_y),
    );
  }
}

class YMarginScale extends StatelessWidget {
  const YMarginScale(this._y);
  final double _y;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * _y,
    );
  }
}

double screenHeight(BuildContext context, {double percent = 1}) =>
    MediaQuery.of(context).size.height * percent;

double screenWidth(BuildContext context, {double percent = 1}) =>
    MediaQuery.of(context).size.width * percent;
