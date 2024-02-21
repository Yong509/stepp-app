import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stepp_app/pages/home/feed/add_stepp_page.dart';
import 'package:stepp_app/pages/place/stepp_place_page.dart';
import 'package:stepp_app/providers/image_gallery_provider.dart';
import 'package:stepp_app/providers/stepp_place_provider.dart';
import 'package:stepp_app/services/image_gallery_service.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    RouteNames.steppPlace: (context) => ChangeNotifierProvider<SteppPlaceProvider>(
          create: (context) => SteppPlaceProvider(),
          builder: (context, child) => const SteppPlacePage(),
        ),
    RouteNames.previewAddStepp: (context) {
      return MultiProvider(
        providers: [
          Provider(create: (context) => ImageGalleryService()),
          ChangeNotifierProvider(
            create: (context) => ImageGalleryProvider(
              Provider.of<ImageGalleryService>(context, listen: false),
            ),
          ),
        ],
        child: const AddSteppPage(),
      );
    }
  };
}

class RouteNames {
  static const steppPlace = "steppPlace";
  static const previewAddStepp = "previewAddStepp";
}

class RouteParameters {}
