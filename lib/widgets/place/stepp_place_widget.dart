import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stepp_app/constants/place/stepp_place_size.dart';
import 'package:stepp_app/data_models/stepp_place/stepp_place_model.dart';
import 'package:stepp_app/providers/stepp_place_provider.dart';
import 'package:stepp_app/widgets/image_viewer.dart';
import 'package:stepp_app/widgets/place/sliding_stepp_place_panel.dart';
import 'package:stepp_app/widgets/place/stepp_place_app_bar.dart';
import 'package:stepp_app/widgets/place/stepp_place_content.dart';

class SteppPlaceWidget extends StatefulWidget {
  final SteppPlaceModel steppPlace;
  const SteppPlaceWidget({super.key, required this.steppPlace});

  @override
  State<SteppPlaceWidget> createState() => _SteppPlaceWidgetState();
}

class _SteppPlaceWidgetState extends State<SteppPlaceWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SteppPlaceProvider>(
      builder: (context, steppPlaceProvider, child) {
        return SlidingSteppPlacePanel(
          controller: steppPlaceProvider.slidingPanelController,
          openPanel: steppPlaceProvider.isPanelOpen,
          body: Stack(
            children: [
              ImageViewer(
                imagePath: widget.steppPlace.imagePath,
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
                            isOnOpenComment: (isOpen) {
                              if (isOpen) {
                                steppPlaceProvider.setIsPanelOpen(isOpen);
                                steppPlaceProvider.slidingPanelController.animatePanelToPosition(
                                  SteppPlaceSize.steppPlaceSlidingPanelHalfHeight,
                                );
                              }
                            },
                          ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
