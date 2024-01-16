import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';

class ImageViewer extends StatefulWidget {
  final String imagePath;
  const ImageViewer({super.key, required this.imagePath});

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "",
      child: Stack(
        children: [
          EasyImageView(
            imageProvider: AssetImage(widget.imagePath),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.center,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
