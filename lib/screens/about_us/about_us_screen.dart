import 'package:flutter/material.dart';
import 'package:kky_ds/components/GetAppBar.dart';
import 'package:kky_ds/components/ShowSubNavigationItem.dart';
import 'package:kky_ds/constants.dart';
import 'package:kky_ds/models/About.dart' show AboutProvider;
import 'package:provider/provider.dart';

import 'about_details_screen.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<AboutUsScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<AboutProvider>(context).fetchAndUpdateList().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetAppBar(
        title: 'எம்மைப்பற்றி',
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              margin: EdgeInsets.only(top: 10),
              child: Consumer<AboutProvider>(
                builder: (_, about, __) => about.aboutus.length <= 0
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: const Text(
                            'இந்தப் பகுதியில் நிகழ்வுகள் எதுவும் பதியப்படவில்லை.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: about.aboutus.length,
                        itemBuilder: (_, i) {
                          return ShowSubNavigationItem(
                            title: about.aboutus[i].title,
                            route: () => {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return AboutDetailsScreen(
                                  title: about.aboutus[i].title,
                                  contents: about.aboutus[i].contents,
                                );
                              }))
                            },
                          );
                        },
                      ),
              ),
            ),
    );
  }
}
