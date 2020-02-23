import 'package:lean_provider/core/services/http_service.dart';

import '../../locator.dart';

class ApiService {
  final httpService = locator<HttpService>();

  Future<Map<dynamic, dynamic>> analyze(String text) async {
    Map<String, dynamic> data = {
      "text": text,
    };
    Map<dynamic, dynamic> result;
    try {
      result = await httpService.getHttp("/v3/tone", data);
    } catch (e) {
      print(e);
    }

    return result;
  }
}
