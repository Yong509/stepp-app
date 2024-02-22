import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stepp_app/constants/home/home_page_size.dart';
import 'package:stepp_app/providers/image_gallery_provider.dart';
import 'package:stepp_app/services/image_gallery_service.dart';
import 'package:stepp_app/styles/app_theme.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/utils/list_helper.dart';

class ImageGalleryGrid extends StatefulWidget {
  const ImageGalleryGrid({super.key});

  @override
  State<ImageGalleryGrid> createState() => _ImageGalleryGridState();
}

class _ImageGalleryGridState extends State<ImageGalleryGrid> with TickerProviderStateMixin {
  final scrollController = ScrollController();
  AssetEntity? selectEntity;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ImageGalleryGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
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
            ));
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
                  setState(() {
                    selectEntity = entity;
                  });
                },
                child: Stack(
                  children: [
             
                    Positioned.fill(
                      child: AssetEntityImage(
                        entity,
                        isOriginal: false,
                        key: ValueKey(entity.id),
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (((child as Semantics).child as RawImage).image != null) {
                            return child;
                          }
                          return Skeletonizer(
                            effect: ShimmerEffect(
                              baseColor: AppTheme.black900,
                              highlightColor: AppTheme.black900.withAlpha(AppTheme.alpha8Percent),
                            ),
                            containersColor: AppTheme.black900,
                            child: const Card(
                              margin: EdgeInsets.zero,
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    entity.type == AssetType.video
                        ? Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              ImageGalleryService().convertSecondsToString(entity.duration),
                              style: context.textTheme.labelSmall!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : const SizedBox(),
                    selectEntity == entity
                        ? Positioned.fill(
                            child: _buildSelectIcon(),
                          )
                        : const SizedBox(),
                  ],
                ),
              );
            },
            childCount: album.length,
          ),
        );
      },
    );
  }

  Widget _buildSelectIcon() {
    return Container(
      padding: HomePageSize.selectImageIconPadding,
      color: Colors.white.withOpacity(AppTheme.opacity46Percent),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Material(
          color: Colors.white,
          shape: const CircleBorder(
            side: BorderSide(
              color: Colors.white,
              width: HomePageSize.selectImageIconBorderWidth,
            ),
          ),
          child: PhosphorIcon(
            PhosphorIcons.checkCircle(PhosphorIconsStyle.fill),
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
