import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stepp_app/constants/home/feed/post_box_size.dart';
import 'package:stepp_app/constants/home/feed/post_box_ui_strings.dart';
import 'package:stepp_app/constants/home/home_page_size.dart';
import 'package:stepp_app/constants/home/home_page_ui_strings.dart';
import 'package:stepp_app/constants/sizes.dart';
import 'package:stepp_app/constants/ui_strings.dart';
import 'package:stepp_app/providers/home/add_stepp_provider.dart';
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
    return Consumer<AddSteppProvider>(
      builder: (context, addSteppProvider, child) => Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.horizontal(
            left: HomePageSize.addSteppPanelBorderRadius,
            right: HomePageSize.addSteppPanelBorderRadius,
          ),
          color: Colors.black.withOpacity(AppTheme.opacity80Percent),
        ),
        padding: HomePageSize.imageGalleryPanelPadding,
        child: Column(
          children: [
            Padding(
              padding: HomePageSize.addSteppPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: PostBoxSize.profilePosterRadius,
                        backgroundImage: const AssetImage(
                          'assets/images/avatar-3.png',
                        ),
                      ),
                      const SizedBox(
                        height: Sizes.spacing5,
                      ),
                      Text(
                        PostBoxUiStrings.mockPosterName,
                        style: context.textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: Sizes.spacing15,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Flexible(
                          child: SizedBox(
                            height: HomePageSize.whatIsSteppTextFiledHeight,
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
                        ),
                        const SizedBox(
                          width: Sizes.spacing10,
                        ),
                        Text(
                          HomePageUiStrings.currentAddSteppIndex(addSteppProvider.stepps.length),
                          style: context.textTheme.labelLarge!.copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
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
            const SizedBox(
              height: HomePageSize.addSteppInputGallerySpace,
            ),
            const Expanded(
              child: ImageGalleryGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
