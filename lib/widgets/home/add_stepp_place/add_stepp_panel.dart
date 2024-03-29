import 'package:flutter/material.dart';
import 'package:stepp_app/constants/home/home_page_size.dart';
import 'package:stepp_app/styles/app_theme.dart';
import 'package:stepp_app/widgets/home/add_stepp_place/add_stepp_tab.dart';

class AddSteppPanel extends StatefulWidget {
  const AddSteppPanel({super.key});

  @override
  State<AddSteppPanel> createState() => _AddSteppPanelState();
}

class _AddSteppPanelState extends State<AddSteppPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: HomePageSize.addSteppPanelBorderRadius,
          topRight: HomePageSize.addSteppPanelBorderRadius,
        ),
        color: Colors.black.withOpacity(AppTheme.opacity90Percent),
      ),
      child: const Padding(
        padding: HomePageSize.addSteppPanelPadding,
        child: AddSteppTab(),
      ),
    );
  }
}
