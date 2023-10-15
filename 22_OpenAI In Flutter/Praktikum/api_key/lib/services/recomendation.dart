import 'dart:convert';
import 'package:api_key/constants/open_ai.dart';
import 'package:api_key/models/open_ai.dart';
import 'package:http/http.dart' as http;

class RecomendationService {
  static Future<Data> getRecomendation(
      {required String budget,
      required String camera,
      required String storage}) async {
    late Data gptData = Data(
        id: "",
        object: "",
        created: 0,
        model: "",
        choices: [],
        usage: Usage(completionTokens: 0, promptTokens: 0, totalTokens: 0));
    try {
      var url = Uri.parse("https://api.openai.com/v1/completions");
      Map<String, String> headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        'Authorization': 'Bearer $apiKey'
      };

      String phoneBudget = formatCurrency.format(int.parse(budget));
      String promtData =
          "You are a smartphone expert. Give me smartphone recommendation with a budget less than or equal to $phoneBudget and camera requirement $camera MP and  internal storage $storage GB Also give me details about the smartphone";

      final data = jsonEncode({
        "model": "text-davinci-003",
        "prompt": promtData,
        "temperature": 0.4,
        "max_tokens": 64,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
      });
      var response = await http.post(url, headers: headers, body: data);
      if (response.statusCode == 200) {
        gptData = dataFromJson(response.body);
      }
    } catch (e) {
      throw Exception('Request denied');
    }
    return gptData;
  }
}
