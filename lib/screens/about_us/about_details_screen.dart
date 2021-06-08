import 'package:flutter/material.dart';
import 'package:kky_ds/components/GetAppBar.dart';
import 'package:kky_ds/components/ShowHtml.dart';

class AboutDetailsScreen extends StatelessWidget {
  final String title, contents;

  const AboutDetailsScreen({Key key, this.title, this.contents})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetAppBar(
        title: title,
      ),
      body: ShowHtml(title: title, contents: contents),
    );
  }
}
