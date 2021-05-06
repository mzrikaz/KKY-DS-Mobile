import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowCredits extends StatelessWidget {
  const ShowCredits({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => launch("https://www.witsberry.com"),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            'Crafted with ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 11,
            ),
          ),
          // Heart icon
          Icon(
            Icons.favorite,
            size: 15,
            color: Colors.red,
          ),
          Text(
            ' in Sri Lanka by WitsBerry',
            style: TextStyle(
              color: Colors.black,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
