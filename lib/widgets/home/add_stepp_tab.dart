import 'package:flutter/material.dart';
import 'package:stepp_app/constants/home/add_stepp_tab_menu.dart';
import 'package:stepp_app/utils/build_context_helper.dart';

class AddSteppTab extends StatelessWidget {
  const AddSteppTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: DefaultTabController(
        length: AddSteppTabMenu.addSteppMenu.length,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TabBar(
              tabAlignment: TabAlignment.fill,
              splashFactory: NoSplash.splashFactory,
              unselectedLabelColor: Colors.white,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              labelStyle: context.textTheme.bodyMedium,
              tabs: AddSteppTabMenu.addSteppMenu,
            ),
            Flexible(
                child: TabBarView(
              children: AddSteppTabMenu.addSteppTabView,
            ))
          ],
        ),
      ),
    );
  }
}
