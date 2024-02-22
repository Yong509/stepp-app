import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stepp_app/constants/home/home_page_size.dart';
import 'package:stepp_app/styles/app_theme.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/widgets/custom_text_field.dart';
import 'package:stepp_app/widgets/home/add/image_gallery_grid.dart';

class ImageGalleryPanel extends StatefulWidget {
  const ImageGalleryPanel({super.key});

  @override
  State<ImageGalleryPanel> createState() => _ImageGalleryPanelState();
}

class _ImageGalleryPanelState extends State<ImageGalleryPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.horizontal(
          left: HomePageSize.addSteppPanelBorderRadius,
          right: HomePageSize.addSteppPanelBorderRadius,
        ),
        color: Colors.black.withOpacity(AppTheme.opacity80Percent),
      ),
      padding: EdgeInsets.only(top: 45),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CustomTextField(
              controller: TextEditingController(),
              leadingIcon: PhosphorIcon(
                PhosphorIcons.mapPin(
                  PhosphorIconsStyle.fill,
                ),
                color: Colors.white,
              ),
              hintText: "What is this stepp ... ?",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Add a IMG/VDO from albums",
            style: context.textTheme.bodyMedium!.copyWith(
              color: Colors.white,
            ),
          ),
          Expanded(child: ImageGalleryGrid()),
        ],
      ),
    );
  }
}
