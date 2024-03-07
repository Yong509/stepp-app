import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stepp_app/pages/home/feed/add_cover_stepp_page.dart';
import 'package:stepp_app/pages/home/feed/add_each_stepp_page.dart';
import 'package:stepp_app/pages/place/stepp_place_page.dart';
import 'package:stepp_app/providers/home/add_stepp_place_provider.dart';
import 'package:stepp_app/providers/image_gallery_provider.dart';
import 'package:stepp_app/providers/stepp_place_provider.dart';
import 'package:stepp_app/services/image_gallery_service.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    RouteNames.steppPlace: (context) => ChangeNotifierProvider<SteppPlaceProvider>(
          create: (context) => SteppPlaceProvider(),
          builder: (context, child) => const SteppPlacePage(),
        ),
    RouteNames.addEachSteppPage: (context) {
      final Map args = ModalRoute.of(context)!.settings.arguments as Map;
      final AddSteppPlaceProvider addSteppProvider = args[RouteParameters.addSteppProvider];
      return MultiProvider(
        providers: [
          Provider(create: (context) => ImageGalleryService()),
          ChangeNotifierProvider(
            create: (context) => ImageGalleryProvider(
              Provider.of<ImageGalleryService>(context, listen: false),
            ),
          ),
          ChangeNotifierProvider.value(value: addSteppProvider)
        ],
        child: AddEachSteppPage(
          eachStepp: addSteppProvider.currentAddStepp!.stepps!.last,
        ),
      );
    },
    RouteNames.addCoverPage: (context) {
      return const AddCoverPage();
    }
  };
}

class RouteNames {
  static const steppPlace = "steppPlace";
  static const addEachSteppPage = "addEachSteppPage";
  static const addCoverPage = "addCoverPage";
}

class RouteParameters {
  static const addSteppProvider = "addSteppProvider";
}
