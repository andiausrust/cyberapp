import 'dart:async';
import 'cyber_news_provider.dart';
import '../models/cyber_news_model.dart';
import 'i_news_source.dart';

class Repository {
  INewsSource iNewsSource = CyberNewsProvider();
  CyberNewsProvider newsProvider = CyberNewsProvider();

  Future<List<CyberNews>> fetchCyberNews() {
    return iNewsSource.fetchCyberNews();
  }
}
