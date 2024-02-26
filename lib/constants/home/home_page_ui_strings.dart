import 'package:stepp_app/constants/ui_strings.dart';

class HomePageUiStrings {
  static String currentAddSteppIndex(int index) => "/$index";
  static String distanceWithUnit(double distance) => "$distance km";
  static String totalSteppWithUnit(double distance) => "$distance Stepp";
  static String selectPlacePrompt(String placeTitle) => "@ $placeTitle";
  static String whatIsThisSteppHintText(int index) => "${index.toString()}    ${UiStrings.whatIsThisStepHintText}";

  static const descriptionHintText = "Write some caption how about your all stepp ...";
  static const startSteppTextButton = "+ Start Stepp";
  static const plustStepp = "+ Stepp";
}
