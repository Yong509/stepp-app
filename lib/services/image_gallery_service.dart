import 'package:photo_manager/photo_manager.dart';
import 'package:stepp_app/constants/sizes.dart';

class ImageGalleryService {
  final FilterOptionGroup _filterOptionGroup = FilterOptionGroup(
    imageOption: const FilterOption(
      sizeConstraint: SizeConstraint(ignoreSize: true),
    ),
  );
  final int _sizePerPage = Sizes.initAssetSize;
  late AssetPathEntity _path;
  int _page = 0;

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

  Future<List<AssetEntity>> loadMoreAssets() async {
    final entities = await _path.getAssetListPaged(
      page: _page + 1,
      size: _sizePerPage,
    );
    _page++;
    return entities;
  }

  Future<List<AssetEntity>> loadAlbumAssets(AssetPathEntity album) async {
    return await album.getAssetListPaged(
      page: 0,
      size: _sizePerPage,
    );
  }
}
