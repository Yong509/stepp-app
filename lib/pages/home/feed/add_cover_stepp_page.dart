import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stepp_app/constants/home/feed/add_cover_stepp_page_sizes.dart';
import 'package:stepp_app/constants/home/feed/add_cover_stepp_page_ui_strings.dart';
import 'package:stepp_app/constants/place/stepp_place_ui_strings.dart';
import 'package:stepp_app/constants/sizes.dart';
import 'package:stepp_app/constants/ui_strings.dart';
import 'package:stepp_app/styles/app_theme.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/widgets/custom_button.dart';
import 'package:stepp_app/widgets/home/add/image_gallery_grid.dart';
import 'package:video_player/video_player.dart';

class AddCoverPage extends StatefulWidget {
  const AddCoverPage({super.key});

  @override
  State<AddCoverPage> createState() => _AddCoverPageState();
}

class _AddCoverPageState extends State<AddCoverPage> {
  VideoPlayerController? _videoPlayerController;
  AssetEntity? currentEntity;

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
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
      body: SafeArea(
        child: Container(
          margin: Sizes.onlyTopPaddingMedium,
          decoration: BoxDecoration(
            borderRadius: Sizes.topRoundBorderRadiusMedium,
            color: Colors.black.withOpacity(AppTheme.opacity85Percent),
          ),
          child: Column(
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
              Container(
                decoration: const BoxDecoration(
                  borderRadius: Sizes.allRoundBorderMedium,
                ),
                child: _buildCoverImage(),
              ),
              _buildBeforeSelectImage()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBeforeSelectImage() {
    return Expanded(
      child: Padding(
        padding: Sizes.onlyTopPaddingMedium,
        child: Column(
          children: [
            Text(
              UiStrings.addImgOrVDOPlaceholder,
              style: context.textTheme.bodyMedium!.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: Sizes.spacing5,
            ),
            Expanded(
              child: ImageGalleryGrid(
                isSelect: (entity) {
                  if (entity != null) {
                    setState(() {
                      currentEntity = entity;
                    });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCoverImage() {
    if (currentEntity != null) {
      switch (currentEntity!.type) {
        case AssetType.image:
          return ClipRRect(
            borderRadius: Sizes.allRoundBorderMedium,
            child: Container(
              width: double.infinity,
              height: AddCoverSteppPageSizes.coverImageSizes(context.deviceSize.height),
              color: AppTheme.black900,
              child: AssetEntityImage(
                currentEntity!,
                isOriginal: true,
                filterQuality: FilterQuality.high,
                fit: BoxFit.fitHeight,
              ),
            ),
          );
        case AssetType.video:
          return FutureBuilder(
            future: _initializeAndPlayVideo(currentEntity!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  height: AddCoverSteppPageSizes.coverImageSizes(context.deviceSize.height),
                  decoration: const BoxDecoration(
                    color: AppTheme.black900,
                    borderRadius: Sizes.allRoundBorderMedium,
                  ),
                  child: Center(
                    child: AspectRatio(
                      key: ValueKey(currentEntity!.id),
                      aspectRatio: _videoPlayerController!.value.aspectRatio,
                      child: VideoPlayer(_videoPlayerController!),
                    ),
                  ),
                );
              }
              return ClipRRect(
                borderRadius: Sizes.allRoundBorderMedium,
                child: Skeletonizer(
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
                ),
              );
            },
          );
        default:
          return Container(
            height: AddCoverSteppPageSizes.coverImageSizes(context.deviceSize.height),
            color: AppTheme.black900,
          );
      }
    }
    return Container(
      height: AddCoverSteppPageSizes.coverImageSizes(context.deviceSize.height),
      decoration: const BoxDecoration(
        borderRadius: Sizes.allRoundBorderMedium,
        color: AppTheme.black900,
      ),
    );
  }
}
