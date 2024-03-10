import 'package:flutter/material.dart';
import 'package:stepp_app/widgets/home/add_stepp_place/add_cover_stepp_description.dart';
import 'package:stepp_app/widgets/home/add_stepp_place/add_cover_stepp_image_tab.dart';

class AddCoverSteppTabMenu {
  static List<Tab> addCoverSteppTabMenu = [
    const Tab(
      text: "Add a IMG/VDO",
    ),
    const Tab(
      text: "Add Friends/Description",
    ),
  ];

  static List<Widget> addSteppTabView = [
    const AddCoverSteppImageTab(),
    const AddCoverSteppPlaceDescription(),
  ];
}
