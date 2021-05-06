import 'package:flutter/foundation.dart';
import 'package:kky_ds/helper/GoogleSheetsApi.dart';

class FieldOfficer {
  final String divisionName, gnName, phone, gender, image;

  const FieldOfficer({
    @required this.phone,
    @required this.divisionName,
    @required this.gnName,
    @required this.gender,
    this.image,
  });
}

class FieldOfficerProvider with ChangeNotifier {
  List<FieldOfficer> _list = [];

  List<FieldOfficer> get gnDivisions {
    return [..._list];
  }

  Future<void> fetchAndUpdateList() async {
    try {
      final values = await GoogleSheets(
              sheetId: '1KpiDveVnBwMVYf4Y_tG6yMBGh_yvmiS3eQPuyXi88eM',
              sheetName: 'FO')
          .sheetData();
      final List<FieldOfficer> loadedProducts = [];
      for (var i = 1; i < values.length; i++) {
        loadedProducts.add(
          FieldOfficer(
            gnName: values[i][0],
            gender: values[i][1],
            divisionName: values[i][2],
            phone: values[i][3],
            image: values[i][4],
          ),
        );
      }
      _list = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
