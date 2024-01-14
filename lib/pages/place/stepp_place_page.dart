import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stepp_app/constants/place/stepp_place_size.dart';
import 'package:stepp_app/providers/stepp_place_provider.dart';
import 'package:stepp_app/widgets/image_viewer.dart';
import 'package:stepp_app/widgets/place/sliding_stepp_place_panel.dart';
import 'package:stepp_app/widgets/place/stepp_place_app_bar.dart';
import 'package:stepp_app/widgets/place/stepp_place_content.dart';

class SteppPlace extends StatefulWidget {
  const SteppPlace({super.key});

  @override
  State<SteppPlace> createState() => _SteppPlaceState();
}

class _SteppPlaceState extends State<SteppPlace> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SteppPlaceProvider>(
      builder: (context, steppPlaceProvider, child) {
        return Scaffold(
          body: SlidingSteppPlacePanel(
            controller: steppPlaceProvider.slidingPanelController,
            openPanel: steppPlaceProvider.isPanelOpen,
            body: Stack(
              children: [
                const ImageViewer(),
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
                                  steppPlaceProvider.slidingPanelController
                                      .animatePanelToPosition(0.5);
                                }
                              },
                            ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
