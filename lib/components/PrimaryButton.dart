import 'package:flutter/material.dart';
import 'package:kky_ds/screens/home/navigation_screen.dart';

import '../constants.dart';

class PrimaryButton extends StatelessWidget {
  final size, title;
  const PrimaryButton({
    Key key,
    this.size,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => NavigationScreen(),
        ));
      },
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(kTertiaryColor),
        backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        width: size.maxWidth * 0.8,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
