import 'package:flutter/material.dart';
import 'package:stepp_app/constants/feed/post_box_size.dart';
import 'package:stepp_app/data_models/feed/post.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/widgets/feed/post_box.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
          child: SizedBox(
            height: context.deviceSize.height,
            width: context.deviceSize.width,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: PostModel.mockSteppPlace.length,
              itemBuilder: (context, index) {
                return PostBox(
                  post: PostModel.mockSteppPlace[index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: PostBoxSize.postSpacing,
                );
          },
        ),
      ),
    );
  }
}
