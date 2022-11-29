import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:clean_code_structure/features/dashboard/presentation/widgets/parent_title_widget.dart';
import 'package:clean_code_structure/shared/shared.dart';
import 'package:clean_code_structure/shared/widgets/textview.dart';

class LoactionPage extends StatelessWidget {
  LoactionPage(
      {Key? key,
      required this.latLng,
      this.isFullScreen = false,
      this.city = ''})
      : super(key: key);
  final String city;
  final bool isFullScreen;
  final LatLng latLng;
  late final GoogleMapController mapController;

  Widget getView({required Widget body}) {
    return !isFullScreen
        ? ParentTitleWidget(
            title: Strings.location,
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: city,
                  fontSize: 14,
                  textColor: AppColors.lightTextColor,
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10), child: body),
                ),
              ],
            ),
          )
        : Scaffold(
            body: body,
          );
  }

  @override
  Widget build(BuildContext context) {
    return getView(
      body: GoogleMap(
          markers: {
            Marker(markerId: MarkerId(UniqueKey().toString()), position: latLng)
          },
          mapToolbarEnabled: false,
          zoomControlsEnabled: false,
          onMapCreated: isFullScreen
              ? (controller) {
                  mapController = controller;
                  mapController.animateCamera(CameraUpdate.newCameraPosition(
                      CameraPosition(zoom: 15, target: latLng)));
                }
              : null,
          onTap: !isFullScreen
              ? (argument) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoactionPage(
                          latLng: latLng,
                          isFullScreen: true,
                        ),
                      ));
                }
              : null,
          initialCameraPosition: CameraPosition(target: latLng, zoom: 16)),
    );
  }
}
