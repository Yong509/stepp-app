import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stepp_app/constants/home/home_page_size.dart';
import 'package:stepp_app/constants/ui_strings.dart';
import 'package:stepp_app/widgets/home/add/add_stepp_place_tab.dart';
class AddSteppTabMenu {
  static List<Tab> addSteppMenu = [
    Tab(
      child: Row(
        children: [
          PhosphorIcon(PhosphorIcons.triangle(PhosphorIconsStyle.fill), color: Colors.white),
          const SizedBox(width: HomePageSize.addSteppTabIconLabelSpacing),
          Text(UiStrings.commonStepp.toUpperCase()),
        ],
      ),
    ),
    Tab(
      child: Row(
        children: [
          PhosphorIcon(PhosphorIcons.mapPin(PhosphorIconsStyle.fill), color: Colors.white),
          const SizedBox(width: HomePageSize.addSteppTabIconLabelSpacing),
          Text(UiStrings.commonPlace.toUpperCase()),
        ],
      ),
    ),
    Tab(
      child: Row(
        children: [
          PhosphorIcon(PhosphorIcons.usersThree(PhosphorIconsStyle.fill), color: Colors.white),
          const SizedBox(width: HomePageSize.addSteppTabIconLabelSpacing),
          Text(UiStrings.commonPlace.toUpperCase()),
        ],
      ),
    ),
  ];

  static List<Widget> addSteppTabView = [
    Container(),
    const AddSteppPlaceTab(),
    Container(),
  ];
}
