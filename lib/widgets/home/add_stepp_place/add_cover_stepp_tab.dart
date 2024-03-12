import 'package:flutter/material.dart';
import 'package:stepp_app/constants/home/add/add_cover_stepp_tab_menu.dart';
import 'package:stepp_app/utils/build_context_helper.dart';

class AddCoverSteppTab extends StatelessWidget {
  const AddCoverSteppTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: DefaultTabController(
          length: AddCoverSteppTabMenu.addCoverSteppTabMenu.length,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TabBar(
                splashFactory: NoSplash.splashFactory,
                isScrollable: false,
                tabAlignment: TabAlignment.center,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                unselectedLabelColor: Colors.white,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                labelStyle: context.textTheme.bodyMedium,
                tabs: AddCoverSteppTabMenu.addCoverSteppTabMenu,
              ),
              Flexible(
                child: TabBarView(
                  children: AddCoverSteppTabMenu.addSteppTabView,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
