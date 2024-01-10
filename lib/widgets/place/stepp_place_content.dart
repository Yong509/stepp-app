import 'package:flutter/material.dart';
import 'package:stepp_app/constants/place/stepp_place_size.dart';
import 'package:stepp_app/constants/place/stepp_place_ui_strings.dart';
import 'package:stepp_app/styles/app_theme.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/widgets/custom_opacity_tile.dart';

class SteppPlaceContent extends StatefulWidget {
  const SteppPlaceContent({super.key});

  @override
  State<SteppPlaceContent> createState() => _SteppPlaceContentState();
}

class _SteppPlaceContentState extends State<SteppPlaceContent> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: SteppPlaceSize.steppPlaceContentPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: IntrinsicWidth(
                child: CustomOpacityTile(
                  leading: Text(
                    SteppPlaceUIStrings.steppPlcaeIndex,
                    style: context.textTheme.bodyLarge!
                        .copyWith(color: Colors.white),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        SteppPlaceUIStrings.steppPlaceTitleTh,
                        maxLines:
                            SteppPlaceSize.steppPlaceNameTitleTileMaxLines,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.bodyMedium!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        SteppPlaceUIStrings.steppPlaceTitleEn,
                        style: context.textTheme.labelSmall!.copyWith(
                          color: Colors.white
                              .withOpacity(AppTheme.opacity80Percent),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              SteppPlaceUIStrings.steppPlaceDescription,
              style:
                  context.textTheme.bodyMedium!.copyWith(color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
