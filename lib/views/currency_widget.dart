import 'package:flutter/material.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:money2/money2.dart';
import 'package:currency_converter/Constants/style_constants.dart';

enum CurrencyWidgetType { edit, display }

class CurrencyWidget extends StatefulWidget {
  final CurrencyWidgetType currencyWidgetType;

  const CurrencyWidget({
    Key? key,
    required this.currencyWidgetType,
  }) : super(key: key);

  @override
  _CurrencyWidgetState createState() =>
      _CurrencyWidgetState(currencyWidgetType);
}

class _CurrencyWidgetState extends State<CurrencyWidget> {
  final CurrencyWidgetType currencyWidgetType;

  _CurrencyWidgetState(this.currencyWidgetType);

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

    Padding currencyTypeRow =
        buildCurrencyTypeRow(labelsTextStyle, this.currencyWidgetType);
    Padding currencyRow =
        buildCurrencyRow(quantityTextStyle, this.currencyWidgetType);

    Card editableCurrencyCard =
        buildCurrencyCard(currencyTypeRow, currencyRow, currencyWidgetType);

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 6, 18, 6),
      child: editableCurrencyCard,
    );
  }

  Card buildCurrencyCard(Padding currencyRow, Padding quantityRow,
      CurrencyWidgetType currencyWidgetType) {
    VerticalDirection _verticalDirection;
    if (currencyWidgetType == CurrencyWidgetType.edit) {
      _verticalDirection = VerticalDirection.down;
    } else {
      _verticalDirection = VerticalDirection.up;
    }
    var editableCurrencyCard = Card(
        elevation: 8,
        shadowColor: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
          child: Column(
            children: [
              currencyRow,
              quantityRow,
            ],
            verticalDirection: _verticalDirection,
          ),
        ));
    return editableCurrencyCard;
  }

  Padding buildCurrencyRow(
      TextStyle quantityTextStyle, CurrencyWidgetType currencyWidgetType) {
    Widget label;
    switch (currencyWidgetType) {
      case CurrencyWidgetType.edit:
        {
          label = TextField(
            keyboardType: TextInputType.number,
            controller: controller,
            decoration: InputDecoration(border: InputBorder.none, fillColor: Colors.red),
            style: quantityTextStyle,
            onChanged: (text) {
              print('First text field: $text');
            },
          );
        }
        break;
      case CurrencyWidgetType.display:
        {
          label = Row(
            children: [Text("\$62.67", style: quantityTextStyle), Spacer()],
          );
        }
        break;
    }
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
        child: label
    );
  }

  Padding buildCurrencyTypeRow(
      TextStyle labelsTextStyle, CurrencyWidgetType currencyWidgetType) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Column(
        children: [
          Row(children: [
            Text("\$ $codeValue", style: labelsTextStyle),
            Spacer(),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: currencyNameValue,
                icon: RotatedBox(
                    quarterTurns: 3,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 16,
                      ),
                      onPressed: null,
                    )),
                iconSize: 24,
                style: labelsTextStyle,
                underline: null,
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
                    child: Text(value, style: labelsTextStyle),
                  );
                }).toList(),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
