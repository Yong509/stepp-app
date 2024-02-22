import 'package:photo_manager/photo_manager.dart';

class ImageGalleryService {
  final FilterOptionGroup _filterOptionGroup = FilterOptionGroup(
    imageOption: const FilterOption(
      sizeConstraint: SizeConstraint(ignoreSize: true),
    ),
  );


  Future<List<AssetPathEntity>> getAssets() async {
    final permission = await PhotoManager.requestPermissionExtend();
    if (permission.hasAccess || permission.isAuth) {
      final paths = await PhotoManager.getAssetPathList(
        filterOption: _filterOptionGroup,
      );
      return paths;
    } else {
      await PhotoManager.requestPermissionExtend();
    }
    return [];
  }


  Future<List<AssetEntity>> loadAlbumAssets(AssetPathEntity album) async {
    int totalCount = await album.assetCountAsync;
    return await album.getAssetListPaged(
      page: 0,
      size: totalCount == 0 ? 1 : totalCount,
    );
  }
}
