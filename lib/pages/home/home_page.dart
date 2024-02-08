import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stepp_app/constants/sizes.dart';
import 'package:stepp_app/pages/home/feed/feed_page.dart';
import 'package:stepp_app/styles/app_theme.dart';
import 'package:stepp_app/widgets/page_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      hasTopPadding: false,
      showAppBar: true,
      centerTitle: false,
      hasBackButton: false,
      titleSpacing: false,
      body: const [
        FeedPage(),
        SizedBox(),
        SizedBox(),
        SizedBox(),
        SizedBox(),
      ],
      actions: [
        IconButton(
          onPressed: () {},
          icon: PhosphorIcon(
            PhosphorIcons.bell(),
            size: Sizes.iconSizeMedium,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: PhosphorIcon(
            PhosphorIcons.chatTeardropText(),
            size: Sizes.iconSizeMedium,
          ),
        )
      ],
      appbarBottom: PreferredSize(
        preferredSize: const Size.fromHeight(Sizes.preferredSizeMax),
        child: Container(
          color: Colors.black.withAlpha(AppTheme.alpha12Percent),
          height: Sizes.preferredSizeHeightAppBar,
        ),
      ),
    );
  }
}
