import 'dart:convert';

// Generated with https://app.quicktype.io/

// To parse this JSON data, do
//
//     final symbolsResponse = symbolsResponseFromJson(jsonString);

SymbolsResponse symbolsResponseFromJson(String str) =>
    SymbolsResponse.fromJson(json.decode(str));

String symbolsResponseToJson(SymbolsResponse data) =>
    json.encode(data.toJson());

class SymbolsResponse {
  SymbolsResponse({
    required this.success,
    required this.symbols,
  });

  bool success;
  Map<String, String> symbols;

  factory SymbolsResponse.fromJson(Map<String, dynamic> json) =>
      SymbolsResponse(
        success: json["success"],
        symbols: Map.from(json["symbols"])
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "symbols":
            Map.from(symbols).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
