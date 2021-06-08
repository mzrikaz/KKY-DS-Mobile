import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:kky_ds/components/PrimaryButton.dart';
import 'package:kky_ds/components/ShowCredits.dart';
import 'package:kky_ds/components/ShowHomeBackground.dart';
import 'package:kky_ds/components/ShowLogo.dart';
import 'package:kky_ds/components/ShowVisionMission.dart';

import 'navigation_screen.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppUpdateInfo _updateInfo;

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      setState(() {
        _updateInfo = info;
      });
    }).catchError((e) {
      showSnack(e.toString());
    });
  }

  void showSnack(String text) {
    if (_scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(_scaffoldKey.currentContext)
          .showSnackBar(SnackBar(content: Text(text)));
    }
  }

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
                    action: () {
                      _updateInfo?.updateAvailability ==
                              UpdateAvailability.updateAvailable
                          ? InAppUpdate.performImmediateUpdate()
                              .catchError((e) => showSnack(e.toString()))
                          : Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => NavigationScreen(),
                            ));
                    },
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
