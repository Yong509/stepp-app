import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stepp_app/constants/home/home_page_size.dart';
import 'package:stepp_app/constants/home/home_page_ui_strings.dart';
import 'package:stepp_app/constants/routes.dart';
import 'package:stepp_app/constants/sizes.dart';
import 'package:stepp_app/constants/ui_strings.dart';
import 'package:stepp_app/data_models/stepp_place/add_stepp_place_model.dart';
import 'package:stepp_app/providers/home/add_stepp_place_provider.dart';
import 'package:stepp_app/styles/app_theme.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/widgets/custom_button.dart';
import 'package:stepp_app/widgets/default_dialog.dart';
import 'package:stepp_app/widgets/home/add_stepp_place/each_stepp_panel.dart';
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

  Future<void> pageNavigate() async {
    final value = context.read<AddSteppPlaceProvider>().currentAddStepp;
    if (widget.eachStepp.image == null) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        RouteNames.homePage,
        (route) => false,
      );
    } else if (value!.stepps!.indexOf(widget.eachStepp) == 0) {
      await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => _buildDialogBeforeQuitPage(),
      );
    } else {
      Navigator.of(context).pushReplacementNamed(
        RouteNames.addEachSteppPage,
        arguments: {
          RouteParameters.addSteppProvider: Provider.of<AddSteppPlaceProvider>(
            context,
            listen: false,
          ),
          RouteParameters.currentAddEachStepp: value.stepps![value.stepps!.indexOf(widget.eachStepp) - 1]
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Consumer<AddSteppPlaceProvider>(
          builder: (context, value, child) {
            return SlidingUpPanel(
              color: Colors.transparent,
              panel: EachSteppPanel(
                eachStepp: widget.eachStepp,
                selectEntity: (entity) {
                  value.setEntityCurrentEachStepp(widget.eachStepp.id!, entity);
                },
                handleAddMoreStepp: () async {
                  if (widget.eachStepp.image != null) {
                    await _videoPlayerController?.dispose();
                  }
                },
              ),
              body: Stack(
                children: [
                  _buildCover(),
                  SafeArea(
                    child: _buildAppBar(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCover() {
    return Consumer<AddSteppPlaceProvider>(
      builder: (context, value, child) {
        if (value.currentAddStepp?.stepps?.firstWhere((element) => element.id == widget.eachStepp.id).image != null) {
          switch (widget.eachStepp.image!.type) {
            case AssetType.image:
              _disposeVideoController();
              return Container(
                color: AppTheme.black900,
                child: Center(
                  child: AssetEntityImage(
                    widget.eachStepp.image!,
                    isOriginal: true,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              );
            case AssetType.video:
              return FutureBuilder(
                future: _initializeAndPlayVideo(widget.eachStepp.image!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                      color: AppTheme.black900,
                      child: Center(
                        child: AspectRatio(
                          key: ValueKey(widget.eachStepp.image!.id),
                          aspectRatio: _videoPlayerController?.value.aspectRatio ?? 0,
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

  Widget _buildAppBar() {
    return Consumer<AddSteppPlaceProvider>(
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () async {
                    await pageNavigate();
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
            Padding(
              padding: Sizes.onlyRightPaddingMediumLarge,
              child: CustomButton(
                onTap: () {
                  _disposeVideoController();
                  Navigator.of(context).pushReplacementNamed(
                    RouteNames.addCoverPage,
                    arguments: {
                      RouteParameters.addSteppProvider: Provider.of<AddSteppPlaceProvider>(
                        context,
                        listen: false,
                      )
                    },
                  );
                },
                padding: Sizes.allSidePaddingMediumSmall,
                backgroundColor: Colors.black.withOpacity(AppTheme.opacity80Percent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PhosphorIcon(
                      PhosphorIcons.check(),
                      color: Colors.white,
                      size: Sizes.iconSizeSmall,
                    ),
                    const SizedBox(
                      width: Sizes.spacing10,
                    ),
                    Text(
                      UiStrings.commonDone,
                      style: context.textTheme.labelLarge!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget _buildDialogBeforeQuitPage() {
    return DefaultDialog(
      outsitePadding: HomePageSize.quitEachSteppDialogOutSitePadding(context.deviceSize.width),
      insetPadding: HomePageSize.quitEachSteppDialogInsetPadding,
      body: [
        Text(
          HomePageUiStrings.quitEditSteppDialogTitle,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium!.copyWith(color: Colors.white),
        ),
        const SizedBox(
          height: Sizes.spacing10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Text(
            HomePageUiStrings.stayEditSteppPage,
            style: context.textTheme.bodySmall!.copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(
          height: Sizes.spacing5,
        ),
        GestureDetector(
          onTap: () async {
            Navigator.of(context).pushNamedAndRemoveUntil(
              RouteNames.homePage,
              (route) => false,
            );
          },
          child: Text(
            HomePageUiStrings.quitEditSteppPage,
            style: context.textTheme.bodySmall!.copyWith(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
