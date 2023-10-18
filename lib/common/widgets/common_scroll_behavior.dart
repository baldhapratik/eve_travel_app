import 'package:eve_travel_app/app_imports/app_imports.dart';

class CustomScrollBehaviorWithoutGlow extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return GlowingOverscrollIndicator(
      axisDirection: axisDirection,
      color: Colors.transparent,
      child: child,
    );
  }
}
