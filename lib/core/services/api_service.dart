import 'package:lean_provider/core/services/http_service.dart';

import '../../locator.dart';

class ApiService {
  final httpService = locator<HttpService>();

  Future<void> analyze(String text) async {
    Map<String, dynamic> data = {
      "text": text,
    };

    try {
      var response = await httpService.getHttp("/v3/tone", data);
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
