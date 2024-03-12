import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import 'package:provider/provider.dart';
import 'package:stepp_app/constants/home/feed/post_box_size.dart';
import 'package:stepp_app/constants/home/feed/post_box_ui_strings.dart';
import 'package:stepp_app/constants/home/home_page_size.dart';
import 'package:stepp_app/constants/home/home_page_ui_strings.dart';
import 'package:stepp_app/constants/routes.dart';
import 'package:stepp_app/constants/sizes.dart';
import 'package:stepp_app/constants/ui_strings.dart';
import 'package:stepp_app/data_models/stepp_place/add_stepp_place_model.dart';
import 'package:stepp_app/providers/home/add_stepp_place_provider.dart';
import 'package:stepp_app/providers/image_gallery_provider.dart';
import 'package:stepp_app/styles/app_theme.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/widgets/custom_button.dart';
import 'package:stepp_app/widgets/custom_text_field.dart';
import 'package:stepp_app/widgets/home/image_gallery_grid.dart';

class EachSteppPanel extends StatefulWidget {
  const EachSteppPanel({
    Key? key,
    required this.eachStepp,
    this.selectEntity,
    required this.handleAddMoreStepp,
  }) : super(key: key);

  final EachStepp eachStepp;
  final Function(AssetEntity entity)? selectEntity;
  final VoidCallback handleAddMoreStepp;

  @override
  State<EachSteppPanel> createState() => _EachSteppPanelState();
}

class _EachSteppPanelState extends State<EachSteppPanel> {
  AssetEntity? selectEntity;
  TextEditingController titleTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();
  bool isClickEditCaption = false;

  @override
  void initState() {
    super.initState();
    titleTextController.text = widget.eachStepp.title ?? UiStrings.emptyLabel;
    descriptionTextController.text = widget.eachStepp.description ?? UiStrings.emptyLabel;
  }

  void toggleEditCaption() {
    setState(() {
      isClickEditCaption = !isClickEditCaption;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddSteppPlaceProvider>(
      builder: (context, addSteppProvider, child) => Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: HomePageSize.addSteppPanelBorderRadius,
            topRight: HomePageSize.addSteppPanelBorderRadius,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: SizedBox(
                                height: HomePageSize.whatIsSteppTextFiledHeight,
                                child: CustomTextField(
                                  removePadding: true,
                                  controller: titleTextController,
                                  backgroundColor: Colors.black,
                                  hintText: HomePageUiStrings.whatIsThisSteppHintText(
                                    addSteppProvider.currentAddStepp?.stepps?.indexOf(widget.eachStepp) ?? 0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: Sizes.spacing10,
                            ),
                            Text(
                              HomePageUiStrings.currentAddSteppIndex(addSteppProvider.currentAddStepp?.stepps?.length ?? 0),
                              style: context.textTheme.labelLarge!.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () => toggleEditCaption(),
                          child: Text(
                            isClickEditCaption ? HomePageUiStrings.addOrEditImage : HomePageUiStrings.addOrEditDescription,
                            style: context.textTheme.bodySmall!.copyWith(
                              color: Colors.white,
                            ),
                          ),
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
            if (!isClickEditCaption) ...[
              _buildBeforeSelectImage(),
            ] else ...[
              _buildAfterSelectImage(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildBeforeSelectImage() {
    return Expanded(
      child: Column(
        children: [
          Text(
            UiStrings.addImgOrVDOPlaceholder,
            style: context.textTheme.bodyMedium!.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: HomePageSize.addSteppInputGallerySpace,
          ),
          Expanded(
            child: ImageGalleryGrid(
              isSelect: (entity) {
                if (entity != null) {
                  setState(() {
                    selectEntity = entity;
                  });
                  toggleEditCaption();
                }
                widget.selectEntity!(entity!);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAfterSelectImage() {
    return Consumer<AddSteppPlaceProvider>(
      builder: (context, value, child) {
        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: Sizes.horizontalPaddingHuge,
                child: CustomTextField(
                  backgroundColor: Colors.transparent,
                  controller: descriptionTextController,
                  hintText: HomePageUiStrings.descriptionHintText,
                  maxLine: HomePageSize.addSteppDescriptionMinLine,
                  hintTextStyle: context.textTheme.bodySmall,
                ),
              ),
              Padding(
                padding: HomePageSize.addSteppEachSteppPanelPadding,
                child: Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: PhosphorIcon(
                            PhosphorIcons.trash(),
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            toggleEditCaption();
                            setState(() {
                              selectEntity = null;
                            });
                          },
                          child: AssetEntityImage(
                            width: HomePageSize.addSteppEachSteppAssetImageSize,
                            height: HomePageSize.addSteppEachSteppAssetImageSize,
                            context.read<ImageGalleryProvider>().assetEntity!.first.first,
                            fit: BoxFit.contain,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      child: Center(
                        child: CustomButton(
                          onTap: () {
                            widget.handleAddMoreStepp.call();
                            value.setEachStepp(
                              EachStepp(
                                image: selectEntity,
                                description: titleTextController.text,
                                title: descriptionTextController.text,
                              ),
                              widget.eachStepp.id!,
                            );
                            value.addEmptyEachStepp();
                            Navigator.of(context).pushReplacementNamed(
                              RouteNames.addEachSteppPage,
                              arguments: {
                                RouteParameters.addSteppProvider: Provider.of<AddSteppPlaceProvider>(
                                  context,
                                  listen: false,
                                ),
                                RouteParameters.currentAddEachStepp: value.currentAddStepp!.stepps!.last,
                              },
                            );
                          },
                          child: Text(
                            HomePageUiStrings.plustStepp,
                            style: context.textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
