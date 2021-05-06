import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:kky_ds/components/GetAppBar.dart';
import 'package:kky_ds/components/ShowHtml.dart';
import 'package:url_launcher/url_launcher.dart';

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
