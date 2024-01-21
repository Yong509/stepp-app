import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stepp_app/constants/place/stepp_place_size.dart';
import 'package:stepp_app/providers/stepp_place_provider.dart';
import 'package:stepp_app/styles/app_theme.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/widgets/place/stepp_place_content.dart';

class SlidingSteppPlacePanel extends StatefulWidget {
  final bool? openPanel;
  final Widget? body;
  final PanelController controller;
  final Function(bool) isOpen;
  const SlidingSteppPlacePanel(
      {super.key,
      this.openPanel = false,
      this.body,
      required this.controller,
      required this.isOpen});

  @override
  State<SlidingSteppPlacePanel> createState() => _SlidingSteppPlacePanelState();
}

class _SlidingSteppPlacePanelState extends State<SlidingSteppPlacePanel> {
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      minHeight: SteppPlaceSize.steppPlaceSlidingPanelMinHeight,
      maxHeight: SteppPlaceSize.steppPlaceSlidingPanelMaxHeight(
        context.deviceSize.height,
      ),
      controller: widget.controller,
      color: Colors.black.withOpacity(AppTheme.opacity80Percent),
      borderRadius: BorderRadius.circular(
        SteppPlaceSize.steppPlaceSlidingPanelBorderRadius,
      ),
      body: widget.body,
      isDraggable: true,
      onPanelSlide: (position) {
        if (position == 0.0) {
          context.read<SteppPlaceProvider>().setIsPanelOpen(false);
          widget.isOpen(false);
        } else {
          context.read<SteppPlaceProvider>().setIsPanelOpen(true);
          widget.isOpen(true);
        }
      },
      panelBuilder: (sc) {
        return const Padding(
          padding: SteppPlaceSize.steppPlaceSlidingPanelPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SteppPlaceContent(),
            ],
          ),
        );
      },
    );
  }
}
