import 'dart:convert';

import 'package:stepp_app/constants/app_configs.dart';
import 'package:stepp_app/constants/http_constant.dart';
import 'package:stepp_app/constants/stepp_place/stepp_place_endpoint.dart';
import 'package:stepp_app/data_models/stepp_place/stepp_place_feed_response.dart';
import 'package:stepp_app/services/http_client_service.dart';

class SteppPlaceService {
  SteppPlaceService(this.httpClientService);

  final HttpClientService httpClientService;

  Future<SteppPlaceFeedResponse?> getSteppPlaceFeed() async {
    try {
      final url = Uri.parse(
        AppConfigs.baseURL + SteppPlaceEndpoint.steppPlaceFeedEndpoint(),
      );

      final response = await httpClientService.get(url);
      return response.statusCode == HttpConstants.statusOk
          ? SteppPlaceFeedResponse.fromJson(jsonDecode(response.body))
          : null;
    } catch (e) {
      rethrow;
    }
  }
}
