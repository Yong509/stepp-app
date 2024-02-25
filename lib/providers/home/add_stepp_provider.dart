import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:stepp_app/constants/mock_data.dart';
import 'package:stepp_app/data_models/stepp_place/add_stepp_place_model.dart';

class AddSteppProvider extends ChangeNotifier {
  AddSteppProvider({this.panelScrollController});
  final ScrollController? panelScrollController;

  final TextEditingController addSteppTextController = TextEditingController();
  List<AddSteppPlaceModel> stepps = [];

  AssetEntity? _currentEntity;
  Place? _selectPlace;

  set selectPlace(Place? place) {
    _selectPlace = place;
    notifyListeners();
  }

  Place? get selectPlace => _selectPlace;

  set currentEntity(AssetEntity? entity) {
    _currentEntity = entity;
    notifyListeners();
  }

  AssetEntity? get currentEntity => _currentEntity;

  Future<File?> convertToFile() async {
    return await _currentEntity?.file;
  }
}
