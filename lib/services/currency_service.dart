import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyService {
  final String apiKey =
      '2d04673d9044f965aa1fc2fd'; // API từ https://www.exchangerate-api.com
  final String baseUrl = 'https://v6.exchangerate-api.com/v6';

  Future<double> getExchangeRate(String fromCurrency, String toCurrency) async {
    final url = Uri.parse('$baseUrl/$apiKey/latest/$fromCurrency');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['conversion_rates'][toCurrency] ?? 1.0).toDouble();
    } else {
      throw Exception('Failed to load exchange rate');
    }
  }
}
