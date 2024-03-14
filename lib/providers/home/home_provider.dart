import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stepp_app/services/stepp/stepp_place_service.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider(this.steppPlacceService) {
    steppPlacceService.getSteppPlaceFeed();
  }

  final SteppPlaceService steppPlacceService;

  final PanelController addPanelController = PanelController();
}
