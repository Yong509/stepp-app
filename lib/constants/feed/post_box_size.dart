import 'package:flutter/material.dart';

class PostBoxSize {
  static double postBoxHeight(double deviceHeight) => deviceHeight * 0.75;
  static double profilePosterRadius = 27.0;
  static double postTitleIconSpacing = 10.0;
  static const postTitleContainerPadding = EdgeInsets.symmetric(
    horizontal: 10,
    vertical: 15,
  );
    static const postTitleContainerMargin  = EdgeInsets.symmetric(
    horizontal: 10,
    vertical: 35,
  );
  static double imagePostHeight(double deviceHeight) => deviceHeight * 1.75;

  // Stepped Profile
  static double steppProfileBottomPositioned = 10;
  static double steppProfileRightPositioned(int index) => (index + 20 * index).toDouble();

  // Post action bar
  static double postActionBarIconSize = 35;

  //Post content
  static const postContentPadding = EdgeInsets.symmetric(horizontal: 20);
  static const postContentMaxLines = 3;
}
