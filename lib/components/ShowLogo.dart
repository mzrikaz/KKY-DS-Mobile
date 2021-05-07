import 'package:flutter/material.dart';

class ShowLogo extends StatelessWidget {
  final size;
  const ShowLogo({
    Key key,
    this.size,
  }) : super(key: key);

  // This is the logo visible on entry screen of the app

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // It's positioned vertically from 8% from top of the screen
      top: size.maxHeight * 0.08,
      child: Container(
        height: 100,
        child: Image.asset(
          'assets/images/gov_logo.png',
        ),
      ),
    );
  }
}
