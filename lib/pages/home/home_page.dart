import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stepp_app/constants/home/home_page_size.dart';
import 'package:stepp_app/constants/sizes.dart';
import 'package:stepp_app/pages/home/feed/feed_page.dart';
import 'package:stepp_app/providers/home/add_stepp_provider.dart';
import 'package:stepp_app/providers/home/home_provider.dart';
import 'package:stepp_app/styles/app_theme.dart';
import 'package:stepp_app/widgets/home/add_stepp_panel.dart';
import 'package:stepp_app/widgets/page_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return SlidingUpPanel(
          controller: homeProvider.addPanelController,
          backdropColor: Colors.transparent,
          minHeight: HomePageSize.addSteppPanelMinHeight,
          color: Colors.transparent,
          boxShadow: const [],
          body: PageLayout(
            hasTopPadding: false,
            showAppBar: true,
            centerTitle: false,
            hasBackButton: false,
            titleSpacing: false,
            body: [
              const SizedBox(),
              const SizedBox(),
              ChangeNotifierProvider<AddSteppProvider>(
                create: (context) => AddSteppProvider(),
                builder: (context, child) => const FeedPage(),
              ),
              const SizedBox(),
              const SizedBox(),
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
          ),
          panelBuilder: (sc) {
            return const AddSteppPanel();
          },
        );
      },
    );
  }
}
