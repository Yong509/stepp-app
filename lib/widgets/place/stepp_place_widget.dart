import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stepp_app/constants/place/stepp_place_size.dart';
import 'package:stepp_app/data_models/stepp_place/stepp_place_model.dart';
import 'package:stepp_app/providers/stepp_place_provider.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/widgets/image_viewer.dart';
import 'package:stepp_app/widgets/place/sliding_stepp_place_panel.dart';
import 'package:stepp_app/widgets/place/stepp_place_app_bar.dart';
import 'package:stepp_app/widgets/place/stepp_place_content.dart';

class SteppPlaceWidget extends StatefulWidget {
  const SteppPlaceWidget({super.key});

  @override
  State<SteppPlaceWidget> createState() => _SteppPlaceWidgetState();
}

class _SteppPlaceWidgetState extends State<SteppPlaceWidget>
    with SingleTickerProviderStateMixin {
  late List<SteppPlaceModel> mockData;
  int currentPage = 0;
  late PageController pageController;
  late Animation<double> animation;
  late AnimationController animateController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    mockData = SteppPlaceModel.mockSteppPlace;
    imageAnimation();
  }

  void imageAnimation() {
    animateController = AnimationController(
      vsync: this,
      duration: SteppPlaceSize.perImageDuration,
    );
    animation = Tween(
      begin: SteppPlaceSize.tweenBegin,
      end: SteppPlaceSize.tweenEnd,
    ).animate(animateController);

    animateController.forward();
    animationController();
  }

  void animationController() {
    animateController.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.completed:
          if (currentPage < mockData.length - 1) {
            pageController.animateToPage(
              currentPage + 1,
              duration: const Duration(
                milliseconds: SteppPlaceSize.durationPageTransition,
              ),
              curve: Curves.easeIn,
            );
          } else {
            pageController.animateToPage(
              SteppPlaceSize.steppPlaceInitialPage,
              duration: const Duration(
                milliseconds: SteppPlaceSize.durationPageTransition,
              ),
              curve: Curves.easeIn,
            );
          }
          animateController.value = 0;
          animateController.forward();
          break;
        default:
      }
    });
    pageControllerListener();
  }

  void pageControllerListener() {
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      animateController.value = 0;
      animateController.forward();
    });
  }

  void onImageTapDown(TapDownDetails details) {
    double tapPosition = details.globalPosition.dx;
    if (tapPosition > SteppPlaceSize.divideHalfScreen(context.deviceSize.width)) {
      pageController.nextPage(
        duration: const Duration(
          milliseconds: SteppPlaceSize.durationPageTransition,
        ),
        curve: Curves.easeIn,
      );
    } else {
      pageController.previousPage(
        duration: const Duration(
          milliseconds: SteppPlaceSize.durationPageTransition,
        ),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SteppPlaceProvider>(
      builder: (context, steppPlaceProvider, child) {
        return SlidingSteppPlacePanel(
          controller: steppPlaceProvider.slidingPanelController,
          openPanel: steppPlaceProvider.isPanelOpen,
          isOpen: (isOpen) {
            isOpen ? animateController.stop() : animateController.forward();
          },
          body: Stack(
            children: [
              PageView.builder(
                controller: pageController,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPressDown: (details) => animateController.stop(),
                    onLongPressUp: () => animateController.forward(),
                    onTapDown: (details) => onImageTapDown(details),
                    child: ImageViewer(
                      imagePath: mockData[index % mockData.length].imagePath,
                    ),
                  );
                },
              ),
              SafeArea(
                minimum: SteppPlaceSize.steppPlacePagePadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SteppPlaceAppBar(),
                    steppPlaceProvider.isPanelOpen
                        ? const SizedBox()
                        : SteppPlaceContent(
                            isOnTapComment: (isTap) {
                              if (isTap) {
                                steppPlaceProvider.setIsPanelOpen(isTap);
                                steppPlaceProvider.slidingPanelController
                                    .animatePanelToPosition(
                                  SteppPlaceSize
                                      .steppPlaceSlidingPanelHalfHeight,
                                );
                              }
                            },
                          ),
                  ],
                ),
              ),
              Positioned(
                bottom: 30.0,
                child: SizedBox(
                  width: context.deviceSize.width,
                  child: AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      return SizedBox(
                        width: context.deviceSize.width,
                        child: LinearProgressIndicator(
                          value: animation.value,
                          minHeight: SteppPlaceSize.linearIndicatorMinHeight,
                          backgroundColor: Colors.transparent,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
