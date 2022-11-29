import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:clean_code_structure/data/models/maindata_model.dart';
import 'package:clean_code_structure/features/dashboard/presentation/pages/locationpage.dart';
import 'package:clean_code_structure/features/dashboard/presentation/widgets/basicinfo_textview.dart';
import 'package:clean_code_structure/features/dashboard/presentation/widgets/user_card_view.dart';
import 'package:clean_code_structure/shared/shared.dart';
import 'parent_title_widget.dart';
import 'raw_feature_card.dart';
import 'gallery_widget.dart';

class DashboardMainCard extends StatelessWidget {
  const DashboardMainCard({Key? key, required this.data}) : super(key: key);
  final Property data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserCardView(data: data),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: AppColors.greybg,
              boxShadow: AppColors.commonShadow,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ParentTitleWidget(
                    title: Strings.description,
                    widget: TextView(
                      text: data.description,
                      fontSize: 16,
                      textColor: AppColors.lightTextColor,
                    )),
                _titlePadding,
                LoactionPage(
                    latLng: LatLng(data.latitude!, data.longitude!),
                    city: data.addressCity!),
                _titlePadding,
                ParentTitleWidget(
                  title: Strings.keyFeatures,
                  widget: SizedBox(
                    height: 110,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left: 5),
                      scrollDirection: Axis.horizontal,
                      itemCount: data.keyFeatures!.length,
                      itemBuilder: (context, i) {
                        return RawFeaturesCard(data: data.keyFeatures![i]);
                      },
                    ),
                  ),
                ),
                _titlePadding,
                ImageSliderView(propertyImages: data.propertyImages!),
                _titlePadding,
                buildBasicInfo
              ],
            ),
          ),
        )
      ],
    );
  }

  ParentTitleWidget get buildBasicInfo => ParentTitleWidget(
      title: Strings.basicInfo,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BasicInfoTextView(
            tag: Strings.listingtype,
            value: data.listingType!,
          ),
          const SizedBox(
            height: 10,
          ),
          BasicInfoTextView(
              tag: Strings.propertytype, value: data.propertyType!),
          const SizedBox(
            height: 10,
          ),
          BasicInfoTextView(tag: Strings.roomtype, value: data.roomType ?? ""),
          const SizedBox(
            height: 10,
          ),
          BasicInfoTextView(tag: Strings.moveindate, value: data.moveInDate!),
          const SizedBox(
            height: 10,
          ),
          BasicInfoTextView(
              tag: Strings.lengthofstay, value: data.lengthOfStay!),
          const SizedBox(
            height: 10,
          ),
          BasicInfoTextView(tag: Strings.type, value: data.type!),
          const SizedBox(
            height: 10,
          ),
          BasicInfoTextView(
              tag: Strings.forstudents,
              value: data.isSuitableForStudent == 1 ? Strings.yes : Strings.no),
          const SizedBox(
            height: 10,
          ),
        ],
      ));

  Widget get _titlePadding => const SizedBox(
        height: 20,
      );
}
