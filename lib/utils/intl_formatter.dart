import 'package:intl/intl.dart';

import 'package:molteo_books/values/regex.dart';

class MbFormatter {
  static String formatPhone(String tel) {
    if (tel.length == 10) {
      return "${tel.substring(0, 3)} ${tel.substring(3, 6)} ${tel.substring(6)}";
    } else if (tel.length == 11) {
      return "${tel.substring(0, 4)} ${tel.substring(4, 7)} ${tel.substring(7)}";
    } else {
      tel = tel.padRight(13, "*");
      return "+${tel.substring(0, 3)} ${tel.substring(3, 6)} ${tel.substring(6, 9)} ${tel.substring(9)}";
    }
  }

  static String formatMobileNumber(
    String mobileNum, {
    bool hasCountryCode = true,
  }) {
    mobileNum = mobileNum.replaceAll(" ", '');
    if (hasCountryCode) {
      mobileNum = mobileNum.length == 10 ? mobileNum : mobileNum.substring(1);
      return mobileNum;
    } else {
      return mobileNum;
    }
  }

  static String formatDate(String date, {String format}) {
    DateFormat formatter = format == null ? DateFormat.yMd()  : DateFormat(format);
    if (date == null || date.isEmpty) {
      return formatter.format(DateTime.now());
    }
    final datetime = DateTime.tryParse(date);
    if (datetime == null) {
      return formatter.format(DateTime.now());
    }
    return formatter.format(datetime);
  }


  static String formatTimeDate(String date) {
    return formatDate(date, format: 'hh:mm a, dd MMMM yyyy');
  }

  static String formatTime(String date) {
    return formatDate(date, format: 'hh:mm a');
  }

  static String formatDateShort(String date) {
    return formatDate(date, format: 'MMMM d, y');
  }

  static String formatDateTime(String date) {
    return formatDate(date, format: 'y/M/d H:mm:s');
  }

  static String formatDateMedium(String date) {
    return formatDate(date, format: 'd MMMM, y. H:mm:s');
  }

  static String formatDateLong(String date) {
    return formatDate(date, format: DateFormat.yMMMMEEEEd().pattern);
  }

  static String capitalise(String text) {
    try {
      if (text == null || text.isEmpty) {
      return text ?? "";
    } else if (text.length == 1) {
      return text.toUpperCase();
    } else {
      final textSpan = text.split(" ").map((it) {
        if (it.isEmpty) {
          return it;
        }
        if (it.length == 1) {
          return it.toUpperCase();
        }
        final firstChar = it[0];
        return "${firstChar.toUpperCase()}${it.substring(1).toLowerCase()}";
      });
      return textSpan.join(" ");
    }
    } catch(_) {
      return text;
    }
  }

  static String formatCurrency(String amount, {bool spaceIcon = false, bool ignoreSymbol = false, String symbol}) {
    final formatter = NumberFormat.currency(
      locale: "en_NG",
      name: ignoreSymbol ? '' : symbol ?? '\$',
      symbol: ignoreSymbol ? "" : "$symbol${spaceIcon ? " " : ""}",
      decimalDigits: 2,
    );
    if (amount == null || amount.isEmpty || amount == "null") {
      return "$symbol-.--";
    }
    amount = amount.replaceAll(RegExp(r'[^0-9\.]'), "");
    final amountDouble = double.tryParse(amount);
    if (amount == null || amountDouble == null) {
      return amount;
    }
    if (amountDouble == 0) {
      return "${symbol}0.00";
    }
    return formatter.format(amountDouble);
  }

  static String formatXML(String xmlString) {
    String parsedString = xmlString.replaceAll(xmlRegex, "");
    return parsedString.trim();
  }
}
