import 'package:flutter/material.dart';

class ShowLogo extends StatelessWidget {
  final size;
  const ShowLogo({
    Key key,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
