import 'package:flutter/material.dart';
import 'package:stepp_app/constants/place/stepp_place_size.dart';
import 'package:stepp_app/constants/place/stepp_place_ui_strings.dart';
import 'package:stepp_app/constants/ui_strings.dart';
import 'package:stepp_app/styles/app_theme.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/widgets/custom_opacity_button.dart';
import 'package:stepp_app/widgets/custom_opacity_tile.dart';

class SteppPlaceAppBar extends StatefulWidget {
  const SteppPlaceAppBar({super.key});

  @override
  State<SteppPlaceAppBar> createState() => _SteppPlaceAppBarState();
}

class _SteppPlaceAppBarState extends State<SteppPlaceAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: IntrinsicWidth(
            child: CustomOpacityTile(
              leading: const Icon(
                Icons.place,
                color: Colors.white,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    SteppPlaceUIStrings.steppPlaceBucketList,
                    maxLines: SteppPlaceSize.steppPlaceNameTitleTileMaxLines,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  Text(
                    SteppPlaceUIStrings.steppPlaceSubTitle,
                    style: context.textTheme.labelSmall!.copyWith(
                      color: Colors.white.withOpacity(AppTheme.opacity80Percent),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: SteppPlaceSize.steppPlaceShareSpacing(
            context.deviceSize.width,
          ),
        ),
        CustomOpacityButton(
          child: Row(
            children: [
              const Icon(
                Icons.bookmark,
                color: Colors.white,
                size: SteppPlaceSize.steppPlaceSaveIconButtonSize,
              ),
              const SizedBox(
                width: SteppPlaceSize.steppPlaceSaveIconTitleButtonSize,
              ),
              Text(
                UiStrings.commonSave,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
