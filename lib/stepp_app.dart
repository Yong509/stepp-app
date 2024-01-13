import 'package:flutter/material.dart';
import 'package:stepp_app/pages/place/stepp_place.dart';
import 'package:stepp_app/styles/app_theme.dart';

class SteppApp extends StatelessWidget {
  const SteppApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: AppTheme.customTextTheme
      ),
      home: const SteppPlace(),
    );
  }
}
