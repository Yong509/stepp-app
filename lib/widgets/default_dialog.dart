import 'package:flutter/material.dart';
import 'package:stepp_app/constants/sizes.dart';

/// DefaultDialog used for create a properly sized dialog
class DefaultDialog extends StatelessWidget {
  const DefaultDialog({
    Key? key,
    required this.body,
    this.insetPadding = Sizes.allSidePaddingMedium,
    this.outsitePadding = Sizes.allSidePaddingMedium,
    this.backgroundColor = Colors.black,
  }) : super(key: key);

  final List<Widget> body;
  final EdgeInsets outsitePadding;
  final EdgeInsets insetPadding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outsitePadding,
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: backgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: Sizes.allRoundBorderMedium,
        ),
        child: Padding(
          padding: insetPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: body,
          ),
        ),
      ),
    );
  }
}
