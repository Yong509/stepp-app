class SteppPlaceModel {
  final String imagePath;
  SteppPlaceModel({
    required this.imagePath,
  });

  static final List<SteppPlaceModel> mockSteppPlace = [
    SteppPlaceModel(imagePath: 'assets/images/thumbnail.jpg'),
    SteppPlaceModel(imagePath: 'assets/images/thumbnail-4.png'),
    SteppPlaceModel(imagePath: 'assets/images/thumbnail-5.png'),
    SteppPlaceModel(imagePath: 'assets/images/thumbnail-6.png'),
  ];
}
