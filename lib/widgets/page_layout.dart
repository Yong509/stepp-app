import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stepp_app/constants/sizes.dart';
import 'package:stepp_app/constants/ui_strings.dart';
import 'package:stepp_app/styles/app_theme.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/widgets/common_app_bar.dart';

class PageLayout extends StatefulWidget {
  const PageLayout({
    Key? key,
    required this.body,
    this.title,
    this.actions,
    this.backButtonText,
    this.appbarBottom,
    this.hasTopPadding = true,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottom,
    this.centerTitle,
    this.showAppBar = true,
    this.hasBackButton = true,
    this.titleSpacing = true,
  }) : super(key: key);

  final List<Widget> body;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final String? backButtonText;
  final PreferredSizeWidget? appbarBottom;
  final bool hasTopPadding;
  final Widget? bottom;
  final bool? centerTitle;
  final bool showAppBar;
  final bool hasBackButton;
  final bool titleSpacing;

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
    return CommonAppBar(
      title: Padding(
        padding: Sizes.onlyLeftPaddingSmall,
        child: widget.title ??
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/stepp-logo.png',
                  width: Sizes.iconSizeLarge,
                ),
                const SizedBox(
                  width: Sizes.spacing10,
                ),
                Text(
                  UiStrings.commonStepp.toUpperCase(),
                  style: context.textTheme.titleLarge!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
      ),
      titleSpacing: widget.titleSpacing,
      backgroundColor: Colors.transparent,
      actions: widget.actions,
      backButtonText: widget.backButtonText,
      bottom: widget.appbarBottom,
      centerTitle: widget.centerTitle,
      hasLeadingWidget: widget.hasBackButton,
    );
  }

  final List<Widget> iconInfoList = [
    PhosphorIcon(PhosphorIcons.houseSimple()),
    PhosphorIcon(PhosphorIcons.binoculars()),
    PhosphorIcon(PhosphorIcons.plus()),
    PhosphorIcon(PhosphorIcons.bookmarkSimple()),
    const CircleAvatar(
      backgroundImage: AssetImage('assets/images/avatar-3.png'),
    )
  ];

  BottomNavigationBar _buildBottomNavigationBarSection(BuildContext context) {
    final theme = Theme.of(context);
    return BottomNavigationBar(
      items: iconInfoList
          .map((item) => BottomNavigationBarItem(
                icon: item,
                label: UiStrings.emptyLabel,
              ))
          .toList(),
      unselectedItemColor: theme.colorScheme.onBackground.withAlpha(
        AppTheme.alpha36Percent
      ),
      selectedItemColor: Colors.black,
      showSelectedLabels: false,
      showUnselectedLabels: false,
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
          : Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: _buildBottomNavigationBarSection(
                context,
              ),
            ),
    );
  }
}
