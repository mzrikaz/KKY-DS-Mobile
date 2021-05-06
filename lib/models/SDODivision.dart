import 'package:flutter/foundation.dart';
import 'package:kky_ds/helper/GoogleSheetsApi.dart';

class SDODivision {
  final String divisionName, gnName, phone, gender, image;

  const SDODivision({
    @required this.phone,
    @required this.divisionName,
    @required this.gnName,
    @required this.gender,
    this.image,
  });
}

class SDODivisionProvider with ChangeNotifier {
  List<SDODivision> _list = [];

  List<SDODivision> get gnDivisions {
    return [..._list];
  }

  Future<void> fetchAndUpdateList() async {
    try {
      final values = await GoogleSheets(
              sheetId: '1KpiDveVnBwMVYf4Y_tG6yMBGh_yvmiS3eQPuyXi88eM',
              sheetName: 'SDO')
          .sheetData();
      final List<SDODivision> loadedProducts = [];
      for (var i = 1; i < values.length; i++) {
        loadedProducts.add(
          SDODivision(
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
