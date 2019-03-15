import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../constants/provider_const.dart';
import '../models/cyber_news_model.dart';
import '../provider/i_news_source.dart';

class CyberNewsProvider implements INewsSource {
  Client client = new Client();

  @override
  Future<List<CyberNews>> fetchCyberNews() async {
    final response = await client.get(
        '${ProviderConstants.root}?q=${ProviderConstants.queryNews}&sortBy=${ProviderConstants.sortBy}&language=${ProviderConstants.language}&pageSize=${ProviderConstants.pageSize}&apiKey=${ProviderConstants.apiKey}');
    final news = json.decode(response.body);
    var data = news["articles"];
    print('###########');
    print(data.length);
    print(data.runtimeType);

    List<CyberNews> cyberNews = List<CyberNews>();

    for (int i = 0; i < data.length; i++) {
      var cyberNew = CyberNews.fromJson(
          data[i]["source"]["name"],
          data[i]["author"],
          data[i]["title"],
          data[i]["description"],
          data[i]["url"],
          data[i]["urlToImage"],
          data[i]["publishedAt"],
          data[i]["content"]);
      cyberNews.add(cyberNew);
      print(cyberNews.length);
      print(cyberNews[i].author);
    }

    return cyberNews;
  }
}
