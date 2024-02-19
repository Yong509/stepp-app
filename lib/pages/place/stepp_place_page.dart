import 'package:flutter/material.dart';
import 'package:stepp_app/widgets/place/stepp_place_widget.dart';

class SteppPlacePage extends StatefulWidget {
  const SteppPlacePage({super.key});

  @override
  State<SteppPlacePage> createState() => _SteppPlacePageState();
}

class _SteppPlacePageState extends State<SteppPlacePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SteppPlaceWidget(),
    );
  }
}
