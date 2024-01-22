import 'package:flutter/material.dart';
import 'package:stepp_app/data_models/feed/post.dart';
import 'package:stepp_app/widgets/feed/post_box.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: PostModel.mockSteppPlace.length,
            itemBuilder: (context, index) {
              return PostBox(
                post: PostModel.mockSteppPlace[index],
              );
            },
          ),
        ),
      ),
    );
  }
}