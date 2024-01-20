import 'package:flutter/material.dart';
import 'package:stepp_app/constants/widgets/custom_opacity_tile_size.dart';
import 'package:stepp_app/styles/app_theme.dart';

class CustomOpacityTile extends StatelessWidget {
  final Widget title;
  final Widget? leading;
  final Widget? subTitle;
  const CustomOpacityTile({super.key, required this.title, this.subTitle, this.leading});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: ListTile(
        contentPadding: CustomOpacityTileSize.tilePadding,
        dense: true,
        horizontalTitleGap: CustomOpacityTileSize.tileLeadingTitleSpacing,
        leading: leading,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            CustomOpacityTileSize.detailTileBorderRaidusSize,
          ),
        ),
        tileColor: AppTheme.black900.withOpacity(AppTheme.opacity80Percent),
        title: title,
        subtitle: subTitle,
      ),
    );
  }
}
