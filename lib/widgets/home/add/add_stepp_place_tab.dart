import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stepp_app/constants/home/feed/post_box_size.dart';
import 'package:stepp_app/constants/home/feed/post_box_ui_strings.dart';
import 'package:stepp_app/constants/home/home_page_size.dart';
import 'package:stepp_app/constants/home/home_page_ui_strings.dart';
import 'package:stepp_app/constants/mock_data.dart';
import 'package:stepp_app/constants/routes.dart';
import 'package:stepp_app/constants/sizes.dart';
import 'package:stepp_app/constants/ui_strings.dart';
import 'package:stepp_app/data_models/stepp_place/add_stepp_place_model.dart';
import 'package:stepp_app/providers/home/add_stepp_place_provider.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/widgets/custom_button.dart';
import 'package:stepp_app/widgets/custom_text_field.dart';

class AddSteppPlaceTab extends StatefulWidget {
  const AddSteppPlaceTab({super.key});

  @override
  State<AddSteppPlaceTab> createState() => _AddSteppPlaceTabState();
}

class _AddSteppPlaceTabState extends State<AddSteppPlaceTab> {
  bool isSelectPlace = false;
  bool titleError = false;
  final titleAndDescriptionFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AddSteppPlaceProvider>(
      builder: (context, value, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: Sizes.spacing15,
                  ),
                  isSelectPlace ? _buildCreatePostTitle() : _buildSearchPlace(),
                ],
              ),
            ),
            if (isSelectPlace)
              Flexible(
                child: CustomButton(
                  onTap: () {
                    if (value.titleTextController.text != UiStrings.emptyLabel) {
                      value.currentAddStepp = AddSteppPlaceModel(
                        steppTitle: value.titleTextController.text,
                        description: value.descriptionTextController.text,
                        place: value.selectPlace,
                        stepps: [
                          EachStepp(),
                        ],
                      );
                      Navigator.pushNamed(
                        context,
                        RouteNames.addEachSteppPage,
                        arguments: {
                          RouteParameters.addSteppProvider: Provider.of<AddSteppPlaceProvider>(context, listen: false),
                          RouteParameters.currentAddEachStepp: value.currentAddStepp!.stepps!.last
                        },
                      );
                    } else {
                      setState(() {
                        titleError = true;
                      });
                    }
                  },
                  isOpacity: false,
                  backgroundColor: Colors.black,
                  child: Text(
                    HomePageUiStrings.startSteppTextButton,
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildCreatePostTitle() {
    return Consumer<AddSteppPlaceProvider>(
      builder: (context, value, child) {
        return Expanded(
          child: Form(
            key: titleAndDescriptionFormKey,
            child: Column(
              children: [
                ListTile(
                  minVerticalPadding: Sizes.spacing5,
                  dense: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: Sizes.allRoundBorderMedium,
                    side: BorderSide(
                      color: titleError ? Colors.red : Colors.black,
                    ),
                  ),
                  contentPadding: EdgeInsets.zero,
                  tileColor: Colors.black,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: HomePageSize.addSteppTitleInputHeight,
                        child: CustomTextField(
                          leadingIcon: PhosphorIcon(
                            PhosphorIcons.mapPin(
                              PhosphorIconsStyle.fill,
                            ),
                            color: Colors.white,
                          ),
                          controller: value.titleTextController,
                          hintText: UiStrings.wherehintText,
                          removePadding: true,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() {
                          isSelectPlace = false;
                          titleError = false;
                        }),
                        child: Padding(
                          padding: Sizes.onlyLeftPaddingHuge,
                          child: Text(
                            HomePageUiStrings.selectPlacePrompt(value.selectPlace?.placeTitle ?? ""),
                            style: context.textTheme.bodySmall!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: Sizes.spacing15,
                ),
                Expanded(
                  child: CustomTextField(
                    backgroundColor: Colors.transparent,
                    controller: value.descriptionTextController,
                    hintText: HomePageUiStrings.descriptionHintText,
                    maxLine: HomePageSize.addSteppDescriptionMinLine,
                    hintTextStyle: context.textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchPlace() {
    return Consumer<AddSteppPlaceProvider>(
      builder: (context, value, child) {
        return Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
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
              Flexible(
                child: ListView(
                  controller: value.panelScrollController,
                  padding: EdgeInsets.zero,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: MockData.mockPlace
                      .map(
                        (place) => ListTile(
                          onTap: () {
                            value.selectPlace = place;
                            setState(() {
                              isSelectPlace = true;
                            });
                          },
                          title: Text(
                            place.placeTitle,
                            style: context.textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                HomePageUiStrings.distanceWithUnit(place.distance),
                                style: context.textTheme.bodyMedium!.copyWith(
                                  color: Colors.white54,
                                ),
                              ),
                              const SizedBox(
                                width: Sizes.spacing10,
                              ),
                              Text(
                                HomePageUiStrings.totalSteppWithUnit(place.steppTotal),
                                style: context.textTheme.bodyMedium!.copyWith(
                                  color: Colors.white54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
