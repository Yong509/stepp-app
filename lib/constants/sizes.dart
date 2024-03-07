import 'package:flutter/material.dart';

class Sizes {
  static const spacing0 = 0.0;
  static const spacing5 = 5.0;
  static const spacing10 = 10.0;
  static const spacing15 = 15.0;

  static const horizontalPaddingTiny = EdgeInsets.symmetric(horizontal: 3.0);
  static const horizontalPaddingSmall = EdgeInsets.symmetric(horizontal: 4.0);
  static const horizontalPaddingMediumSmall = EdgeInsets.symmetric(horizontal: 8.0);
  static const horizontalPaddingMedium = EdgeInsets.symmetric(horizontal: 16.0);
  static const horizontalPaddingBig = EdgeInsets.symmetric(horizontal: 24.0);
  static const horizontalPaddingHuge = EdgeInsets.symmetric(horizontal: 40.0);

  static const verticalPaddingTiny = EdgeInsets.symmetric(vertical: 2.0);
  static const verticalPaddingLittleTiny = EdgeInsets.symmetric(vertical: 6.0);
  static const verticalPaddingLittle = EdgeInsets.symmetric(vertical: 8.0);
  static const verticalPaddingSmall = EdgeInsets.symmetric(vertical: 12.0);
  static const verticalPaddingMedium = EdgeInsets.symmetric(vertical: 16.0);
  static const verticalPaddingBig = EdgeInsets.symmetric(vertical: 24.0);
  static const verticalPaddingLarge = EdgeInsets.symmetric(vertical: 40.0);

  static const horizontalSpacingLittle = 4.0;
  static const horizontalSpacingSmall = 8.0;

  static const verticalSpacingLittle = 4.0;
  static const verticalSpacingSmall = 8.0;

  static const profilePictureRadius = 43.0;
  static const profilePictureRadiusSmall = 20.0;
  static const profilePictureRadiusTiny = 16.0;
  static const uploadIconToProfilePictureRadiusRatio = 0.28;

  static const commonAppBarLeadingWidth = 90.0;
  static const bottomNavigatorIconSize = 20.0;

  static const allSidePaddingNone = EdgeInsets.all(0.0);
  static const allSidePaddingTiny = EdgeInsets.all(4.0);
  static const allSidePaddingSmall = EdgeInsets.all(6.0);
  static const allSidePaddingMediumSmall = EdgeInsets.all(8.0);
  static const allSidePaddingMedium = EdgeInsets.all(12.0);
  static const allSidePaddingBig = EdgeInsets.all(16.0);
  static const allSidePaddingHuge = EdgeInsets.all(24.0);

  static const onlyLeftPaddingSmall = EdgeInsets.only(left: 8.0);
  static const onlyLeftPaddingMidSize = EdgeInsets.only(left: 12.0);
  static const onlyLeftPaddingMedium = EdgeInsets.only(left: 16.0);
  static const onlyLeftPaddingBig = EdgeInsets.only(left: 30.0);
  static const onlyLeftPaddingHuge = EdgeInsets.only(left: 48.0);
  static const onlyTopPaddingLittle = EdgeInsets.only(top: 4.0);
  static const onlyTopPaddingSmall = EdgeInsets.only(top: 8.0);
  static const onlyTopPaddingMedium = EdgeInsets.only(top: 10.0);
  static const onlyTopPaddingHuge = EdgeInsets.only(top: 24.0);
  static const onlyTopPaddingBig = EdgeInsets.only(top: 16.0);
  static const onlyRightPaddingTiny = EdgeInsets.only(right: 2.0);
  static const onlyRightPaddingSmall = EdgeInsets.only(right: 4.0);
  static const onlyRightPaddingSmallish = EdgeInsets.only(right: 6.0);
  static const onlyRightPaddingMidSize = EdgeInsets.only(right: 8.0);
  static const onlyRightPaddingMedium = EdgeInsets.only(right: 10.0);
  static const onlyRightPaddingMediumLarge = EdgeInsets.only(right: 12.0);
  static const onlyRightPaddingBig = EdgeInsets.only(right: 30.0);
  static const onlyRightPaddingHuge = EdgeInsets.only(right: 48.0);
  static const onlyBottomPaddingTiny = EdgeInsets.only(bottom: 2.0);
  static const onlyBottomPaddingLittle = EdgeInsets.only(bottom: 4.0);
  static const onlyBottomPaddingSmall = EdgeInsets.only(bottom: 8.0);
  static const onlyBottomPaddingMedium = EdgeInsets.only(bottom: 12.0);
  static const onlyBottomPaddingBig = EdgeInsets.only(bottom: 16.0);
  static const onlyBottomPaddingHuge = EdgeInsets.only(bottom: 24.0);

  static const iconSizeSmall = 16.0;
  static const iconSizeMedium = 28.0;
  static const iconSizeLarge = 40.0;

  static const borderWidthMedium = 1.0;
  static const borderWidthBig = 2.0;
  static const borderRadiusTiny = 4.0;
  static const borderRadiusSmall = 8.0;
  static const borderRadiusMedium = 16.0;
  static const borderRadiusBig = 20.0;

  static const tileButtonMinimumWidth = 9.0;
  static const tileButtonMinimumHeight = 5.0;
  static const tileButtonElevation = 2.0;
  static const gridTileButtonHorizontalPaddingFaction = 0.04;
  static const toggleSwitchTextLengthFraction = 0.65;
  static const notificationTimeRowSpace = 10.0;
  static const notificationTimeCustomButtonWidthFraction = 0.30;

  static const topRoundBorderRadiusMedium = BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  );

  static const allRoundBorderSmall = BorderRadius.all(Radius.circular(10.0));
  static const allRoundBorderMedium = BorderRadius.all(Radius.circular(20.0));

  static const allRoundBorderExtraLarge = BorderRadius.all(Radius.circular(50.0));

  static const allRoundBorderLarge = BorderRadius.all(Radius.circular(50.0));

  static const borderWidthThin = 1.0;
  static const borderWidthLarge = 2.0;

  static const gridTileSpacingFraction = 1 / 32.0;
  static const homePageGridTileCrossAxisCount = 3;

  static const disabledWidgetElevation = 0.0;

  static const defaultButtonHeight = 36.0;

  static const circularIconBackgroundRadiusFraction = 1 / 3.0;

  static const elevationNone = 0.0;
  static const appPageTemplateBottomNoneLength = 1;
  static const appPageTemplateTopPadding = 16;

  static const sizedBoxHorizontalSpacingSmall = SizedBox(width: 8);

  static const preferredSizeMax = 4.0;
  static const preferredSizeHeightAppBar = 1.0;
}
