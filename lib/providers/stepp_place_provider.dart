import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SteppPlaceProvider extends ChangeNotifier{
  final slidingPanelController = PanelController();
  bool _isPanelOpen = false;
  bool get isPanelOpen => _isPanelOpen;

  void setIsPanelOpen(bool isOpen){
    _isPanelOpen = isOpen;
    notifyListeners();
  }

  void triggerIsPanelOpen(){
    _isPanelOpen = !_isPanelOpen;
    notifyListeners();
  }
}