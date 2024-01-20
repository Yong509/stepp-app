import 'package:flutter/material.dart';
import 'package:stepp_app/widgets/place/stepp_place_widget.dart';

class SteppPlace extends StatefulWidget {
  const SteppPlace({super.key});

  @override
  State<SteppPlace> createState() => _SteppPlaceState();
}

class _SteppPlaceState extends State<SteppPlace> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SteppPlaceWidget());
  }
}
