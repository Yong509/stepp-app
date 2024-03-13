import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stepp_app/constants/routes.dart';
import 'package:stepp_app/pages/home/home_page.dart';
import 'package:stepp_app/providers/home/home_provider.dart';
import 'package:stepp_app/services/http_client_service.dart';
import 'package:stepp_app/services/image_gallery_service.dart';
import 'package:stepp_app/services/stepp/stepp_place_service.dart';
import 'package:stepp_app/styles/app_theme.dart';

class SteppApp extends StatefulWidget {
  const SteppApp({super.key});

  @override
  State<SteppApp> createState() => _SteppAppState();
}

class _SteppAppState extends State<SteppApp> {
  List<SingleChildWidget> _initializeServices() {
    final httpClientService = HttpClientService();
    return [
      Provider<HttpClientService>.value(value: httpClientService),
      Provider<ImageGalleryService>.value(value: ImageGalleryService()),
      Provider<SteppPlaceService>(create: (context) => SteppPlaceService(httpClientService)),
      ChangeNotifierProvider(create: (context) => HomeProvider()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final providers = _initializeServices();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          textTheme: AppTheme.customTextTheme,
        ),
        routes: Routes.routes,
        home: const HomePage(),
      ),
    );
  }
}
