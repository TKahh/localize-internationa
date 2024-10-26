import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart'; //gói intl
import 'package:demo/l10n/l10n.dart';
import 'package:demo/services/currency_service.dart';

class MyHomePage extends StatefulWidget {
  final Function(Locale) onLocaleChange;

  const MyHomePage({super.key, required this.onLocaleChange});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Locale _selectedLocale = L10n.locales.first;
  final CurrencyService _currencyService = CurrencyService();
  double _convertedAmount = 0.0;
  final double _amount = 120450.125; // Số tiền gốc mặc định

  @override
  void initState() {
    super.initState();
    _convertCurrency(); // Thực hiện chuyển đổi khi khởi động ứng dụng
  }

  Future<void> _convertCurrency() async {
    String fromCurrency = 'USD'; // Tiền tệ mặc định là USD
    String toCurrency;

    // Xác định mã tiền tệ cần chuyển đổi
    if (_selectedLocale.languageCode == 'vi') {
      toCurrency = 'VND';
    } else if (_selectedLocale.languageCode == 'ja') {
      toCurrency = 'JPY ';
    } else {
      toCurrency = 'USD '; // Mặc định là USD
    }

    //API để lấy tỷ giá chuyển đổi từ money mặc định sang đơn vị tiền tệ mới
    double rate =
        await _currencyService.getExchangeRate(fromCurrency, toCurrency);
    setState(() {
      _convertedAmount = _amount * rate;
    });
  }

  @override
  Widget build(BuildContext context) {
    Locale currentLocale =
        Localizations.localeOf(context); // Lấy ngôn ngữ hiện tại của ứng dụng

    String formattedDate = DateFormat.yMMMMEEEEd(currentLocale.toString())
        .format(DateTime.now()); // Định dạng ngày giờ theo ngôn ngữ hiện tại
    String formattedTime =
        DateFormat.jm(currentLocale.toString()).format(DateTime.now());

    // Định dạng tiền tệ
    String formattedCurrency =
        NumberFormat.currency(locale: currentLocale.toString())
            .format(_convertedAmount);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!
            .language), // Hiển thị tên ngôn ngữ hiện tại
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.helloWorld, // Hiển thị lời chào
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              '${AppLocalizations.of(context)!.todayIs} $formattedDate',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '${AppLocalizations.of(context)!.currntime}: $formattedTime',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            Text(
              '${AppLocalizations.of(context)!.money}: $formattedCurrency', // Hiển thị giá trị tiền tệ theo ngôn ngữ hiện tại
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            DropdownButton<Locale>(
              value: _selectedLocale,
              items: L10n.locales.map(
                (Locale locale) {
                  return DropdownMenuItem<Locale>(
                    value: locale,
                    child: Text(
                      locale.languageCode == 'en'
                          ? 'English'
                          : locale.languageCode == 'vi'
                              ? 'Tiếng Việt'
                              : 'Japanese',
                    ),
                  );
                },
              ).toList(),
              onChanged: (Locale? newLocale) {
                if (newLocale != null) {
                  setState(() {
                    _selectedLocale = newLocale;
                  });
                  widget.onLocaleChange(newLocale);
                  _convertCurrency(); // Chuyển đổi số tiền when change languagé
                }
              },
            ),
            Text(L10n.getFlag(Localizations.localeOf(context).languageCode)),
          ],
        ),
      ),
    );
  }
}
