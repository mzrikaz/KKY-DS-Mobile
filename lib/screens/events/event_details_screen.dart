import 'package:flutter/material.dart';
import 'package:kky_ds/components/GetAppBar.dart';
import 'package:kky_ds/components/ShowHtml.dart';

class EventDetailsScreen extends StatelessWidget {
  final String title, contents, date;

  const EventDetailsScreen({Key key, this.title, this.contents, this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetAppBar(
        title: 'நிகழ்வு விவரம்',
      ),
      body: ShowHtml(
        title: title,
        contents: contents,
        date: date,
      ),
    );
  }
}
