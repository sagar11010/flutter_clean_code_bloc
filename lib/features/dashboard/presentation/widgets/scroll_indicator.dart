import 'dart:math' as math;

import 'package:scroll_indicator/scroll_indicator.dart';
import 'package:clean_code_structure/shared/shared.dart';


class WhiteScrollIndicator extends StatelessWidget {
  const WhiteScrollIndicator({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -5,
      bottom: 70,
      child: Transform.rotate(
        angle: math.pi / 2,
        child: ScrollIndicator(
            height: 5,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.black26, borderRadius: BorderRadius.circular(5)),
            indicatorDecoration: BoxDecoration(
                color: AppColors.white, borderRadius: BorderRadius.circular(5)),
            scrollController: controller),
      ),
    );
  }
}
