import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stepp_app/constants/home/home_page_size.dart';
import 'package:stepp_app/providers/image_gallery_provider.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/utils/list_helper.dart';

class ImageGalleryGrid extends StatefulWidget {
  const ImageGalleryGrid({super.key});

  @override
  State<ImageGalleryGrid> createState() => _ImageGalleryGridState();
}

class _ImageGalleryGridState extends State<ImageGalleryGrid> {
  final scrollController = ScrollController();
  final placeholderAlbum = List.filled(24, null);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageGalleryProvider>(
      builder: (context, imageGalleryProvider, child) {
        return Material(
          color: Colors.transparent,
          child: DefaultTabController(
            length: imageGalleryProvider.entities!.length,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TabBar(
                  tabAlignment: TabAlignment.center,
                  splashFactory: NoSplash.splashFactory,
                  isScrollable: true,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  unselectedLabelColor: Colors.white,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.white,
                  labelColor: Colors.white,
                  labelStyle: context.textTheme.bodyMedium,
                  tabs: imageGalleryProvider.entities!.map((e) => Tab(text: e.name)).toList(),
                ),
                const SizedBox(
                  height: HomePageSize.gridViewTabViewSpacing,
                ),
                Flexible(
                  child: TabBarView(
                    children: imageGalleryProvider.entities!.mapWithIndex((e, index) {
                      return _buildImageGridPicture(imageGalleryProvider.assetEntity![index]);
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageGridPicture(List<AssetEntity> album) {
    return Consumer<ImageGalleryProvider>(
      builder: (context, value, child) {
        return GridView.custom(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          controller: scrollController,
          padding: HomePageSize.gridViewPadding,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: HomePageSize.imageCrossAxisCount,
            crossAxisSpacing: HomePageSize.gridViewCrossAxisSpace,
            mainAxisSpacing: HomePageSize.gridViewMainAxisSpace,
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              final entity = album[index];
              return GestureDetector(
                onTap: () async {
                  final file = await entity.file;
                  print(file!.absolute);
                },
                child: AssetEntityImage(
                  entity,
                  key: ValueKey(index),
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (((child as Semantics).child as RawImage).image != null) {
                      return child;
                    }
                    return const Skeletonizer(
                      child: Card(
                        margin: EdgeInsets.zero,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            childCount: album.length,
          ),
        );
      },
    );
  }
}
