import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stepp_app/constants/home/add/add_cover_stepp_page_sizes.dart';
import 'package:stepp_app/constants/home/add/add_cover_stepp_page_ui_strings.dart';
import 'package:stepp_app/constants/home/home_page_size.dart';
import 'package:stepp_app/constants/home/home_page_ui_strings.dart';
import 'package:stepp_app/constants/sizes.dart';
import 'package:stepp_app/providers/home/add_stepp_place_provider.dart';
import 'package:stepp_app/styles/app_theme.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/widgets/custom_text_field.dart';

class AddCoverSteppPlaceDescription extends StatefulWidget {
  const AddCoverSteppPlaceDescription({super.key});

  @override
  State<AddCoverSteppPlaceDescription> createState() => _AddCoverSteppPlaceDescriptionState();
}

class _AddCoverSteppPlaceDescriptionState extends State<AddCoverSteppPlaceDescription> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AddSteppPlaceProvider>(
      builder: (context, value, child) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              height: context.deviceSize.height,
            ),
            child: Padding(
              padding: AddCoverSteppPageSizes.coverDescriptionPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        HomePageUiStrings.selectPlacePrompt(
                          value.currentAddStepp!.place!.placeTitle,
                        ),
                        style: context.textTheme.bodySmall!.copyWith(
                          color: Colors.white.withOpacity(AppTheme.opacity80Percent),
                        ),
                      ),
                      const SizedBox(width: Sizes.spacing15),
                      Text(
                        AddCoverSteppUiStrings.addPeople,
                        style: context.textTheme.bodySmall!.copyWith(
                          color: Colors.white.withOpacity(AppTheme.opacity80Percent),
                        ),
                      )
                    ],
                  ),
                  Flexible(
                    child: CustomTextField(
                      backgroundColor: Colors.transparent,
                      controller: TextEditingController(),
                      hintText: HomePageUiStrings.descriptionHintText,
                      maxLine: HomePageSize.addSteppDescriptionMinLine,
                      hintTextStyle: context.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
