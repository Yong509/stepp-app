import 'package:flutter/material.dart';
import 'package:stepp_app/constants/mock_data.dart';
import 'package:stepp_app/constants/routes.dart';
import 'package:stepp_app/data_models/feed/post.dart';
import 'package:stepp_app/widgets/feed/post_action_bar.dart';
import 'package:stepp_app/widgets/feed/post_content.dart';
import 'package:stepp_app/widgets/feed/post_header_bar.dart';
import 'package:stepp_app/widgets/feed/post_image.dart';

class PostBox extends StatefulWidget {
  final PostModel post;
  const PostBox({super.key, required this.post});

  @override
  State<PostBox> createState() => _PostBoxState();
}

class _PostBoxState extends State<PostBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.steppPlace);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Flexible(child: PostHeaderBar()),
          PostImage(
            imagePath: widget.post.imagePath,
            steppProfile: MockData.mockProfileList,
          ),
          const PostActionBar(),
          PostContent(content: widget.post.content)
        ],
      ),
    );
  }
}
