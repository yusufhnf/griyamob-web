import 'package:griyaadmin/utils/strings.dart';

class Validation {
  String validateEmail(String value) {
    if (value != '' && !value.contains('@')) {
      return Strings.responEmailTidakValid;
    } else if (value == '') {
      return Strings.responEmailKosong;
    }
    return null;
  }

  String validatePassword(String value) {
    if (value != '' && value.length <= 8) {
      return Strings.responPasswordKurang;
    } else if (value == '') {
      return Strings.responPasswordKosong;
    }
    return null;
  }

  String validatePhone(String value) {
    if (value != '' && value[0] != '8') {
      return Strings.responPhoneSalah;
    } else if (value == '') {
      return Strings.responPhoneKosong;
    }
    return null;
  }

  String validateName(String value) {
    if (value == '') {
      return Strings.responNameKosong;
    }
    return null;
  }

  String validateField(String value) {
    if (value == '') {
      return Strings.responFormKosong;
    }
    return null;
  }

  String validateNominal(String value, int saldo) {
    int convertValue = int.parse(value);
    if (convertValue < 10000) {
      return Strings.responNominalMin;
    }
    /* else if (convertValue > saldo) {
      return Strings.responNominalSaldoTidakCukup;
    } */
    return null;
  }
}
