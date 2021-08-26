import 'package:flutter_test/flutter_test.dart';
import 'package:currency_converter/models/convert_response.dart';
import 'package:currency_converter/requests/convert_request.dart';
import 'package:currency_converter/models/symbols_response.dart';
import 'package:currency_converter/requests/symbols_request.dart';
import "package:flutter_dotenv/flutter_dotenv.dart";
import 'dart:io';

void main() {
  dotenv.testLoad(fileInput: File('test/.env').readAsStringSync());

  /// Will leave this for now, but in reality It seems I would have to use
  /// something like mockito:
  /// https://flutter.dev/docs/cookbook/testing/unit/mocking
  // test('I should be able to get dotfiles', () async {
  //   dotenv.testLoad(fileInput: File('/.env').readAsStringSync());
  // });

  /// Sample test with expectLater
  /// The other ones first wait for the resposne

  // test(
  //     'I should be able to call the web request for currency conversion'
  //     ' and get a value of type Convert Response, if this breaks probably'
  //     ' you may be missing the test/.env file referenced here', () async {
  //   final conversionResponse = fetchConversion("MXN", "USD", 40);
  //   await expectLater(
  //       conversionResponse, completion(TypeMatcher<ConvertResponse>()));
  // });
  test(
      'Should be able to call web request for currency conversion and parse '
      'the result, if this breaks probably you may be missing the test/.env'
      ' file referenced here', () async {
    final conversionResponse = await fetchConversion("MXN", "USD", 40);
    expect(conversionResponse, TypeMatcher<ConvertResponse>());
    var jsonResponse = convertResponseToJson(conversionResponse);
    print(jsonResponse);
    expect(jsonResponse, isNotEmpty);
  });
  // Symbols
  test(
      'Should be able to call web request for symbols and parse the result, if this breaks'
      ' probably you may be missing the test/.env file referenced here',
      () async {
        final symbolsResponse = await fetchSymbols();
        expect(symbolsResponse, TypeMatcher<SymbolsResponse>());
        var jsonResponse = symbolsResponseToJson(symbolsResponse);
        print(jsonResponse);
        expect(jsonResponse, isNotEmpty);
      });
}
