// Dart Libs
import 'package:flutter/material.dart';

// My Packages
import '../constants.dart';
import 'round_icon_button.dart';

// Other Packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdjustableNumericContent extends StatelessWidget {
  AdjustableNumericContent(
      {@required this.value,
      @required this.setValue,
      @required this.labelText,
      this.unitText = ''});

  final int value;
  final Function setValue;
  final String labelText;
  final String unitText;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          labelText,
          style: kLabelTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: <Widget>[
            Text(
              value.toString(),
              style: kNumberTextStyle,
            ),
            Text(
              unitText,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: () {
                setValue(-1);
              },
            ),
            SizedBox(
              width: 10.0,
            ),
            RoundIconButton(
              onPressed: () {
                setValue(1);
              },
              icon: FontAwesomeIcons.plus,
            ),
          ],
        ),
      ],
    ));
  }
}

//class AdjustableNumericContent extends StatefulWidget {
//  AdjustableNumericContent(
//      {@required BuildContext context,
//      @required this.labelText,
//      @required this.initValue,
//      this.unitText = ''});
//  final String labelText;
//  final int initValue;
//  final String unitText;
//  @override
//  _AdjustableNumericContentState createState() =>
//      _AdjustableNumericContentState(labelText, initValue, unitText);
//}
//
//class _AdjustableNumericContentState extends State<AdjustableNumericContent> {
//  _AdjustableNumericContentState(this.labelText, this.value, this.unitText);
//  int value;
//  String labelText;
//  String unitText;
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//        child: Column(
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: <Widget>[
//        Text(
//          labelText,
//          style: kLabelTextStyle,
//        ),
//        Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          textBaseline: TextBaseline.alphabetic,
//          crossAxisAlignment: CrossAxisAlignment.baseline,
//          children: <Widget>[
//            Text(
//              value.toString(),
//              style: kNumberTextStyle,
//            ),
//            Text(
//              unitText,
//            )
//          ],
//        ),
//        Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            RoundIconButton(
//              icon: FontAwesomeIcons.minus,
//              onPressed: () {
//                setState(() {
//                  value--;
//                });
//              },
//            ),
//            SizedBox(
//              width: 10.0,
//            ),
//            RoundIconButton(
//              onPressed: () {
//                setState(() {
//                  value++;
//                });
//              },
//              icon: FontAwesomeIcons.plus,
//            ),
//          ],
//        ),
//      ],
//    ));
//  }
//}
