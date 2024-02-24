import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stepp_app/providers/home/add_stepp_provider.dart';
import 'package:stepp_app/widgets/home/add/image_gallery_panel.dart';

class AddSteppPage extends StatefulWidget {
  const AddSteppPage({super.key});

  @override
  State<AddSteppPage> createState() => _AddSteppPageState();
}

class _AddSteppPageState extends State<AddSteppPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AddSteppProvider>(
        builder: (context, value, child) {
          return SlidingUpPanel(
            color: Colors.transparent,
            panel: const ImageGalleryPanel(),
            body: Stack(
              children: [
                value.currentEntity != null
                    ? Positioned.fill(
                        child: Image.file(
                        value.currentEntity!,
                        fit: BoxFit.cover,
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          );
        },
      ),
    );
  }
}
