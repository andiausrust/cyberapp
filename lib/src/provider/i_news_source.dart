import '../models/cyber_news_model.dart';

abstract class INewsSource {
  Future<List<CyberNews>> fetchCyberNews();
}
