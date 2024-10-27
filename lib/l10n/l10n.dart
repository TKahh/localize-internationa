// Defines the Locales that the application supports
// list of locales that we are going to use -- danh sách địa phương
// liệt kê các ngôn ngữ (locales) mà ứng dụng hỗ trợ
import 'package:flutter/material.dart';

class L10n {
  static const locales = [
    Locale('en', 'US'), //US,vn,ja are country code
    Locale('vi', 'VN'),
    Locale('ja', 'JP')
  ];
  
  static String getFlag(String languageCode) {
    switch (languageCode) {
      case 'en':
        return '🇺🇸'; 
      case 'vi':
        return '🇻🇳'; 
      case 'ja':
        return '🇯🇵';
      default:
        return '';
    }
  }
}
