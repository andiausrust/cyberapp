import 'package:flutter/material.dart';
import '../blocs/stories_provider.dart';
import '../models/cyber_news_model.dart';

class CyberNewsList extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    bloc.fetchCyberNews();
    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.cyberNews,
      builder: (context, AsyncSnapshot<List<CyberNews>> snapshot) {
        if (!snapshot.hasData) {
          return Text('still waiting');
        }

        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, int index) {
            return Text(snapshot.data[index].author);
          },
        );
      },
    );
  }
}
