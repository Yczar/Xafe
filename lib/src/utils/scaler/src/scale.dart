import 'package:flutter/foundation.dart' show required, visibleForTesting;
import 'package:flutter/rendering.dart' show Size;
import 'package:flutter/widgets.dart';

import 'scale_config.dart';

class Scale {
  factory Scale({
    @required Size size,
    @required double textScaleFactor,
    @required ScaleConfig config,
  }) {
    assert(size != null);
    assert(textScaleFactor != null);
    assert(config != null);
    if (_instance != null &&
        size == _instance.size &&
        textScaleFactor == _instance.textScaleFactor &&
        config == _instance.config) {
      return _instance;
    }
    return _instance =
        Scale._(size: size, textScaleFactor: textScaleFactor, config: config);
  }

  Scale._({
    @required this.size,
    @required this.textScaleFactor,
    @required this.config,
  });

  @visibleForTesting
  static void reset() => _instance = null;

  static Scale _instance;

  /// Scale configuration of reference device
  final ScaleConfig config;

  /// Physical size of current device
  final Size size;

  /// Scale factor of font size on current device
  final double textScaleFactor;

  /// Pixels scaled per device from design.
  /// Where One pixel on a 160px screen equals two pixels on a 320px screen.
  /// Also and alias for scaleX
  double scale(num dimension) => dimension * size.width / config.width;

  /// Pixels scaled per device from design.
  /// Where One pixel on a 160px screen equals two pixels on a 320px screen.
  double scaleY(num dimension) => dimension * size.height / config.height;

  /// Relative to the font-size setting of the current device
  double fontScale(num fontSize) => config.allowFontScaling
      ? fontSize / textScaleFactor
      : fontSize.toDouble();

  /// Relative to [zero] Edge insets padding of current device.
  EdgeInsets get zero {
    return EdgeInsets.zero;
  }

  /// Relative to [all] Edge insets padding of current device.
  EdgeInsets all(double inset) {
    return EdgeInsets.all(scale(inset));
  }

  /// Relative to [only] Edge insets padding of current device.
  EdgeInsets only(
    double left,
    double top,
    double right,
    double bottom,
  ) {
    return EdgeInsets.only(
      top: scaleY(top),
      left: scale(left),
      bottom: scaleY(bottom),
      right: scale(right),
    );
  }

  /// Relative to [fromLTRB] Edge insets padding of current device.
  EdgeInsets fromLTRB(
    double left,
    double top,
    double right,
    double bottom,
  ) {
    return EdgeInsets.fromLTRB(
      scale(left),
      scaleY(top),
      scale(right),
      scaleY(bottom),
    );
  }

  /// Relative to [symmetric] Edge insets padding of current device.
  EdgeInsets symmetric(
    double vertical,
    double horizontal,
  ) {
    return EdgeInsets.symmetric(
      vertical: scale(vertical),
      horizontal: scaleY(horizontal),
    );
  }

  @override
  String toString() => '$runtimeType('
      'textScaleFactor: $textScaleFactor, '
      'width: ${size.width}, '
      'height: ${size.height}'
      ')';
}
