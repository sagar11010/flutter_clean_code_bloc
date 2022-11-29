import 'package:animate_do/animate_do.dart';
import 'package:clean_code_structure/data/models/maindata_model.dart';
import 'package:clean_code_structure/shared/shared.dart';

class UserCardView extends StatelessWidget {
  final Property data;

  const UserCardView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primaryColor,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(data.propertyImages!.first.thumbnail!))),
      child: Stack(
        children: [
          data.liked
              ? Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FadeInRight(
                        child: getCircleIcon(Icons.check),
                      ),
                      FadeInLeft(
                        child: getCircleIcon(Icons.close),
                      )
                    ],
                  ),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [buildTopPart(), buildBottomPartOfCard()],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTopPart() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              marginTop: 10,
              text: data.addressArea!,
              fontSize: 35,
              textColor: AppColors.white,
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextView(
                  text: data.status!,
                  fontSize: 14,
                  textColor: AppColors.white,
                ),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                    backgroundImage:
                        NetworkImage(data.user!.profileImage ?? ''),
                    radius: 20),
                Positioned(
                    top: 30,
                    left: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 10,
                      child: Icon(
                        Icons.chat,
                        color: AppColors.white,
                        size: 10,
                      ),
                      backgroundColor: AppColors.pink,
                    ))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Icon(
                Icons.send,
                size: 30,
                color: AppColors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Icon(
              Icons.play_arrow,
              color: AppColors.white,
              size: 40,
            )
          ],
        )
      ],
    );
  }

  Widget getCircleIcon(IconData icons) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white,
      ),
      child: Icon(icons, size: 70, color: Colors.lightBlueAccent),
    );
  }

  Widget buildBottomPartOfCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: "\$ ${data.personPrice.toString()}",
          fontSize: 35,
          textColor: AppColors.white,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              const Icon(
                Icons.bed,
                color: AppColors.pink,
                size: 18,
              ),
              textIconCommonText(data.bedrooms.toString()),
              const Icon(
                Icons.bathtub,
                color: AppColors.blue,
              ),
              textIconCommonText(data.bathrooms.toString()),
              const CircleAvatar(
                radius: 3,
                backgroundColor: AppColors.white,
              ),
              textIconCommonText(data.nearestLocation.toString()),
              const Icon(
                Icons.nordic_walking_outlined,
                size: 18,
                color: AppColors.red,
              ),
              textIconCommonText(data.nearestLocationTime.toString())
            ],
          ),
        )
      ],
    );
  }

  Widget textIconCommonText(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextView(
        text: title,
        textColor: AppColors.white,
        fontSize: 15,
      ),
    );
  }
}
