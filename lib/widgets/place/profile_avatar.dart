import 'package:flutter/material.dart';
import 'package:stepp_app/constants/place/stepp_place_size.dart';
import 'package:stepp_app/constants/place/stepp_place_ui_strings.dart';
import 'package:stepp_app/constants/sizes.dart';
import 'package:stepp_app/constants/ui_strings.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/widgets/custom_opacity_button.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Flexible(
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.png'),
            radius: SteppPlaceSize.steppPlaceContentProfileRadius,
          ),
        ),
        const SizedBox(
          height: Sizes.spacing10,
        ),
        Text(
          SteppPlaceUIStrings.steppPlaceMockProfileName,
          style: context.textTheme.titleLarge!.copyWith(color: Colors.white),
        ),
        const SizedBox(
          height: Sizes.spacing10,
        ),
        CustomOpacityButton(
          padding: SteppPlaceSize.steppPlaceFollowButtonPadding,
          child: Text(
            UiStrings.commonFollow,
            style: context.textTheme.bodyMedium!.copyWith(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
