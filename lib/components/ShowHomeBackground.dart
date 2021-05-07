import 'package:flutter/material.dart';

class ShowHomeBackground extends StatelessWidget {
  const ShowHomeBackground({
    Key key,
  }) : super(key: key);

  // This is the background image visible on entry screen of the app

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/front_bg.jpg'),
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), BlendMode.dstATop),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
