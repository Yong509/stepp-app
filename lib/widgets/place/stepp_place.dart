import 'package:flutter/material.dart';
import 'package:stepp_app/constants/place/stepp_place_size.dart';
import 'package:stepp_app/constants/place/stepp_place_ui_strings.dart';
import 'package:stepp_app/constants/ui_strings.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/widgets/custom_opacity_button.dart';
import 'package:stepp_app/widgets/image_viewer.dart';
import 'package:stepp_app/widgets/custom_opacity_tile.dart';

class SteppPlace extends StatefulWidget {
  const SteppPlace({super.key});

  @override
  State<SteppPlace> createState() => _SteppPlaceState();
}

class _SteppPlaceState extends State<SteppPlace> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ImageViewer(),
        SafeArea(
          minimum: SteppPlaceSize.steppPlacePagePadding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CustomOpacityTile(
                  title: Text(
                    SteppPlaceUIStrings.steppPlaceMockTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  subTitle: Text(
                    SteppPlaceUIStrings.steppPlaceSubTitle,
                    style: context.textTheme.bodySmall!.copyWith(
                      color: Colors.white,
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
          ),
        ),
      ],
    );
  }
}
