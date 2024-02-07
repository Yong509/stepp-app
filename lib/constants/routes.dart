import 'package:flutter/material.dart';
import 'package:stepp_app/pages/place/stepp_place_page.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    RouteNames.steppPlace: (context) => const SteppPlace()
  };
}

class RouteNames {
  static const steppPlace = "steppPlace";
}

class RouteParameters {}
