import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

/// Thousands Separator Input Formatter
class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  /// Number Format
  final NumberFormat numberFormat = NumberFormat.decimalPattern();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    final value = double.parse(newValue.text.replaceAll(',', ''));
    final newText = numberFormat.format(value);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
