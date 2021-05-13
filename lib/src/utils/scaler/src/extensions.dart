import 'package:flutter/widgets.dart';

import 'scale.dart';
import 'scale_aware.dart';

extension BuildContextExtensions on BuildContext {
  Scale get _scale {
    // ignore: always_specify_types
    final data = MediaQuery.of(this);
    return Scale(
        size: data.size,
        textScaleFactor: data.textScaleFactor,
        config: ScaleAware.of(this));
  }

  /// Pixels scaled per device from design.
  /// Where One pixel on a 160px screen equals two pixels on a 320px screen.
  /// Also and alias for scaleX
  double scale(num width) => _scale.scale(width);

  /// Pixels scaled per device from design in the Vertical direction.
  /// Where One pixel on a 160px screen equals two pixels on a 320px screen.
  double scaleY(num height) => _scale.scaleY(height);

  /// Relative to the font-size setting of the actual device
  double fontSize(num fontSize) => _scale.fontScale(fontSize);

  EdgeInsets insetsZero() => _scale.zero;

  ///.
  EdgeInsets insetsAll(num inset) => _scale.all(inset.toDouble());

  ///.
  EdgeInsets insetsOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      _scale.only(left, top, right, bottom);

  ///.
  EdgeInsets insetsFromLTRB({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      _scale.fromLTRB(left, top, right, bottom);

  ///.
  EdgeInsets insetsSymetric({
    double vertical = 0,
    double horizontal = 0,
  }) =>
      _scale.symmetric(vertical, horizontal);

  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;
}
