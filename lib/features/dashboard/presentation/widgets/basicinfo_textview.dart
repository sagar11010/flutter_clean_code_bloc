
import '../../../../shared/shared.dart';

class BasicInfoTextView extends StatelessWidget {
  const BasicInfoTextView({
    Key? key,
    required this.tag,
    required this.value,
  }) : super(key: key);
  final String tag;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 35,
          child: TextView(
            text: tag,
            fontSize: 16,
            textColor: AppColors.lightTextColor,
          ),
        ),
        Expanded(
          flex: 65,
          child: TextView(
            text: value,
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
