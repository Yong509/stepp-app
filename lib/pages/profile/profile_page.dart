import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    bool _pinned = true;
    bool _snap = false;
    bool _floating = false;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 20.0,
            flexibleSpace: const FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              title: Text(
                'SliverAppBar',
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: Text('Storyteller & Coffee Lover'),
            ),
          ),
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 100.0,
            flexibleSpace: const FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                // expandedTitleScale: 0,
                centerTitle: true,
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'STEPP    ORIGINAL    TOGETHER    SAVED',
                      style: TextStyle(color: Colors.black87, fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child:
                        Text('$index', textScaler: const TextScaler.linear(5)),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
