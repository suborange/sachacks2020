import 'package:lean_provider/core/services/api_service.dart';
import 'package:lean_provider/locator.dart';

class AnalyzeService {
  final _api = locator<ApiService>();

  Future<double> getPositivity(String text) async {
    var data = await _api.analyze(text);
    var tones = data["document_tone"]["tones"];
    print(tones);
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
          positivity += tone["score"] / 4;
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
    return positivity;
  }

  Future<double> getSentiment(String text) async {
    var data = await _api.checkSentiment(text);

    return data["sentiment"]["document"]["score"];
  }
}
