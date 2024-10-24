// list of locales that we are going to use -- danh sách địa phương
// liệt kê các ngôn ngữ (locales) mà ứng dụng hỗ trợ
import 'package:flutter/material.dart';

class L10n {
  static const locales = [
    Locale('en', 'US'), //US và VN là mã quốc gia
    Locale('vi', 'VN'),
    Locale('ja', 'JP')
  ];
  // Trả về biểu tượng cờ cho ngôn ngữ
  static String getFlag(String languageCode) {
    switch (languageCode) {
      case 'en':
        return '🇺🇸'; // Cờ Mỹ
      case 'vi':
        return '🇻🇳'; // Cờ Việt Nam
      case 'ja':
        return '🇯🇵';
      default:
        return '';
    }
  }
}
