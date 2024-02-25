import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:stepp_app/data_models/stepp_place/add_stepp_place_model.dart';

class AddSteppProvider extends ChangeNotifier {
  final TextEditingController addSteppTextController = TextEditingController();
  List<AddSteppPlaceModel> stepps = [];

  AssetEntity? _currentEntity;

  set currentEntity(AssetEntity? entity) {
    _currentEntity = entity;
    notifyListeners();
  }

  AssetEntity? get currentEntity => _currentEntity;

  Future<File?> convertToFile() async {
    return await _currentEntity?.file;
  }
}
