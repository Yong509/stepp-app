import 'dart:io';
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
  List<PMDarwinAssetCollectionSubtype> desiredSubtypesIOS = [
    PMDarwinAssetCollectionSubtype.smartAlbumFavorites,
    PMDarwinAssetCollectionSubtype.smartAlbumUserLibrary,
    PMDarwinAssetCollectionSubtype.smartAlbumVideos,
  ];
  List<String> desiredSubtypesAndroid = ["Recent", "Pictures", "Downlaod", "Videos"];

  List<List<AssetEntity>>? createSteppAssetEntity = [];

  Future<void> initialGallery() async {
    final allAssets = await imageGalleryService.getAssets();
    entities = filterCollections(allAssets);
    for (var element in entities!) {
      final entity = await imageGalleryService.loadAlbumAssets(element);
      assetEntity!.add(entity);
    }
    notifyListeners();
  }

  List<AssetPathEntity>? filterCollections(List<AssetPathEntity> allAssets) {
    if (Platform.isAndroid) {
      return allAssets.where((element) {
        return desiredSubtypesAndroid.contains(element.name);
      }).toList();
    } else if (Platform.isIOS) {
      return allAssets.where((element) {
        return element.darwinSubtype != null && desiredSubtypesIOS.contains(element.darwinSubtype!) ||
            element.darwinType == PMDarwinAssetCollectionType.album;
      }).toList();
    }
    return null;
  }
}
