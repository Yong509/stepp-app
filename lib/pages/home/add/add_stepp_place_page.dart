import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stepp_app/providers/home/add_stepp_provider.dart';

class AddSteppPlacePage extends StatefulWidget {
  const AddSteppPlacePage({super.key});

  @override
  State<AddSteppPlacePage> createState() => _AddSteppPlacePageState();
}

class _AddSteppPlacePageState extends State<AddSteppPlacePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AddSteppProvider>(
      builder: (context, value, child) {
        return Column(
          children: [
            TextFormField(),
          ],
        );
      },
    );
  }
}
