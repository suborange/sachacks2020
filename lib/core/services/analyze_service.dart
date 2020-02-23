import 'package:lean_provider/core/services/api_service.dart';
import 'package:lean_provider/locator.dart';

class AnalyzeService {
  final _api = locator<ApiService>();

  Future<double> getPositivity(String text) async {
    var data = await _api.analyze(text);
    var tones = data["document_tone"]["tones"];
    double positivity = 0;
    for (var tone in tones) {
      switch (tone["tone_id"]) {
        case "sadness":
          positivity -= tone["score"];
          break;
        case "joy":
          positivity += tone["score"];
          break;
        case "confident":
          positivity += tone["score"];
          break;
        case "anger":
          positivity -= tone["score"];
          break;
        case "fear":
          positivity -= tone["score"];
          break;
        default:
      }
    }
    positivity /= tones.length;
    print(positivity);
    print(tones);
    return positivity;
  }
}
