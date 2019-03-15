import 'package:flutter/material.dart';
import '../src/screens/cyber_news_list.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CyberNews',
      home: CyberNewsList(),
    );
  }
}
