import 'package:flutter/foundation.dart';
import 'package:kky_ds/helper/GoogleSheetsApi.dart';

class GNDivision {
  final String divisionName, gnName, phone, gender, image;

  const GNDivision({
    @required this.phone,
    @required this.divisionName,
    @required this.gnName,
    @required this.gender,
    this.image,
  });
}

class GNDivisionProvider with ChangeNotifier {
  List<GNDivision> _list = [];

  List<GNDivision> get gnDivisions {
    return [..._list];
  }

  Future<void> fetchAndUpdateList() async {
    try {
      final values = await GoogleSheets(
              sheetId: '1KpiDveVnBwMVYf4Y_tG6yMBGh_yvmiS3eQPuyXi88eM',
              sheetName: 'GN')
          .sheetData();
      final List<GNDivision> loadedProducts = [];
      for (var i = 1; i < values.length; i++) {
        loadedProducts.add(
          GNDivision(
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
