import 'package:flutter/material.dart';
import 'package:stepp_app/constants/ui_strings.dart';
import 'package:stepp_app/pages/home/add/add_stepp_place_page.dart';
class AddSteppTabMenu {
  static List<Tab> addSteppMenu = [
    Tab(text: UiStrings.commonStepp.toUpperCase()),
    Tab(text: UiStrings.commonPlace.toUpperCase()),
    Tab(text: UiStrings.commonTogether.toUpperCase()),
  ];

  static List<Widget> addSteppTabView = [
    Container(),
    const AddSteppPlacePage(),
    Container(),
  ];
}
