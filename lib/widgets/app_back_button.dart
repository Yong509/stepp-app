import 'package:flutter/material.dart';
import 'package:stepp_app/constants/sizes.dart';
import 'package:stepp_app/utils/build_context_helper.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    Key? key,
    this.icon,
    this.backButtonText,
  }) : super(key: key);

  final Widget? icon;
  final String? backButtonText;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = theme.textTheme;
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Padding(
        padding: Sizes.onlyLeftPaddingMedium,
        child: Row(
          children: [
            icon ??
                Icon(
                  Icons.arrow_back_ios_sharp,
                  color: theme.colorScheme.onSurface,
                ),
            if (backButtonText != null)
              Text(
                backButtonText!,
                style: textTheme.titleSmall!.copyWith(
                  color: theme.colorScheme.onBackground,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
