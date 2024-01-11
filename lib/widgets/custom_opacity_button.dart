import 'package:flutter/material.dart';
import 'package:stepp_app/constants/widgets/custom_opacity_tile.dart';
import 'package:stepp_app/constants/widgets/custom_opcaity_button_size.dart';

import '../styles/app_theme.dart';

class CustomOpacityButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  final EdgeInsets? padding;
  const CustomOpacityButton({super.key, this.onTap, required this.child, this.padding = CustomOpacityButtonSize.buttonPadding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: AppTheme.black900.withOpacity(AppTheme.opacity80Percent),
          borderRadius: BorderRadius.circular(
            CustomOpacityTileSize.detailTileBorderRaidusSize,
          ),
        ),
        child: child,
      ),
    );
  }
}
