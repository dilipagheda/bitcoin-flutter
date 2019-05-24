//TODO: Add your imports here.
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const bitcoinAverageURL =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker';

class CoinData {
  static Future<List<String>> getCoinData(String currency) async {
    List<String> lastPrices = List<String>();

    for (String crypto in cryptoList) {
      String url = '$bitcoinAverageURL/$crypto$currency';

      var response = await http.get(url);
      if (response.statusCode == 200) {
        dynamic jsonResponse = convert.jsonDecode(response.body);
        lastPrices.add(jsonResponse['last'].toString());
        print('$url' + lastPrices.toString());
      } else {
        print("Request failed with status: ${response.statusCode}.");
      }
    }
    return lastPrices;
  }
}
