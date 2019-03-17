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

    List<CyberNews> cyberNews = List<CyberNews>();

    for (int i = 0; i < data.length; i++) {
      if (data[i]["source"]["name"] == null) data[i]["source"]["name"] = "n/a";
      if (data[i]["author"] == null) data[i]["author"] = "n/a";
      if (data[i]["title"] == null) data[i]["title"] = "n/a";
      if (data[i]["description"] == null) data[i]["description"] = "n/a";
      if (data[i]["url"] == null) data[i]["url"] = "n/a";
      if (data[i]["urlToImage"] == null)
        data[i]["urlToImage"] = "https://loremflickr.com/320/240";
      if (data[i]["publishedAt"] == null) data[i]["publishedAt"] = "n/a";
      if (data[i]["content"] == null) data[i]["content"] = "n/a";

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
    }

    return cyberNews;
  }
}
