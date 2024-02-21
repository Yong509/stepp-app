import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stepp_app/constants/routes.dart';
import 'package:stepp_app/constants/ui_strings.dart';
import 'package:stepp_app/providers/home/add_stepp_provider.dart';
import 'package:stepp_app/widgets/custom_text_field.dart';

class AddSteppPlaceTab extends StatefulWidget {
  const AddSteppPlaceTab({super.key});

  @override
  State<AddSteppPlaceTab> createState() => _AddSteppPlaceTabState();
}

class _AddSteppPlaceTabState extends State<AddSteppPlaceTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AddSteppProvider>(
      builder: (context, value, child) {
        return Column(
          children: [
            CustomTextField(
              controller: TextEditingController(),
              leadingIcon: PhosphorIcon(
                PhosphorIcons.mapPin(
                  PhosphorIconsStyle.fill,
                ),
                color: Colors.white,
              ),
              hintText: UiStrings.wherehintText,
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, RouteNames.previewAddStepp),
              child: const Text("route to preview stepp page"),
            )
          ],
        );
      },
    );
  }
}
