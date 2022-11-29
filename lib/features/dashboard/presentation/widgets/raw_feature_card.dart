import 'package:clean_code_structure/data/models/maindata_model.dart';
import 'package:clean_code_structure/shared/shared.dart';

class RawFeaturesCard extends StatelessWidget {
  const RawFeaturesCard({
    Key? key,
    required this.data,
  }) : super(key: key);
  final KeyFeature data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppColors.pink)),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              data.colorIconUrl!,
              height: 45,
            ),
            const SizedBox(
              height: 18,
            ),
            TextView(
              textAlign: TextAlign.center,
              text: data.name,
              fontSize: 14,
            )
          ],
        ),
      ),
    );
  }
}
