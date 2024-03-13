import 'package:stepp_app/constants/app_configs.dart';
import 'package:stepp_app/services/http_client_service.dart';

class SteppPlaceService {
  SteppPlaceService(this.httpClientService);

  final HttpClientService httpClientService;

  Future<void> getSteppPlaceFeed() async{
    final url = Uri.https(
      AppConfigs.baseURL,
      
    );
  }
}
