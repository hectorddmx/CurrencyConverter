import 'dart:convert';

// Generated with https://app.quicktype.io/ and then adapted for null-safety
// by hand

// To parse this JSON data, do
//
//     final convertResponse = convertResponseFromJson(jsonString);

ConvertResponse convertResponseFromJson(String str) =>
    ConvertResponse.fromJson(json.decode(str));

String convertResponseToJson(ConvertResponse data) =>
    json.encode(data.toJson());

class ConvertResponse {
  ConvertResponse({
    this.success,
    this.query,
    this.info,
    this.date,
    this.result,
    // this.error,
  });

  bool? success;
  Query? query;
  Info? info;
  DateTime? date;
  double? result;

  // CurrencyResponseError? error;

  factory ConvertResponse.fromJson(Map<String, dynamic> json) =>
      ConvertResponse(
        success: json["success"],
        query: Query.fromJson(json["query"]),
        info: Info.fromJson(json["info"]),
        date: DateTime.parse(json["date"]),
        result: json["result"].toDouble(),
        // error: CurrencyResponseError.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "query": query?.toJson(),
        "info": info?.toJson(),
        "date":
            "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "result": result,
        // "error": error?.toJson(),
      };
}

class Info {
  Info({
    required this.timestamp,
    required this.rate,
  });

  int? timestamp;
  double? rate;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        timestamp: json["timestamp"],
        rate: json["rate"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "rate": rate,
      };
}

class Query {
  Query({
    this.from,
    this.to,
    this.amount,
  });

  String? from;
  String? to;
  int? amount;

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        from: json["from"],
        to: json["to"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "amount": amount,
      };
}

class CurrencyResponseError {
  CurrencyResponseError({
    this.code,
    this.message,
  });

  String? code;
  String? message;

  factory CurrencyResponseError.fromJson(Map<String, dynamic> json) =>
      CurrencyResponseError(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
