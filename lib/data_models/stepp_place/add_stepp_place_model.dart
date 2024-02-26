import 'package:photo_manager/photo_manager.dart';
import 'package:stepp_app/constants/mock_data.dart';
import 'package:uuid/uuid.dart';

class AddSteppPlaceModel {
  AddSteppPlaceModel({
    required this.steppTitle,
    this.stepps,
    this.description,
    this.place,
  });

  final String steppTitle;
  String? description;
  List<EachStepp>? stepps;
  Place? place;
}

class EachStepp {
  EachStepp({
    this.image,
    this.title,
    this.description,
  }) {
    id = const Uuid().v4();
  }

  String? id;
  AssetEntity? image;
  String? title;
  String? description;
}
