import 'package:flutter/material.dart';

class HomePageSize {
  static const addSteppPanelBorderRadius = Radius.circular(20);
  static const addSteppPanelPadding = EdgeInsets.symmetric(vertical: 26, horizontal: 20);
  static const addSteppPanelMenuPlaceSpacing = 30.0;
  static const addSteppPanelMinHeight = 0.0;
  static const addSteppPanelHalfHeight = 0.5;
  static const addSteppTabBarTabViewSpacing = 25.0;
  static const addSteppTabIconLabelSpacing = 6.0;
  static const addSteppPadding = EdgeInsets.symmetric(horizontal: 30);
  static const addSteppInputGallerySpace = 15.0;
  static const addSteppDescriptionMinLine = 5;
  static const addSteppTitleInputHeight = 42.0;
  static const addSteppEachSteppPanelPadding = EdgeInsets.only(left: 30, right: 30, bottom: 50);
  static const addSteppEachSteppAssetImageSize = 60.0;

  // image gallery grid view
  static const imageCrossAxisCount = 3;
  static const gridViewCrossAxisSpace = 1.5;
  static const gridViewMainAxisSpace = 1.5;
  static const gridViewTabViewSpacing = 10.0;
  static const gridViewPadding = EdgeInsets.symmetric(horizontal: 3);
  static const selectImageIconPadding = EdgeInsets.only(bottom: 3, right: 3);
  static const selectImageIconBorderWidth = 2.0;
  static const imageGalleryPanelPadding = EdgeInsets.only(top: 30);
  static const whatIsSteppTextFiledHeight = 50.0;

  static const quitEachSteppDialogInsetPadding = EdgeInsets.symmetric(vertical: 20, horizontal: 10);
  static EdgeInsets quitEachSteppDialogOutSitePadding(double deviceWidth) =>
      EdgeInsets.symmetric(horizontal: deviceWidth * 0.2);
}
