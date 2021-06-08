import 'package:flutter/foundation.dart';
import 'package:kky_ds/helper/GoogleSheetsApi.dart';

class Staff {
  // `title` will be the first column and `incharge` will be the second column
  // `phone` will be the third column and `contents` will be the fourth column
  // on 'சேவைகள்' sheet
  final String name, gender, division, phone, image;

  const Staff({
    this.name,
    this.gender,
    this.division,
    this.image,
    this.phone,
  });
}

class StaffProvider with ChangeNotifier {
  List<Staff> _staffList = [];

  List<Staff> get staffs {
    return [..._staffList];
  }

  Future<void> fetchAndUpdateList({String sheetId, String sheetName}) async {
    try {
      final values = await GoogleSheets(
        sheetId: sheetId,
        sheetName: sheetName,
      ).sheetData();
      final List<Staff> loadedItems = [];
      if (values.length > 0) {
        for (var i = 1; i < values.length; i++) {
          if (values[i][0] != "-" && values[i][3] != "-") {
            loadedItems.add(Staff(
              name: values[i][0],
              gender: values[i][1],
              division: values[i][2],
              phone: values[i][3],
              image: values[i][4],
            ));
          }
        }
      }

      _staffList = loadedItems;
      notifyListeners();
    } catch (error) {
      _staffList = [];
      notifyListeners();
      // throw (error);
    }
  }
}
