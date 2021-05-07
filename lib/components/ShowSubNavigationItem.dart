import 'package:flutter/material.dart';

import '../constants.dart';

class ShowSubNavigationItem extends StatelessWidget {
  final Function route;
  final String title;
  final String date;
  const ShowSubNavigationItem({
    Key key,
    @required this.route,
    @required this.title,
    this.date = "",
  }) : super(key: key);

  // This is used for ListItems in Pages like About, Administration, Services and etc

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      child: Material(
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: route,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                width: 2,
                color: kPrimaryColor,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  softWrap: true,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (date != "")
                  Text(
                    date,
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
