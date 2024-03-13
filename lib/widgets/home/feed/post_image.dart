import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stepp_app/constants/home/feed/post_box_size.dart';
import 'package:stepp_app/constants/stepp_place/stepp_place_ui_strings.dart';
import 'package:stepp_app/styles/app_theme.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/utils/list_helper.dart';

class PostImage extends StatelessWidget {
  final String imagePath;
  final List<String> steppProfile;
  const PostImage({
    super.key,
    required this.steppProfile,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: PostBoxSize.imagePostHeight(context.deviceSize.height),
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: [
                Container(
                  padding: PostBoxSize.postTitleContainerPadding,
                  margin: PostBoxSize.postTitleContainerMargin,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.black.withOpacity(
                      AppTheme.opacity80Percent,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.place,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: PostBoxSize.postTitleIconSpacing,
                      ),
                      Text(
                        SteppPlaceUIStrings.steppPlaceBucketList,
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                ...steppProfile.mapWithIndex((item, index) {
                  return Positioned(
                    bottom: PostBoxSize.steppProfileBottomPositioned,
                    right: PostBoxSize.steppProfileRightPositioned(index),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(item),
                          radius: 18,
                        ),
                      ],
                    ),
                  );
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
