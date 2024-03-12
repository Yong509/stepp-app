import 'package:stepp_app/constants/ui_strings.dart';

class HomePageUiStrings {
  static String currentAddSteppIndex(int index) => "/$index";
  static String distanceWithUnit(double distance) => "$distance km";
  static String totalSteppWithUnit(double distance) => "$distance Stepp";
  static String selectPlacePrompt(String placeTitle) => "@ $placeTitle";
  static String whatIsThisSteppHintText(int index) =>
      "${(index + 1).toString()}    ${UiStrings.whatIsThisStepHintText}";

  static const descriptionHintText = "Write some caption how about your all stepp ...";
  static const startSteppTextButton = "+ Start Stepp";
  static const plustStepp = "+ Stepp";

  static const stayEditSteppPage = "No, I want to keep edit";
  static const quitEditSteppPage = "Quit";
  static const quitEditSteppDialogTitle = "If you go back now, your post will be discarded.";
  static const addOrEditDescription = "Add/Edit description";
  static const addOrEditImage = "Add/Edit image";
}
