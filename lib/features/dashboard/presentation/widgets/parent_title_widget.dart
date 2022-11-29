

import 'package:clean_code_structure/shared/shared.dart';

class ParentTitleWidget extends StatelessWidget {
  const ParentTitleWidget({
    Key? key,
    required this.title,
    required this.widget,
  }) : super(key: key);

  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextView(
          text: title,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        const SizedBox(
          height: 10,
        ),
        widget
      ],
    );
  }
}
