import 'package:flutter/material.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:money2/money2.dart';

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
    const _labelsTextStyle = TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500);
    const _quantityTextStyle = TextStyle(
        color: Colors.purple, fontSize: 40, fontWeight: FontWeight.w300);

    var dropDownButton = buildDropdownButton(_labelsTextStyle);

    Padding currencyTypeRow =
        buildCurrencyTypeRow(_labelsTextStyle, dropDownButton);
    Padding currencyRow =
        buildCurrencyRow(_quantityTextStyle, this.currencyWidgetType);

    Card editableCurrencyCard =
        buildCurrencyCard(currencyTypeRow, currencyRow, currencyWidgetType);

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: editableCurrencyCard,
    );
  }

  Card buildCurrencyCard(Padding currencyRow, Padding quantityRow,
      CurrencyWidgetType currencyWidgetType) {
    var _verticalDirection = currencyWidgetType == CurrencyWidgetType.edit
        ? VerticalDirection.down
        : VerticalDirection.up;
    var editableCurrencyCard = Card(
        elevation: 8,
        shadowColor: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
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
      TextStyle _quantityTextStyle, CurrencyWidgetType currencyWidgetType) {
    Widget label;
    switch (currencyWidgetType) {
      case CurrencyWidgetType.edit:
        {
          label = TextField(
            keyboardType: TextInputType.number,
            controller: controller,
            decoration: InputDecoration(border: InputBorder.none),
            style: _quantityTextStyle,
            onChanged: (text) {
              print('First text field: $text');
            },
          );
        }
        break;
      case CurrencyWidgetType.display:
        {
          label = Row(
            children: [Text("\$62.67", style: _quantityTextStyle), Spacer()],
          );
        }
        break;
    }
    return Padding(padding: const EdgeInsets.all(10.0), child: label);
  }

  Padding buildCurrencyTypeRow(
      TextStyle _labelsTextStyle, DropdownButton<String> dropDownButton) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(children: [
            Text("\$ $codeValue", style: _labelsTextStyle),
            Spacer(),
            DropdownButtonHideUnderline(
              child: dropDownButton,
            )
          ]),
        ],
      ),
    );
  }

  DropdownButton<String> buildDropdownButton(TextStyle _labelsTextStyle) {
    return DropdownButton<String>(
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
      style: _labelsTextStyle,
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
          child: Text(value, style: _labelsTextStyle),
        );
      }).toList(),
    );
  }
}
