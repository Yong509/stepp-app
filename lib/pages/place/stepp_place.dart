import 'package:flutter/material.dart';
import 'package:stepp_app/constants/place/stepp_place_size.dart';
import 'package:stepp_app/widgets/image_viewer.dart';
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
    return const Stack(
      children: [
        ImageViewer(),
        SafeArea(
          minimum: SteppPlaceSize.steppPlacePagePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SteppPlaceAppBar(),
              SteppPlaceContent()
            ],
          )
        ),
      ],
    );
  }
}
