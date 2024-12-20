import 'package:intl/intl.dart';

class HumanFormats {
  // No crear una instancia para llamar a uno de estos metodos
  static String humanReadbleNumber (double number){
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format(number);
    return formatterNumber;   
  }
}