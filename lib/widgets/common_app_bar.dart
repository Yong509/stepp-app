import 'package:flutter/material.dart';
import 'package:stepp_app/constants/sizes.dart';
import 'package:stepp_app/widgets/app_back_button.dart';

/// Common AppBar that used in page layout.
class CommonAppBar extends AppBar {
  CommonAppBar(
      {Key? key,
      bool hasLeadingWidget = true,
      Widget? backButtonIcon,
      String? backButtonText,
      Widget? title,
      Widget? body,
      List<Widget>? actions,
      Color? backgroundColor,
      PreferredSizeWidget? bottom,
      bool? centerTitle})
      : super(
          key: key,
          centerTitle: centerTitle ?? true,
          backgroundColor: backgroundColor,
          leadingWidth: Sizes.commonAppBarLeadingWidth,
          leading: hasLeadingWidget
              ? AppBackButton(
                  icon: backButtonIcon,
                  backButtonText: backButtonText,
                )
              : Container(),
          title: title,
          flexibleSpace: body,
          elevation: Sizes.elevationNone,
          actions: [
            if (actions != null)
              Padding(
                padding: Sizes.onlyRightPaddingBig,
                child: Row(
                  children: actions,
                ),
              )
          ],
          bottom: bottom,
        );
}
