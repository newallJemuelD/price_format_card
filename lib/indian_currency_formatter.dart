import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:math';

// class IndianCurrencyFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     final regEx = RegExp(r'^\d*\.?\d*');
//     final String? newString = regEx.stringMatch(newValue.text);
//     print(newString);

//     return newString == newValue.text ? newValue : oldValue;
//   }
// }

// void _formatter(String newText) {
// final NumberFormat format = NumberFormat.simpleCurrency(
//   locale: 'en_IN',
//   name: 'INR',
//   // symbol: '₹',
//   // // decimalDigits: _hasDecimalValue ? 2 : 0,
//   decimalDigits: 0,
// );

// _newNum = num.tryParse(newText) ?? 0;

// // _newString = (_isNegative ? '-' : '') + format.format(_newNum).trim();
// result = format.format(_newNum);
// result = '\$' + newText;
// }

//FORMATTER WITHOUT DECIMALS

// //Referred the currency_text_input_formatter package - https://github.com/gtgalone/currency_text_input_formatter

// class IndianCurrencyFormatter extends TextInputFormatter {
//   num _newNum = 0;
//   String _newString = '';
//   bool _isNegative = false;
//   // bool _hasDecimalValue = false;

//   void _formatter(String newText) {
//     final NumberFormat format = NumberFormat.currency(
//       locale: 'en_IN',
//       name: 'INR',
//       symbol: '₹',
//       // decimalDigits: _hasDecimalValue ? 2 : 0,
//       decimalDigits: 0,
//     );

//     _newNum = num.tryParse(newText) ?? 0;

//     // _newString = (_isNegative ? '-' : '') + format.format(_newNum).trim();
//     _newString = format.format(_newNum).trim();
//   }

//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     // final bool isInsertedCharacter =
//     //     oldValue.text.length + 1 == newValue.text.length &&
//     //         newValue.text.startsWith(oldValue.text);
//     final bool isRemovedCharacter =
//         oldValue.text.length - 1 == newValue.text.length &&
//             oldValue.text.startsWith(newValue.text);

//     // _isNegative = newValue.text.startsWith('-');
//     // _hasDecimalValue = newValue.text.contains('.');
//     String newText = newValue.text.replaceAll(RegExp('[^0-9]'), '');
//     print(newText);

//     if (isRemovedCharacter && !_lastCharacterIsDigit(oldValue.text)) {
//       final int length = newText.length - 1;
//       newText = newText.substring(0, length > 0 ? length : 0);
//     }

//     _formatter(newText);

//     if (newText.trim() == '' || newText == '00' || newText == '000') {
//       return TextEditingValue(
//         text: _isNegative ? '-' : '',
//         selection: TextSelection.collapsed(offset: _isNegative ? 1 : 0),
//       );
//     }

//     return TextEditingValue(
//       text: _newString,
//       selection: TextSelection.collapsed(offset: _newString.length),
//     );
//   }

//   static bool _lastCharacterIsDigit(String text) {
//     final String lastChar = text.substring(text.length - 1);
//     return RegExp('[0-9]').hasMatch(lastChar);
//   }
// }

//COMBINING DECIMAL VALUE AND FORMATTER ATTEMPT - FAILED

class IndianCurrencyFormatter extends TextInputFormatter {
  num _newNum = 0;
  String result = '';

  void _formatter(String newText) {
    final NumberFormat format = NumberFormat(
      "##,##,###.##",
      "en_IN",
    );

    _newNum = num.tryParse(newText) ?? 0;
    result = format.format(_newNum);

    // return result = '\$' + newText;
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final regEx = RegExp(r'^\d*\.?\d*');
    final String? newString = regEx.stringMatch(newValue.text);
    print(newString);
    print(newValue.text);

    _formatter(newString!);
    // String resultString = _formatter(newString);
    // TextEditingValue result = ('\$' + newValue);

    // return newString == newValue.text ? newValue : oldValue;

    // return newValue;

    return TextEditingValue(
      text: result,
      selection: TextSelection.collapsed(offset: result.length),
    );
  }
}
