import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stepp_app/pages/place/stepp_place_page.dart';
import 'package:stepp_app/providers/stepp_place_provider.dart';
import 'package:stepp_app/styles/app_theme.dart';

class SteppApp extends StatefulWidget {
  const SteppApp({super.key});

  @override
  State<SteppApp> createState() => _SteppAppState();
}

class _SteppAppState extends State<SteppApp> {
  List<SingleChildWidget> _initializeServices() {
    return [
      ChangeNotifierProvider(
        create: (context) => SteppPlaceProvider(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final providers = _initializeServices();
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          textTheme: AppTheme.customTextTheme,
        ),
        home: const SteppPlace(),
      ),
    );
  }
}
