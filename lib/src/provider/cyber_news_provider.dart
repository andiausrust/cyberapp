import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../constants/provider_const.dart';
import '../models/cyber_news_model.dart';

class CyberNewsProvider {
  Client client = new Client();

  fetchCyberNews() async {
    final response = await client.get(
        '${ProviderConstants.root}?q=${ProviderConstants.queryNews}&sortBy=${ProviderConstants.sortBy}&language=${ProviderConstants.language}&pageSize=${ProviderConstants.pageSize}&apiKey=${ProviderConstants.apiKey}');
    final news = json.decode(response.body);
    List datas = news["articles"];

    List<CyberNews> cyberNews = List<CyberNews>();
   
    for (int i = 0; i < datas.length; i++) {
      var cyberNew = CyberNews.fromJson(
          datas[i]["source"]["name"],
          datas[i]["author"],
          datas[i]["title"],
          datas[i]["description"],
          datas[i]["url"],
          datas[i]["urlToImage"],
          datas[i]["publishedAt"],
          datas[i]["content"]);
      cyberNews.add(cyberNew);
    }

    return cyberNews;
  }
}
