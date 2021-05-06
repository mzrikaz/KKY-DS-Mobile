import 'package:flutter/material.dart';
import 'package:kky_ds/components/GetAppBar.dart';
import 'package:kky_ds/components/ShowCredits.dart';
import 'package:kky_ds/constants.dart';
import 'package:kky_ds/helper/navigation_items.dart';
import 'package:kky_ds/screens/events/events_screen.dart';
import 'package:kky_ds/screens/administration/officers_contact_screen.dart';
import 'package:kky_ds/screens/registered_organizations/registered_organizations_screen.dart';
import 'package:kky_ds/screens/services/services_navigation_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../about_us/about_us_screen.dart';

class NavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetAppBar(
        title: 'பிரதேச செயலகம் - காத்தான்குடி',
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        color: kTertiaryColor,
        child: LayoutBuilder(
          builder: (_, size) => Container(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(NAVIGATION_ITEMS
                      .map(
                        (division) => GestureDetector(
                          onTap: () {
                            switch (division.id) {
                              case 1:
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => AboutUsScreen()));
                                break;
                              case 2:
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => OfficersContactScreen()));
                                break;
                              case 3:
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) =>
                                        ServicesNavigationScreen()));
                                break;
                              case 4:
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => EventsScreen()));
                                break;
                              case 5:
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) =>
                                        RegisteredOrganizationScreen()));
                                break;
                              case 6:
                                launch('http://kattankudy.ds.gov.lk/');
                                break;
                              default:
                                return;
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            margin: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: kPrimaryColor,
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Color(0x1F2b234f),
                                    spreadRadius: 0,
                                    offset: Offset(0, 1),
                                  ),
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  child: Image.asset(
                                    division.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                FittedBox(
                                  child: Text(
                                    division.name,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                      )
                      .toList()),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    // Open up Witsberry website on browser when someone tap on it
                    ShowCredits(),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
