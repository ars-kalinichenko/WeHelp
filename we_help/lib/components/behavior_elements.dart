import 'package:flutter/material.dart';

class PagingBehavior extends ScrollBehavior {
  /// Overrides the default scroll animation, removes the effect when scrolling to the end.

  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      ClampingScrollPhysics();
}
