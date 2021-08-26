import 'package:flutter/material.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

class SourceCurrencyWidget extends StatefulWidget {
  const SourceCurrencyWidget({
    Key? key,
  }) : super(key: key);

  @override
  _SourceCurrencyWidgetState createState() => _SourceCurrencyWidgetState();
}

class _SourceCurrencyWidgetState extends State<SourceCurrencyWidget> {
  double currencyValue = 0.0;
  String currencyNameValue = 'Peso';
  String codeValue = 'Peso';
  var controller = new MoneyMaskedTextController(
      initialValue: 0.0,
      leftSymbol: "\$",
      precision: 2,
      decimalSeparator: ".",
      thousandSeparator: ",");

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(children: [
                  Text("\$ $codeValue"),
                  Spacer(),
                  DropdownButton<String>(
                    value: currencyNameValue,
                    icon: const Icon(Icons.arrow_drop_down_outlined),
                    iconSize: 24,
                    onChanged: (String? newValue) {
                      setState(() {
                        currencyNameValue = newValue!;
                        codeValue = currencyNameValue;
                      });
                    },
                    //TODO: Fetch this from symbols API
                    items: <String>['Euro', 'Peso', 'Dollar']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ]),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: controller,
                decoration: InputDecoration(border: InputBorder.none),
                style: TextStyle(color: Colors.purple, fontSize: 40),
                onChanged: (text) {
                  print('First text field: $text');
                },
              )),
        ]),
      )),
    );
  }
}
