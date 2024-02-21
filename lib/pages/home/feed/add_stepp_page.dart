import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stepp_app/providers/image_gallery_provider.dart';
import 'package:stepp_app/widgets/home/add/image_gallery_grid.dart';

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
    return Consumer<ImageGalleryProvider>(
      builder: (context, imageProvider, child) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 50),
            color: Colors.black,
            height: 550,
            width: double.infinity,
            child: ImageGalleryGrid(),
          ),
        );
      },
    );
  }
}
