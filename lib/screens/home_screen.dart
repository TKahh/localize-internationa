import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart'; //gói intl
import 'package:demo/l10n/l10n.dart';

class MyHomePage extends StatefulWidget {
  final Function(Locale) onLocaleChange;

  const MyHomePage({super.key, required this.onLocaleChange});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Locale _selectedLocale = L10n.locales.first;
  
  @override
  Widget build(BuildContext context) {
    Locale currentLocale =
        Localizations.localeOf(context); // Lấy ngôn ngữ hiện tại của ứng dụng

    String formattedDate = DateFormat.yMMMMEEEEd(currentLocale.toString())
        .format(DateTime.now()); // Định dạng ngày giờ theo ngôn ngữ hiện tại
    String formattedTime =
        DateFormat.jm(currentLocale.toString()).format(DateTime.now());

    // Định dạng tiền tệ
    double amount = 12000.125;
    String formattedCurrency =
        NumberFormat.currency(locale: currentLocale.toString()).format(amount);

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
                      locale.languageCode == 'en' ? 'English' : locale.languageCode == 'vi' ? 'Tiếng Việt' : 'Japanese',
                    ),
                  );
                },
              ).toList(),
              onChanged: (Locale ? newLocale) {
                if (newLocale != null) {
                  setState(() {
                    _selectedLocale = newLocale;
                  });
                  widget.onLocaleChange(newLocale);
                }
              },
            ),
            Text(L10n.getFlag(Localizations.localeOf(context)
                .languageCode)), // Hiển thị biểu tượng cờ
          ],
        ),
      ),
    );
  }
}
