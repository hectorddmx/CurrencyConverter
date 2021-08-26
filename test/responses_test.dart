// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';
import 'package:currency_converter/models/convert_response.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:developer' as developer;

void main() {
  test('Should be able to parse response for currency conversion', () {
    var s = '''{
  "success": true,
  "query": {
    "from": "USD",
    "to": "MXN",
    "amount": 1
  },
  "info": {
    "timestamp": 1629952383,
    "rate": 20.25153
  },
  "date": "2021-08-26",
  "result": 20.25153
}''';

    final convertResponse = convertResponseFromJson(s);
    print(convertResponse);
    print(jsonEncode(convertResponse));
  });
}
