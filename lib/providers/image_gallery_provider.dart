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

  Future<void> initialGallery() async {
    final allAssets = await imageGalleryService.getAssets();
    entities = filterCollections(allAssets);
    for (var element in entities!) {
      final entity = await imageGalleryService.loadAlbumAssets(element);
      assetEntity!.add(entity);
    }
    notifyListeners();
  }

  List<AssetPathEntity> filterCollections(List<AssetPathEntity> allAssets) {
    return allAssets.where((element) {
      return element.darwinSubtype != null && desiredSubtypes.contains(element.darwinSubtype!) ||
          element.darwinType == PMDarwinAssetCollectionType.album;
    }).toList();
  }
}
