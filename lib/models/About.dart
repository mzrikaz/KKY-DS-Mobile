import 'package:flutter/foundation.dart';
import 'package:kky_ds/helper/GoogleSheetsApi.dart';

class About {
  // `title` will be the first column and `contents` will be the second column
  // on 'எம்மைப்பற்றி' sheet
  final String title, contents;

  const About({
    @required this.title,
    @required this.contents,
  });
}

class AboutProvider with ChangeNotifier {
  // Add all the rows from `எம்மைப்பற்றி` sheet
  List<About> _aboutList = [];

  // Return the copy of `_aboutList` array
  List<About> get aboutus {
    return [..._aboutList];
  }

  // Initiating a request to Google Sheet API
  Future<void> fetchAndUpdateList() async {
    try {
      final values = await GoogleSheets(
        sheetId: '1DH6jFmK3V1e25inyM76ss4DhIi1LLR0BX_dKu6ZOsYQ',
        sheetName: 'எம்மைப்பற்றி',
      ).sheetData();

      // A temperory list to hold retrieved items
      final List<About> loadedItems = [];

      // This block will only run and add retrieved items to `loadedItems` list
      // If and only if there are no empty items in fetched data
      if (values.length > 0) {
        for (var i = 1; i < values.length; i++) {
          // On our spread sheet if there are `-` in either one of title or contents
          // Cell instead of contents the particular item will not add into `loadedItems` list
          if (values[i][0] != "-" && values[i][1] != "-") {
            loadedItems.add(
              About(
                title: values[i][0],
                contents: values[i][1],
              ),
            );
          }
        }
      }
      // Set the retrieved items or empty list to `_aboutList` array because
      // We gonna retrieve data from `_aboutList` to show it on a ListView.
      _aboutList = loadedItems;
      // Trigger to rebuild the UI
      notifyListeners();
    } catch (error) {
      // If there are any potential errors such as if the admin of spreadsheet
      // Entered wrong data like empty cells in important column instead of '-'
      // it will show empty paga with error message `there are no records` available
      // in this page. even if there are some data available in the sheet.
      // at that time you as a developer should figure out the problem by checking
      // the sheet itself and check whether the sheet id in the backend is matching
      // with the actual sheet placed on google drive.
      _aboutList = [];
      notifyListeners();
      // throw (error);
    }
  }
}
