import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:stepp_app/services/image_gallery_service.dart';

class ImageGalleryProvider extends ChangeNotifier {
  ImageGalleryProvider(this.imageGalleryService) {
    initialGallery();
  }
  ImageGalleryService imageGalleryService;

  List<AssetPathEntity>? entities = [];
  List<List<AssetEntity>>? assetEntity = [];
  List<PMDarwinAssetCollectionSubtype> desiredSubtypes = [
    PMDarwinAssetCollectionSubtype.smartAlbumFavorites,
    PMDarwinAssetCollectionSubtype.smartAlbumUserLibrary,
    PMDarwinAssetCollectionSubtype.smartAlbumVideos,
  ];
  bool isProcessing = false;

  Future<void> initialGallery() async {
    startProcessing();

    final allAssets = await imageGalleryService.getAssets();
    entities = filterCollections(allAssets);
    for (var element in entities!) {
      final entity = await imageGalleryService.loadAlbumAssets(element);
      assetEntity!.add(entity);
    }
    endProcessing();

    notifyListeners();
  }

  List<AssetPathEntity> filterCollections(List<AssetPathEntity> allAssets) {
    return allAssets.where((element) {
      return element.darwinSubtype != null && desiredSubtypes.contains(element.darwinSubtype!) ||
          element.darwinType == PMDarwinAssetCollectionType.album;
    }).toList();
  }

  void startProcessing() {
    isProcessing = true;
    notifyListeners();
  }

  void endProcessing() {
    isProcessing = false;
    notifyListeners();
  }

  // Future<void> loadMoreAccess() async {
  //   final moreAsset = await imageGalleryService.loadMoreAssets();
  //   for (var element in moreAsset) {
  //     entities = [...entities!, if (!entities!.contains(element)) element];
  //   }
  //   notifyListeners();
  // }
}
