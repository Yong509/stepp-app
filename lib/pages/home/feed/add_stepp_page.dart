import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stepp_app/providers/home/add_stepp_provider.dart';
import 'package:stepp_app/styles/app_theme.dart';
import 'package:stepp_app/widgets/home/add/image_gallery_panel.dart';
import 'package:video_player/video_player.dart';

class AddSteppPage extends StatefulWidget {
  const AddSteppPage({super.key});

  @override
  State<AddSteppPage> createState() => _AddSteppPageState();
}

class _AddSteppPageState extends State<AddSteppPage> {
  VideoPlayerController? _videoPlayerController;

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
      body: SlidingUpPanel(
        color: Colors.transparent,
        panel: const ImageGalleryPanel(),
        body: Stack(
          children: [
            _buildCover(),
          ],
        ),
      ),
    );
  }

  Widget _buildCover() {
    return Consumer<AddSteppProvider>(
      builder: (context, value, child) {
        if (value.currentEntity != null) {
          switch (value.currentEntity!.type) {
            case AssetType.image:
              _disposeVideoController();
              return Container(
                color: Colors.black,
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
                      color: Colors.black,
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
              return const SizedBox();
          }
        }
        return const SizedBox();
      },
    );
  }
}
