import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stepp_app/constants/home/home_page_ui_strings.dart';
import 'package:stepp_app/constants/sizes.dart';
import 'package:stepp_app/constants/ui_strings.dart';
import 'package:stepp_app/data_models/stepp_place/add_stepp_place_model.dart';
import 'package:stepp_app/providers/home/add_stepp_place_provider.dart';
import 'package:stepp_app/styles/app_theme.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/widgets/home/add/each_stepp_panel.dart';
import 'package:video_player/video_player.dart';

class AddEachSteppPage extends StatefulWidget {
  const AddEachSteppPage({
    Key? key,
    required this.eachStepp,
  }) : super(key: key);

  final EachStepp eachStepp;

  @override
  State<AddEachSteppPage> createState() => _AddEachSteppPageState();
}

class _AddEachSteppPageState extends State<AddEachSteppPage> {
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
    return Scaffold(
      body: Consumer<AddSteppPlaceProvider>(
        builder: (context, value, child) {
          return SlidingUpPanel(
            color: Colors.transparent,
            panel: EachSteppPanel(
              eachStepp: widget.eachStepp,
            ),
            body: Stack(
              children: [
                _buildCover(),
                SafeArea(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.chevron_left_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: Sizes.allSidePaddingMediumSmall,
                        padding: Sizes.allSidePaddingMedium,
                        decoration: BoxDecoration(
                          borderRadius: Sizes.allRoundBorderSmall,
                          color: Colors.black.withOpacity(AppTheme.opacity80Percent),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: PhosphorIcon(
                                PhosphorIcons.mapPin(
                                  PhosphorIconsStyle.fill,
                                ),
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: Sizes.spacing10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  value.currentAddStepp?.steppTitle ?? UiStrings.emptyLabel,
                                  style: context.textTheme.bodyLarge!.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      HomePageUiStrings.selectPlacePrompt(
                                        value.currentAddStepp?.place?.placeTitle ?? UiStrings.emptyLabel,
                                      ),
                                      style: context.textTheme.bodySmall!.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCover() {
    return Consumer<AddSteppPlaceProvider>(
      builder: (context, value, child) {
        if (value.currentEntity != null || widget.eachStepp.image != null) {
          switch (value.currentEntity!.type) {
            case AssetType.image:
              _disposeVideoController();
              return Container(
                color: AppTheme.black900,
                child: Center(
                  child: AssetEntityImage(
                    value.currentEntity!,
                    isOriginal: true,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              );
            case AssetType.video:
              return FutureBuilder(
                future: _initializeAndPlayVideo(value.currentEntity!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                      color: AppTheme.black900,
                      child: Center(
                        child: AspectRatio(
                          key: ValueKey(value.currentEntity!.id),
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
                    child: const Card(
                      margin: EdgeInsets.zero,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  );
                },
              );
            default:
              return Container(
                color: AppTheme.black900,
              );
          }
        }
        return Container(
          color: AppTheme.black900,
        );
      },
    );
  }
}
