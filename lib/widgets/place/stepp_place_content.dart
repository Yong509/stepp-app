import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stepp_app/constants/place/stepp_place_size.dart';
import 'package:stepp_app/constants/place/stepp_place_ui_strings.dart';
import 'package:stepp_app/constants/ui_strings.dart';
import 'package:stepp_app/providers/stepp_place_provider.dart';
import 'package:stepp_app/styles/app_theme.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/widgets/custom_opacity_button.dart';
import 'package:stepp_app/widgets/custom_opacity_tile.dart';
import 'package:stepp_app/widgets/place/profile_avatar.dart';
import 'package:stepp_app/widgets/place/stepp_place_panel.dart';

class SteppPlaceContent extends StatefulWidget {
  final Function(bool)? isOnOpenComment;
  const SteppPlaceContent({super.key, this.isOnOpenComment});

  @override
  State<SteppPlaceContent> createState() => _SteppPlaceContentState();
}

class _SteppPlaceContentState extends State<SteppPlaceContent> {
  var isOpenComment = false;

  bool _triggerOpenComment() {
    isOpenComment = !isOpenComment;
    return isOpenComment;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: SteppPlaceSize.steppPlaceContentBottomPadding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ProfileAvatar(),
            Flexible(
              child: Padding(
                padding: SteppPlaceSize.steppPlaceContentPadding,
                child: Column(
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisAlignment:
                            context.watch<SteppPlaceProvider>().isPanelOpen
                                ? MainAxisAlignment.spaceBetween
                                : MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              IntrinsicWidth(
                                child: CustomOpacityTile(
                                  leading: Text(
                                    SteppPlaceUIStrings.steppPlcaeIndex,
                                    style: context.textTheme.bodyLarge!.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        SteppPlaceUIStrings.steppPlaceTitleTh,
                                        maxLines: SteppPlaceSize
                                            .steppPlaceNameTitleTileMaxLines,
                                        overflow: TextOverflow.ellipsis,
                                        style: context.textTheme.bodyMedium!
                                            .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        SteppPlaceUIStrings.steppPlaceTitleEn,
                                        style: context.textTheme.labelSmall!
                                            .copyWith(
                                          color: Colors.white.withOpacity(
                                              AppTheme.opacity80Percent),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height:
                                    SteppPlaceSize.steppPlaceTileDescriptionSpace,
                              ),
                              Text(
                                SteppPlaceUIStrings.steppPlaceDescription,
                                style: context.textTheme.bodyMedium!
                                    .copyWith(color: Colors.white),
                                maxLines:
                                    SteppPlaceSize.steppPlaceDescriptionMaxLines,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height:
                                    SteppPlaceSize.steppPlaceTileDescriptionSpace,
                              ),
                            ],
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () => widget.isOnOpenComment!(
                                _triggerOpenComment(),
                              ),
                              child: IntrinsicWidth(
                                child: CustomOpacityButton(
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.comment_rounded,
                                        color: Colors.white,
                                        size: SteppPlaceSize
                                            .steppPlacePanelSteppButtonIconSize,
                                      ),
                                      const SizedBox(
                                        width: SteppPlaceSize
                                            .steppPlaceSaveIconTitleButtonSize,
                                      ),
                                       Text(
                                        UiStrings.commonComment,
                                        style: context.textTheme.bodySmall!
                                            .copyWith(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SteppPlacePanel()
          ],
        ),
      ),
    );
  }
}
