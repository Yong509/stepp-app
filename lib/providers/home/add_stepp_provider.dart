import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:stepp_app/constants/mock_data.dart';
import 'package:stepp_app/data_models/stepp_place/add_stepp_place_model.dart';

class AddSteppProvider extends ChangeNotifier {
  AddSteppProvider({this.panelScrollController});
  final ScrollController? panelScrollController;

  AddSteppPlaceModel? _currentAddStepp;
  AddSteppPlaceModel? get currentAddStepp => _currentAddStepp;
  AssetEntity? _currentEntity;
  AssetEntity? get currentEntity => _currentEntity;
  Place? _selectPlace;
  Place? get selectPlace => _selectPlace;
  TextEditingController titleTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();

  set selectPlace(Place? place) {
    _selectPlace = place;
    notifyListeners();
  }

  set currentEntity(AssetEntity? entity) {
    _currentEntity = entity;
    notifyListeners();
  }

  set currentAddStepp(AddSteppPlaceModel? stepp) {
    _currentAddStepp = stepp;
    notifyListeners();
  }

  void appendEachStepp(EachStepp stepp) {
    _currentAddStepp?.stepps?.add(stepp);
    notifyListeners();
  }
}
