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

  // This is used for custom html view page with the help of `flutter_html` package

  @override
  Widget build(BuildContext context) {
    String datePara = "";
    // This date is only used in `Events Detail` pages
    if (date != "") datePara = "<p>$date</p>";
    return SingleChildScrollView(
      child: Html(
        data: """<h2>$title</h2>$datePara$contents""",
        // If there are  `<a>` links in html content then it will open in
        // external browser
        onLinkTap: (link, _, __, ___) {
          launch(link);
        },
        style: {
          'body': Style(fontSize: FontSize.em(1.1)),
          'table': Style(fontSize: FontSize.small),
        },
      ),
    );
  }
}
