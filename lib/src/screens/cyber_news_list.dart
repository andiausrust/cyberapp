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
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, int index) {
            return cyberContent(context, index, snapshot);
          },
        );
      },
    );
  }

  Widget cyberContent(BuildContext context, int index,
      AsyncSnapshot<List<CyberNews>> snapshot) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(5.0),
          child: new Image.network(snapshot.data[index].urlToImage),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text("test"),
          ),
        ),
      ],
    );
  }
}
