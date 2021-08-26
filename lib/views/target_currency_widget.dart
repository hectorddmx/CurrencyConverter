// import 'package:flutter/material.dart';
//
// class TargetCurrencyWidget extends StatefulWidget {
//   const TargetCurrencyWidget({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   _TargetCurrencyWidgetState createState() => _TargetCurrencyWidgetState();
// }
//
// class _TargetCurrencyWidgetState extends State<TargetCurrencyWidget> {
//   String currencyNameValue = 'Peso';
//   String codeValue = 'Peso';
//   double currencyValue = 0.0;
//
//   @override
//   Widget build(BuildContext context) {
//     const _labelsTextStyle = TextStyle(
//         color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500);
//     const _quantityTextStyle = TextStyle(
//         color: Colors.purple, fontSize: 40, fontWeight: FontWeight.w300);
//     var dropDownButton = buildDropdownButton(_labelsTextStyle);
//     Padding currencyRow = buildCurrencyRow(_labelsTextStyle, dropDownButton);
//     return Padding(
//       padding: const EdgeInsets.all(18.0),
//       child: Card(
//           elevation: 8,
//           shadowColor: Colors.white,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//           // borderOnForeground: false,
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(children: [
//               Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Row(
//                     children: [
//                       Text("\$62.67", style: _quantityTextStyle),
//                       Spacer(),
//                     ],
//                   )),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Column(
//                   children: [
//                     Row(children: [
//                       Text("\$ $codeValue"),
//                       Spacer(),
//                       DropdownButton<String>(
//                         value: currencyNameValue,
//                         icon: const Icon(Icons.arrow_drop_down_outlined),
//                         iconSize: 24,
//                         onChanged: (String? newValue) {
//                           setState(() {
//                             currencyNameValue = newValue!;
//                             codeValue = currencyNameValue;
//                           });
//                         },
//                         //TODO: Fetch this from symbols API
//                         items: <String>['Euro', 'Peso', 'Dollar']
//                             .map<DropdownMenuItem<String>>((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(value),
//                           );
//                         }).toList(),
//                       )
//                     ]),
//                   ],
//                 ),
//               ),
//             ]),
//           )),
//     );
//   }
// }
