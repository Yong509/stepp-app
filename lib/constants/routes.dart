import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stepp_app/pages/place/stepp_place_page.dart';
import 'package:stepp_app/providers/stepp_place_provider.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    RouteNames.steppPlace: (context) => ChangeNotifierProvider<SteppPlaceProvider>(
          create: (context) => SteppPlaceProvider(),
          builder: (context, child) => const SteppPlacePage(),
        )
  };
}

class RouteNames {
  static const steppPlace = "steppPlace";
}

class RouteParameters {}
