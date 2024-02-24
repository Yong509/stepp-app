import 'dart:io';
import 'package:flutter/material.dart';
import 'package:stepp_app/data_models/stepp_place/add_stepp_place_model.dart';

class AddSteppProvider extends ChangeNotifier {
  final TextEditingController addSteppTextController = TextEditingController();
  List<AddSteppPlaceModel> stepps = [];

  File? _currentEntity;

  set currentEntity(File? entity) {
    _currentEntity = entity;
    notifyListeners();
  }

  File? get currentEntity => _currentEntity;
}
