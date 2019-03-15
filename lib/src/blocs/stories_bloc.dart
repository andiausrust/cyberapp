import 'package:rxdart/rxdart.dart';
import '../provider/repository.dart';
import '../models/cyber_news_model.dart';

class StoriesBloc {
  final _repository = Repository();
  final _cyberNews = PublishSubject<List<CyberNews>>();

  Observable<List<CyberNews>> get cyberNews => _cyberNews.stream;

  fetchCyberNews() async {
    final cyberNews = await _repository.fetchCyberNews();
    _cyberNews.sink.add(cyberNews);
  }

  dispose() {
    _cyberNews.close();
  }
}
