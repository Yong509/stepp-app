import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stepp_app/constants/place/stepp_place_size.dart';
import 'package:stepp_app/constants/place/stepp_place_ui_strings.dart';
import 'package:stepp_app/constants/sizes.dart';
import 'package:stepp_app/constants/ui_strings.dart';
import 'package:stepp_app/providers/stepp_place_provider.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/widgets/custom_opacity_button.dart';
import 'package:stepp_app/widgets/place/stepp_place_display_box.dart';

class SteppPlacePanel extends StatefulWidget {
  const SteppPlacePanel({super.key});

  @override
  State<SteppPlacePanel> createState() => _SteppPlacePanelState();
}

class _SteppPlacePanelState extends State<SteppPlacePanel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SteppPlaceSize.displayBoxWidth,
      child: Column(
        mainAxisAlignment: context.watch<SteppPlaceProvider>().isPanelOpen
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                    size: SteppPlaceSize.steppPlaceLikeIconSize,
                  ),
                ),
                Text(
                  SteppPlaceUIStrings.steppPlaceMockLiked,
                  style: context.textTheme.bodyMedium!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Transform.rotate(
              angle: SteppPlaceSize.sendButtonRotateDegree(),
              child: const Icon(
                Icons.send_outlined,
                color: Colors.white,
                size: SteppPlaceSize.steppPlaceLikeIconSize,
              ),
            ),
          ),
          const SteppPlaceDisplayBox(
            steppImage: 'assets/images/thumbnail-3.png',
            profileImage: 'assets/images/avatar-3.png',
          ),
          const SteppPlaceDisplayBox(
            steppImage: 'assets/images/thumbnail-2.png',
            profileImage: 'assets/images/avatar-2.png',
          ),
          const SizedBox(
            height: Sizes.spacing10,
          ),
          Text(
            SteppPlaceUIStrings.steppPlaceMockSteppMore,
            style: context.textTheme.bodySmall!.copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: Sizes.spacing10,
          ),
          IntrinsicWidth(
            child: CustomOpacityButton(
              padding: SteppPlaceSize.steppPlaceSteppButtonPadding,
              child: Row(
                children: [
                  const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: SteppPlaceSize.steppPlacePanelSteppButtonIconSize,
                  ),
                  const SizedBox(
                    width: SteppPlaceSize.steppPlaceSaveIconTitleButtonSize,
                  ),
                  Text(
                    UiStrings.commonStepp,
                    style: context.textTheme.bodySmall!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
