import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stepp_app/constants/home/home_page_size.dart';
import 'package:stepp_app/constants/ui_strings.dart';
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
      padding: HomePageSize.iamgeGalleryPanelPadding,
      child: Column(
        children: [
          Padding(
            padding: HomePageSize.addSteppPadding,
            child: CustomTextField(
              controller: TextEditingController(),
              leadingIcon: PhosphorIcon(
                PhosphorIcons.mapPin(
                  PhosphorIconsStyle.fill,
                ),
                color: Colors.white,
              ),
              hintText: UiStrings.whatIsThisStepHintText,
            ),
          ),
          const SizedBox(
            height: HomePageSize.addSteppInputGallerySpace,
          ),
          Text(
            UiStrings.addImgOrVDOPlaceholder,
            style: context.textTheme.bodyMedium!.copyWith(
              color: Colors.white,
            ),
          ),
          const Expanded(
            child: ImageGalleryGrid(),
          ),
        ],
      ),
    );
  }
}
