import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:clean_code_structure/data/models/maindata_model.dart';
import '../../../../shared/shared.dart';
import 'parent_title_widget.dart';

class ImageSliderView extends StatelessWidget {
  final List<PropertyImageElement> propertyImages;

  const ImageSliderView({Key? key, required this.propertyImages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ParentTitleWidget(
      title: Strings.gallery,
      widget: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: propertyImages!.length == 1
            ? Image.network(
                propertyImages!.first.path!,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              )
            : ImageSlideshow(
                indicatorRadius: 5,
                indicatorColor: AppColors.white,
                children: propertyImages!
                    .map((e) => Image.network(
                          e.path!,
                          fit: BoxFit.cover,
                        ))
                    .toList()),
      ),
    );
  }
}
