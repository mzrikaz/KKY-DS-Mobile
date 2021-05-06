import 'package:flutter/material.dart';
import 'package:kky_ds/components/PrimaryButton.dart';
import 'package:kky_ds/components/ShowCredits.dart';
import 'package:kky_ds/components/ShowHomeBackground.dart';
import 'package:kky_ds/components/ShowLogo.dart';
import 'package:kky_ds/components/ShowVisionMission.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, size) => Stack(
          alignment: Alignment.center,
          fit: StackFit.loose,
          children: [
            ShowHomeBackground(),
            ShowLogo(
              size: size,
            ),
            Positioned(
              top: size.maxHeight * 0.26,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: size.maxWidth,
                child: FittedBox(
                  child: const Text(
                    'பிரதேச செயலகம் - காத்தான்குடி',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            ShowVisionMission(
              size: size,
            ),
            Positioned(
              bottom: 0,
              child: Column(
                children: [
                  PrimaryButton(
                    size: size,
                    title: 'நுழைவு',
                  ),
                  ShowCredits(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
