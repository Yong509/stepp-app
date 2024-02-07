import 'package:flutter/material.dart';
import 'package:stepp_app/constants/sizes.dart';
import 'package:stepp_app/styles/app_theme.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/widgets/common_app_bar.dart';

class PageLayout extends StatefulWidget {
  const PageLayout({
    Key? key,
    required this.body,
    required this.title,
    this.actions,
    this.backButtonText,
    this.appbarBottom,
    this.hasTopPadding = true,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottom,
    this.centerTitle,
    this.showAppBar = true,
  }) : super(key: key);

  final List<Widget> body;
  final List<String> title;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final String? backButtonText;
  final PreferredSizeWidget? appbarBottom;
  final bool hasTopPadding;
  final Widget? bottom;
  final bool? centerTitle;
  final bool showAppBar;

  @override
  State<PageLayout> createState() => _PageLayoutState();
}

class _PageLayoutState extends State<PageLayout> {
  int selectedIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  AppBar _buildAppBarSection(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return CommonAppBar(
      title: Text(
        widget.title[selectedIndex],
        style: textTheme.titleLarge?.copyWith(
          color: theme.colorScheme.onSurface,
        ),
      ),
      backgroundColor: Colors.transparent,
      actions: widget.actions,
      backButtonText: widget.backButtonText,
      bottom: widget.appbarBottom,
      centerTitle: widget.centerTitle,
    );
  }

  final List<Icon> iconInfoList = [];

  BottomNavigationBar _buildBottomNavigationBarSection(BuildContext context) {
    final theme = Theme.of(context);

    return BottomNavigationBar(
      items: iconInfoList.map((item) => BottomNavigationBarItem(icon: item)).toList(),
      unselectedItemColor: theme.colorScheme.onBackground.withAlpha(
        AppTheme.alpha36Percent,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      currentIndex: selectedIndex,
      onTap: onTabTapped,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      elevation: Sizes.elevationNone,
    );
  }

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = context.mediaQuery.padding.top;
    final appBarHeight = _buildAppBarSection(context).preferredSize.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: widget.showAppBar ? _buildAppBarSection(context) : null,
      body: Container(
        color: Colors.white,
        padding: widget.hasTopPadding
            ? EdgeInsets.only(
                top: statusBarHeight + appBarHeight + Sizes.appPageTemplateTopPadding,
              )
            : EdgeInsets.zero,
        child: widget.body[selectedIndex],
      ),
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      bottomSheet: widget.bottom,
      bottomNavigationBar: widget.body.length == Sizes.appPageTemplateBottomNoneLength
          ? null
          : _buildBottomNavigationBarSection(
              context,
            ),
    );
  }
}
