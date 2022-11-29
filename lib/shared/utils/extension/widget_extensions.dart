import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

///[WidgetExtension] this class contain basic widget extensions
extension WidgetExtension on Widget {
  SizedBox withSize({double width = 0.0, double height = 0.0}) =>
      SizedBox(height: height, width: width, child: this);

  SizedBox withWidth(double width) => SizedBox(width: width, child: this);

  SizedBox withHeight(double height) => SizedBox(height: height, child: this);

  Align setAllign(Alignment alignment) =>
      Align(alignment: alignment, child: this);

  Padding paddingTop(double top) =>
      Padding(padding: EdgeInsets.only(top: top), child: this);

  Padding paddingLeft(double left) =>
      Padding(padding: EdgeInsets.only(left: left), child: this);

  Padding paddingRight(double right) =>
      Padding(padding: EdgeInsets.only(right: right), child: this);

  Padding paddingBottom(double bottom) =>
      Padding(padding: EdgeInsets.only(bottom: bottom), child: this);

  Container border(double borderTop,
          {required Color borderColor, required double borderRadius}) =>
      Container(
          margin: EdgeInsets.only(top: borderTop),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(borderRadius)),
          child: this);

  Widget visible(bool visible) => visible ? this : const SizedBox();

  ClipRRect cornerRadiusWithClipRRectOnly(
      {int bottomLeft = 0,
      int bottomRight = 0,
      int topLeft = 0,
      int topRight = 0}) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(bottomLeft.toDouble()),
        bottomRight: Radius.circular(bottomRight.toDouble()),
        topLeft: Radius.circular(topLeft.toDouble()),
        topRight: Radius.circular(topRight.toDouble()),
      ),
      child: this,
    );
  }

  ClipRRect cornerRadiusWithClipRRect(double radius) => ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)), child: this);

  Visibility withVisibility(
    bool visible, {
    required Widget replacement,
    bool maintainAnimation = false,
    bool maintainState = false,
    bool maintainSize = false,
    bool maintainSemantics = false,
    bool maintainInteractivity = false,
  }) {
    return Visibility(
      visible: visible,
      maintainAnimation: maintainAnimation,
      maintainInteractivity: maintainInteractivity,
      maintainSemantics: maintainSemantics,
      maintainSize: maintainSize,
      maintainState: maintainState,
      key: key,
      child: this,
      replacement: replacement,
    );
  }

  Widget opacity({required double opacity, durationInSecond = 1}) {
    return AnimatedOpacity(
        opacity: opacity,
        duration: Duration(seconds: durationInSecond),
        child: this);
  }

  Widget rotate(
      {required double angle,
      bool transformHitTests = true,
      required Offset origin}) {
    return Transform.rotate(
        origin: origin,
        angle: angle,
        transformHitTests: transformHitTests,
        child: this);
  }

  Widget center({required double heightFactor, required double widthFactor}) =>
      Center(heightFactor: heightFactor, widthFactor: widthFactor, child: this);

  Widget onTap(VoidCallback function,
      {BorderRadius borderRadius =
          const BorderRadius.all(Radius.circular(0))}) {
    return InkWell(
      onTap: function,
      borderRadius: borderRadius,
      child: this,
    );
  }

  Widget withShaderMask(List<Color> colors,
          {BlendMode blendMode = BlendMode.srcATop}) =>
      withShaderMaskGradient(LinearGradient(colors: colors),
          blendMode: blendMode);

  Widget withShaderMaskGradient(Gradient gradient,
      {BlendMode blendMode = BlendMode.srcATop}) {
    return ShaderMask(
        shaderCallback: (rect) => gradient.createShader(rect),
        blendMode: blendMode,
        child: this);
  }

  Widget withScroll({
    required ScrollPhysics physics,
    required EdgeInsetsGeometry padding,
    Axis scrollDirection = Axis.vertical,
    required ScrollController controller,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    required bool primary,
    required bool reverse,
  }) {
    return SingleChildScrollView(
      child: this,
      physics: physics,
      padding: padding,
      scrollDirection: scrollDirection,
      controller: controller,
      dragStartBehavior: dragStartBehavior,
      primary: primary,
      reverse: reverse,
      key: key,
    );
  }

  Widget expand({flex = 1}) => Expanded(child: this, flex: flex);
}
