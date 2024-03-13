import 'package:flutter/material.dart';
import 'package:stepp_app/constants/stepp_place/stepp_place_size.dart';

class SteppPlaceDisplayBox extends StatelessWidget {
  final String profileImage;
  final String steppImage;
  const SteppPlaceDisplayBox({super.key, required this.profileImage, required this.steppImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: SteppPlaceSize.steppPlaceDisplayBoxSteppImagePadding,
          child: Image.asset(
            steppImage,
            height: SteppPlaceSize.steppPlaceDisplayBoxSteppImageSize,
            width: SteppPlaceSize.steppPlaceDisplayBoxSteppImageSize,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: SteppPlaceSize.steppPlaceDisplayBoxSteppProfileBottomPosition,
          right: SteppPlaceSize.steppPlaceDisplayBoxSteppProfileRightPosition,
          child: CircleAvatar(
            radius: SteppPlaceSize.steppPlaceDisplayBoxSteppProfileImageSize,
            backgroundImage: AssetImage(profileImage),
          ),
        )
      ],
    );
  }
}
