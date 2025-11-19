import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_project_1/model/webtoon_model.dart';

class WebtoonViewmodel {

  List<WebtoonModel> _webtoon = [];

  List<WebtoonModel>  get webtoon => _webtoon = [];

  final base_url = "https://webtoon-crawler.nomadcoders.workers.dev/";
  static const String today = "today";

  void GetTodayWebtoon() async {
    final url = Uri.parse("$base_url/$today");
    final res = await http.get(url);

    if(res.statusCode == 200){
        final List<dynamic> webtoons = jsonDecode(res.body);
        for (var toon in webtoons) {
          webtoon.add((toon));
        }
    }
  }

}