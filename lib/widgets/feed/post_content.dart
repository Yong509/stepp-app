import 'package:flutter/material.dart';
import 'package:stepp_app/constants/feed/post_box_size.dart';
import 'package:stepp_app/utils/build_context_helper.dart';

class PostContent extends StatefulWidget {
  final String content;
  const PostContent({
    super.key,
    required this.content,
  });

  @override
  State<PostContent> createState() => _PostContentState();
}

class _PostContentState extends State<PostContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PostBoxSize.postContentPadding,
      child: Text(
        widget.content,
        style: context.textTheme.bodyMedium!.copyWith(
          color: Colors.black,
          overflow: TextOverflow.ellipsis,
        ),
        maxLines: PostBoxSize.postContentMaxLines,
      ),
    );
  }
}
