import 'package:flutter/widgets.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

typedef ResponsiveBuilder = Widget Function(
  BuildContext context,
  Size size,
);

class ResponsiveSafeArea extends StatelessWidget {
  const ResponsiveSafeArea({
    Key key,
    this.padding = 8.0,
    @required ResponsiveBuilder builder,
  })  : responsiveBuilder = builder,
        super(key: key);

  final ResponsiveBuilder responsiveBuilder;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: context.insetsAll(padding),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return responsiveBuilder(
              context,
              constraints.biggest,
            );
          },
        ),
      ),
    );
  }
}

class ResponsiveNoSafeArea extends StatelessWidget {
  const ResponsiveNoSafeArea({
    Key key,
    this.padding = 8.0,
    @required ResponsiveBuilder builder,
  })  : responsiveBuilder = builder,
        super(key: key);

  final ResponsiveBuilder responsiveBuilder;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.insetsAll(padding),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return responsiveBuilder(
            context,
            constraints.biggest,
          );
        },
      ),
    );
  }
}
