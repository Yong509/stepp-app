import 'package:flutter/material.dart';
import 'package:stepp_app/constants/home/feed/post_box_size.dart';
import 'package:stepp_app/constants/home/feed/post_box_ui_strings.dart';
import 'package:stepp_app/constants/place/stepp_place_size.dart';
import 'package:stepp_app/constants/ui_strings.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/widgets/custom_button.dart';

class PostHeaderBar extends StatelessWidget {
  const PostHeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListTile(
            dense: false,
            leading: CircleAvatar(
              radius: PostBoxSize.profilePosterRadius,
              backgroundImage: const AssetImage(
                'assets/images/avatar-3.png',
              ),
            ),
            title: const Text(PostBoxUiStrings.mockPosterName),
            subtitle: const Text(PostBoxUiStrings.stepByStepp),
          ),
        ),
        Row(
          children: [
            CustomButton(
              padding: SteppPlaceSize.steppPlaceFollowButtonPadding,
              child: Text(
                UiStrings.commonFollow,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            )
          ],
        ),
      ],
    );
  }
}
