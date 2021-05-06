import 'package:flutter/material.dart';
import 'package:kky_ds/components/GetAppBar.dart';
import 'package:kky_ds/components/ShowSubNavigationItem.dart';
import 'package:kky_ds/models/Event.dart' show EventsProvider;
import 'package:provider/provider.dart';

import 'event_details_screen.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<EventsProvider>(context).fetchAndUpdateList().then((_) {
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
        title: 'நிகழ்வுகள்',
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Consumer<EventsProvider>(
              builder: (_, service, __) => service.events.length <= 0
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: const Text(
                          'இந்தப் பகுதியில் நிகழ்வுகள் எதுவும் பதியப்படவில்லை.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: ListView.builder(
                        itemCount: service.events.length,
                        itemBuilder: (_, i) {
                          return ShowSubNavigationItem(
                            title: service.events[i].title,
                            date: service.events[i].date,
                            route: () => {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return EventDetailsScreen(
                                  title: service.events[i].title,
                                  contents: service.events[i].contents,
                                  date: service.events[i].date,
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
