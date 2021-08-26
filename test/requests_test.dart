import 'package:flutter_test/flutter_test.dart';
import 'package:currency_converter/models/convert_response.dart';
import 'package:currency_converter/requests/convert_request.dart';
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
  test('I should be able to call the web request and get a value of type '
      'Convert Response, if this breaks probably you may be missing the '
      'test/.env file referenced here', () async {
    final album = fetchAlbum();
    await expectLater(album, completion(TypeMatcher<ConvertResponse>()));
  });
  test('Should be able to call web request and parse the result, if this breaks'
      ' probably you may be missing the test/.env file referenced here', () async{
    final album = await fetchAlbum();
    expect(album, TypeMatcher<ConvertResponse>());
    var jsonResponse = convertResponseToJson(album);
    print(jsonResponse);
    expect(jsonResponse, isNotEmpty);
  });
}