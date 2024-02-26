import 'package:flutter/material.dart';
import 'package:stepp_app/constants/widgets/custom_opacity_tile_size.dart';
import 'package:stepp_app/constants/widgets/custom_opcaity_button_size.dart';

import '../styles/app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.child,
    this.padding = CustomOpacityButtonSize.buttonPadding,
    this.isOpacity = true,
    this.backgroundColor,
  });

  final VoidCallback? onTap;
  final Widget child;
  final EdgeInsets? padding;
  final bool? isOpacity;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor ??
              AppTheme.black900.withOpacity(
                isOpacity! ? AppTheme.opacity80Percent : 1,
              ),
          borderRadius: BorderRadius.circular(
            CustomOpacityTileSize.detailTileBorderRaidusSize,
          ),
        ),
        child: child,
      ),
    );
  }
}
