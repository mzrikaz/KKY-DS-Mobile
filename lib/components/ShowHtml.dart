import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowHtml extends StatelessWidget {
  const ShowHtml({
    Key key,
    @required this.title,
    @required this.contents,
    this.date = "",
  }) : super(key: key);

  final String title;
  final String date;
  final String contents;

  @override
  Widget build(BuildContext context) {
    String datePara = "";
    if (date != "") datePara = "<p>$date</p>";
    return SingleChildScrollView(
      child: Html(
        data: """<h2>$title</h2>$datePara$contents""",
        onLinkTap: ((link) {
          launch(link);
        }),
        style: {
          'body': Style(fontSize: FontSize.em(1.1)),
          'table': Style(fontSize: FontSize.medium),
        },
      ),
    );
  }
}
