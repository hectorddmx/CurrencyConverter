import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:currency_converter/views/currency_widget.dart';

Future main() async {
  await fetchSecrets();
  runApp(MyApp());
}

Future<void> fetchSecrets() async {
  await dotenv.load(fileName: ".env");
  // String? apiKey = dotenv.maybeGet('EXCHANGERATESAPI_KEY', fallback: "da");
  // print("apiKey: $apiKey");
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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

  void _convert() {
    setState(() {
      _convertedCurrencyValue = _currencyValue * 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.tealAccent,
        elevation: 0,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            CurrencyWidget(currencyWidgetType: CurrencyWidgetType.edit),
            CurrencyWidget(currencyWidgetType: CurrencyWidgetType.display),
          ])),
    );
  }
}
