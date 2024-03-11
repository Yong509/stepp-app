import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stepp_app/constants/sizes.dart';
import 'package:stepp_app/providers/image_gallery_provider.dart';
import 'package:stepp_app/widgets/home/image_gallery_grid.dart';

class AddCoverSteppImageTab extends StatefulWidget {
  const AddCoverSteppImageTab({super.key});

  @override
  State<AddCoverSteppImageTab> createState() => _AddCoverSteppImageTabState();
}

class _AddCoverSteppImageTabState extends State<AddCoverSteppImageTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ImageGalleryProvider>(
      builder: (context, value, child) {
        return Padding(
          padding: Sizes.onlyTopPaddingMedium,
          child: Column(
            children: [
              const SizedBox(
                height: Sizes.spacing5,
              ),
              Expanded(
                child: ImageGalleryGrid(
                  isSelect: (entity) {
                    if (entity != null) {
                      value.currentSelect = entity;
                    }
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
