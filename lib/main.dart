import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:currency_converter/ui/views/currency_widget.dart';

import 'package:currency_converter/business_logic/models/currency_conversion_response.dart';
import 'package:currency_converter/business_logic/models/symbols_response.dart';

import 'package:currency_converter/services/web_api/symbols_request.dart';
import 'package:currency_converter/services/web_api/currency_conversion_request.dart';


Future main() async {
  await fetchSecrets();
  runApp(MyApp());
}

Future<void> fetchSecrets() async {
  await dotenv.load(fileName: ".env");
  // String? apiKey = dotenv.maybeGet('EXCHANGERATESAPI_KEY', fallback: "da");
  // print("apiKey: $apiKey");
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(title: 'Flutter Currency Converter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _currencyValue = 0.0;
  double _convertedCurrencyValue = 0.0;
  late Future<SymbolsResponse> futureSymbols;
  late Future<CurrencyConversionResponse> futureCurrencyConversion;

  @override
  void initState() {
    super.initState();
    futureSymbols = fetchSymbols();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    futureCurrencyConversion = fetchCurrencyConversion("USD", "MXN", 10);
  }

  void _convert() {
    setState(() {
      _convertedCurrencyValue = _currencyValue * 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double WIDTH = 300;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: Center(
          child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CurrencyWidget(currencyWidgetType: CurrencyWidgetType.edit),
              Card(
                  elevation: 8,
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(150),
                  ),
                  child: Container(
                      width: 50,
                      height: 50,
                      child: IconButton(
                        icon: Icon(
                          Icons.swap_vert_sharp,
                          size: 33,
                        ),
                        onPressed: () {
                          print("Pressed switch currencies button");
                        },
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white))),
              CurrencyWidget(currencyWidgetType: CurrencyWidgetType.display),
            ]),
      )),
    );
  }
}

