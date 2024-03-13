import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stepp_app/constants/home/add/add_cover_stepp_page_sizes.dart';
import 'package:stepp_app/constants/home/add/add_cover_stepp_page_ui_strings.dart';
import 'package:stepp_app/constants/stepp_place/stepp_place_ui_strings.dart';
import 'package:stepp_app/constants/routes.dart';
import 'package:stepp_app/constants/sizes.dart';
import 'package:stepp_app/providers/home/add_stepp_place_provider.dart';
import 'package:stepp_app/providers/image_gallery_provider.dart';
import 'package:stepp_app/styles/app_theme.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/widgets/custom_button.dart';
import 'package:stepp_app/widgets/custom_opacity_tile.dart';
import 'package:stepp_app/widgets/home/add_stepp_place/add_cover_stepp_tab.dart';
import 'package:stepp_app/widgets/home/add_stepp_place/image_thumbnail_cover.dart';
import 'package:video_player/video_player.dart';

class AddCoverPage extends StatefulWidget {
  const AddCoverPage({super.key});

  @override
  State<AddCoverPage> createState() => _AddCoverPageState();
}

class _AddCoverPageState extends State<AddCoverPage> {
  VideoPlayerController? _videoPlayerController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _disposeVideoController();
    super.dispose();
  }

  void _disposeVideoController() {
    _videoPlayerController?.dispose();
    _videoPlayerController = null;
  }

  Future<void> _initializeAndPlayVideo(AssetEntity videoFile) async {
    _disposeVideoController();
    final file = await videoFile.file;
    _videoPlayerController = VideoPlayerController.file(file!);
    await _videoPlayerController!.initialize();
    await _videoPlayerController!.play();
    await _videoPlayerController!.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddSteppPlaceProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(
                  RouteNames.addEachSteppPage,
                  arguments: {
                    RouteParameters.addSteppProvider: Provider.of<AddSteppPlaceProvider>(
                      context,
                      listen: false,
                    ),
                    RouteParameters.currentAddEachStepp: value.currentAddStepp!.stepps!.last
                  },
                );
              },
              icon: const Icon(
                Icons.chevron_left,
              ),
            ),
            centerTitle: true,
            title: Text(
              AddCoverSteppUiStrings.pageTitle,
              style: context.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              Padding(
                padding: Sizes.onlyRightPaddingMedium,
                child: CustomButton(
                  backgroundColor: Colors.black.withOpacity(AppTheme.opacity85Percent),
                  child: Text(
                    AddCoverSteppUiStrings.preview,
                    style: context.textTheme.bodySmall!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          body: Container(
            margin: Sizes.onlyTopPaddingMedium,
            decoration: BoxDecoration(
              borderRadius: Sizes.topRoundBorderRadiusMedium,
              color: Colors.black.withOpacity(AppTheme.opacity85Percent),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: Sizes.allSidePaddingMedium,
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                        radius: Sizes.profilePictureRadiusSmall,
                      ),
                      const SizedBox(
                        width: Sizes.spacing15,
                      ),
                      Text(
                        SteppPlaceUIStrings.steppPlaceMockProfileName,
                        style: context.textTheme.bodyMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: Sizes.allRoundBorderMedium,
                    ),
                    child: _buildCoverWidget(),
                  ),
                ),
                const AddCoverSteppTab(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCoverWidget() {
    return Consumer<AddSteppPlaceProvider>(
      builder: (context, value, child) {
        return Stack(
          children: [
            _buildAssetWidget(),
            Positioned.fill(
              bottom: AddCoverSteppPageSizes.titleSteppCoverWidgetBottomPosition,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomOpacityTile(
                  outsitePadding: Sizes.horizontalPaddingHuge,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PhosphorIcon(
                        PhosphorIcons.mapPin(
                          PhosphorIconsStyle.fill,
                        ),
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: Sizes.spacing15,
                      ),
                      Text(
                        value.currentAddStepp!.steppTitle,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget _buildAssetWidget() {
    final currentEntity = context.watch<ImageGalleryProvider>().currentSelect;
    if (currentEntity != null) {
      switch (currentEntity.type) {
        case AssetType.image:
          _disposeVideoController();
          return ImageThumbnailCover(
            child: AssetEntityImage(
              currentEntity,
              isOriginal: true,
              filterQuality: FilterQuality.high,
              fit: BoxFit.fitHeight,
            ),
          );
        case AssetType.video:
          return FutureBuilder(
            future: _initializeAndPlayVideo(currentEntity),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ImageThumbnailCover(
                  child: Center(
                    child: AspectRatio(
                      key: ValueKey(currentEntity.id),
                      aspectRatio: _videoPlayerController!.value.aspectRatio,
                      child: VideoPlayer(_videoPlayerController!),
                    ),
                  ),
                );
              }
              return Skeletonizer(
                effect: ShimmerEffect(
                  baseColor: AppTheme.black900,
                  highlightColor: AppTheme.black900.withAlpha(AppTheme.alpha8Percent),
                ),
                containersColor: AppTheme.black900,
                child: SizedBox(
                  width: double.infinity,
                  height: AddCoverSteppPageSizes.coverImageSizes(context.deviceSize.height),
                  child: const Card(
                    margin: EdgeInsets.zero,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              );
            },
          );
        default:
          return const ImageThumbnailCover();
      }
    }
    return const ImageThumbnailCover();
  }
}
