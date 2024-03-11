import 'package:flutter/material.dart';
import 'package:stepp_app/constants/home/add/add_cover_stepp_page_sizes.dart';
import 'package:stepp_app/constants/sizes.dart';
import 'package:stepp_app/styles/app_theme.dart';
import 'package:stepp_app/utils/build_context_helper.dart';

class ImageThumbnailCover extends StatelessWidget {
  const ImageThumbnailCover({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AddCoverSteppPageSizes.coverImageSizes(context.deviceSize.height),
      decoration: const BoxDecoration(
        borderRadius: Sizes.allRoundBorderMedium,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment(0.0, 1.7),
          colors: [
            AppTheme.gray900,
            AppTheme.gray900,
            AppTheme.black900,
          ],
        ),
      ),
      child: child,
    );
  }
}
