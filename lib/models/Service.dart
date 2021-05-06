import 'package:flutter/foundation.dart';
import 'package:kky_ds/helper/GoogleSheetsApi.dart';

class Service {
  // `title` will be the first column and `incharge` will be the second column
  // `phone` will be the third column and `contents` will be the fourth column
  // on 'சேவைகள்' sheet
  final String title, incharge, phone, contents;

  const Service({
    @required this.title,
    @required this.incharge,
    @required this.phone,
    @required this.contents,
  });
}

class ServicesProvider with ChangeNotifier {
  List<Service> _serviceList = [];

  List<Service> get services {
    return [..._serviceList];
  }

  Future<void> fetchAndUpdateList({String sheetId, String sheetName}) async {
    try {
      final values = await GoogleSheets(
        sheetId: sheetId,
        sheetName: sheetName,
      ).sheetData();
      final List<Service> loadedItems = [];
      if (values.length > 0) {
        for (var i = 1; i < values.length; i++) {
          if (values[i][0] != "-" && values[i][3] != "-") {
            loadedItems.add(
              Service(
                title: values[i][0],
                incharge: values[i][1],
                phone: values[i][2],
                contents: values[i][3],
              ),
            );
          }
        }
      }

      _serviceList = loadedItems;
      notifyListeners();
    } catch (error) {
      _serviceList = [];
      notifyListeners();
      // throw (error);
    }
  }
}
