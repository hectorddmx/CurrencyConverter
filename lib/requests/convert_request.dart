import 'package:http/http.dart' as http;
import 'package:currency_converter/models/convert_response.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<ConvertResponse> fetchAlbum() async {
  String? apiKey = dotenv.maybeGet('EXCHANGERATESAPI_KEY', fallback: "da");
  print("apiKey: $apiKey");
  if (apiKey == null) {
    throw Exception('Failed to get API KEY');
  }

  final response = await http.get(Uri.parse(
      'https://api.exchangeratesapi.io/v1/convert?access_key=$apiKey&from=USD&to=MXN&amount=1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return convertResponseFromJson(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load conversion response');
  }
}
