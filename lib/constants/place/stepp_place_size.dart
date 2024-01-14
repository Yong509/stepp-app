import 'package:flutter/material.dart';

class SteppPlaceSize {
  //Stepp place
  static const steppPlacePagePadding = EdgeInsets.symmetric(horizontal: 4,vertical: 10);
  static const steppPlaceTitleTileWidth = 250.0;
  static double steppPlaceShareSpacing(double mediaWidthSize) => mediaWidthSize * 0.1;
  static const steppPlaceSaveIconButtonSize = 15.0;
  static const steppPlaceSaveIconTitleButtonSize = 10.0;
  static const steppPlaceNameTitleTileMaxLines = 1;
  static const steppPlaceContentTitlePadding = EdgeInsets.only(right: 0);
  static const steppPlaceContentPadding = EdgeInsets.symmetric(horizontal: 8);
  static const steppPlaceTileDescriptionSpace = 10.0;
  static const steppPlaceContentProfileRadius = 24.0;
  static const steppPlaceFollowButtonPadding = EdgeInsets.symmetric(vertical: 7,horizontal: 13);
  static const steppPlaceLikeIconSize = 40.0;
  static const steppPlacePanelSteppButtonIconSize = 16.0;
  static const steppPlaceDescriptionMaxLines = 2;
  static const steppPlaceSteppButtonPadding = EdgeInsets.symmetric(vertical: 12, horizontal: 8);

  //Stepp display box
  static const steppPlaceDisplayBoxSteppImageSize = 65.0;
  static const steppPlaceDisplayBoxSteppImagePadding = EdgeInsets.symmetric(vertical: 10, horizontal: 4);
  static const steppPlaceDisplayBoxSteppProfileRightPosition = 0.0;
  static const steppPlaceDisplayBoxSteppProfileBottomPosition = 0.0;
  static const steppPlaceDisplayBoxSteppProfileImageSize = 18.0;

  //Stepp Place Sliding Up Panel
  static double steppPlaceSlidingPanelMaxHeight(double mediaWidthSize) => mediaWidthSize * 0.5;
  static double steppPlaceSlidingPanelMinHeight = 0.0;
  static double steppPlaceSlidingPanelBorderRadius = 20.0;
  static double steppPlaceSlidingPanelHalfHeight = 0.5;
  static const steppPlaceSlidingPanelPadding = EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0);
}
