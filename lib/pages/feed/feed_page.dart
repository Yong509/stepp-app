import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stepp_app/constants/feed/post_box_size.dart';
import 'package:stepp_app/constants/sizes.dart';
import 'package:stepp_app/data_models/feed/post.dart';
import 'package:stepp_app/styles/app_theme.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/widgets/feed/post_box.dart';
import 'package:stepp_app/widgets/page_layout.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      hasTopPadding: false,
      showAppBar: true,
      centerTitle: false,
      hasBackButton: false,
      titleSpacing: false,
      body: [
        Center(
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
        ),
        Center(
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
        ),
        Center(
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
        ),
        Center(
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
        ),
        Center(
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
        )
      ],
      actions: [
        IconButton(
          onPressed: () {},
          icon: PhosphorIcon(
            PhosphorIcons.bell(),
            size: Sizes.iconSizeMedium,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: PhosphorIcon(
            PhosphorIcons.chatTeardropText(),
            size: Sizes.iconSizeMedium,
          ),
        )
      ],
      appbarBottom: PreferredSize(
        preferredSize: const Size.fromHeight(Sizes.preferredSizeMax),
        child: Container(
          color: Colors.black.withAlpha(AppTheme.alpha12Percent),
          height: Sizes.preferredSizeHeightAppBar,
        ),
      ),
    );
  }
}
