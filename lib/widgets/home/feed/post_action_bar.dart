import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stepp_app/constants/home/feed/post_box_size.dart';
import 'package:stepp_app/constants/home/feed/post_box_ui_strings.dart';
import 'package:stepp_app/utils/build_context_helper.dart';

class PostActionBar extends StatefulWidget {
  final Function(bool isPress)? onLike;
  final Function(bool isPress)? onComment;
  final Function(bool isForward)? onForward;
  final Function(bool isKeep)? onKeep;
  const PostActionBar({
    super.key,
    this.onLike,
    this.onComment,
    this.onForward,
    this.onKeep,
  });

  @override
  State<PostActionBar> createState() => _PostActionBarState();
}

class _PostActionBarState extends State<PostActionBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            PhosphorIcons.heart(),
            size: PostBoxSize.postActionBarIconSize,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            PhosphorIcons.chatCircle(),
            textDirection: TextDirection.rtl,
            size: PostBoxSize.postActionBarIconSize,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            PhosphorIcons.paperPlaneTilt(),
            size: PostBoxSize.postActionBarIconSize,
          ),
        ),
        Text(
          PostBoxUiStrings.mockStepped,
          style: context.textTheme.bodyLarge,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            PhosphorIcons.bookmarkSimple(),
            size: PostBoxSize.postActionBarIconSize,
          ),
        )
      ],
    );
  }
}
