import 'package:flutter/material.dart';
import 'package:stepp_app/constants/home/add/add_cover_stepp_page_ui_strings.dart';
import 'package:stepp_app/widgets/home/add_stepp_place/add_cover_stepp_description.dart';
import 'package:stepp_app/widgets/home/add_stepp_place/add_cover_stepp_image_tab.dart';

class AddCoverSteppTabMenu {
  static List<Tab> addCoverSteppTabMenu = [
    const Tab(
      text: AddCoverSteppUiStrings.addImageOrVideo,
    ),
    const Tab(
      text: AddCoverSteppUiStrings.addDescriptionOrFriends,
    ),
  ];

  static List<Widget> addSteppTabView = [
    const AddCoverSteppImageTab(),
    const AddCoverSteppPlaceDescription(),
  ];
}
