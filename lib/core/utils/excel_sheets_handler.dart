import 'package:excel/excel.dart';
import 'package:flutter/services.dart';

/// [ExcelSheetsHandler] class
class ExcelSheetsHandler {
  /// [readExcelData] method to read excel data
  static Future<List<Map<String, dynamic>>> readExcelData(
    String assetPath,
  ) async {
    final data = await rootBundle.load(assetPath);
    final bytes = data.buffer.asUint8List();
    final excel = Excel.decodeBytes(bytes);
    final dataList = <Map<String, dynamic>>[];

    for (final table in excel.tables.keys) {
      final sheet = excel.tables[table];
      var headers = <String?>[];

      for (var rowIndex = 0; rowIndex < sheet!.rows.length; rowIndex++) {
        final row = sheet.rows[rowIndex];

        // If headers are empty, use the first row as headers
        if (headers.isEmpty) {
          headers = row.map((cell) => cell?.value?.toString()).toList();
          continue; // Skip the header row for data rows
        }

        final rowData = <String, dynamic>{};
        for (var i = 0; i < row.length; i++) {
          if (row[i] != null && headers[i] != null) {
            rowData[headers[i]!] = convertCellValue(row[i]!.value);
          }
        }
        dataList.add(rowData);
      }
    }
    return dataList;
  }

  /// Convert cell value to basic JSON type
  static dynamic convertCellValue(dynamic value) {
    if (value is IntCellValue) {
      return value.value;
    } else if (value is TextCellValue) {
      return value.value;
    } else if (value is DoubleCellValue) {
      return value.value;
    } else if (value is BoolCellValue) {
      return value.value;
    } else if (value is DateCellValue) {
      return value;
    } else {
      return value.toString();
    }
  }
}
