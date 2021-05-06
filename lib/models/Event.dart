import 'package:flutter/foundation.dart';
import 'package:kky_ds/helper/GoogleSheetsApi.dart';

class Event {
  final String title, contents, date;

  const Event({
    @required this.title,
    @required this.contents,
    @required this.date,
  });
}

class EventsProvider with ChangeNotifier {
  List<Event> _eventList = [];

  List<Event> get events {
    return [..._eventList];
  }

  Future<void> fetchAndUpdateList() async {
    try {
      final values = await GoogleSheets(
        sheetId: '1wElK_RKB0J114pP45u9NtT8X-4ckFb--x4gFekd5XWI',
        sheetName: 'நிகழ்வுகள்',
      ).sheetData();
      final List<Event> loadedItems = [];
      if (values.length > 0) {
        for (var i = 1; i < values.length; i++) {
          if (values[i][0] != "-" && values[i][1] != "-") {
            loadedItems.add(
              Event(
                title: values[i][0],
                contents: values[i][1],
                date: values[i][2],
              ),
            );
          }
        }
      }
      _eventList = loadedItems.reversed.toList();
      notifyListeners();
    } catch (error) {
      _eventList = [];
      notifyListeners();
      // throw (error);
    }
  }
}
