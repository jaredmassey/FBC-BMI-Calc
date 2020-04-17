import 'package:flutter/material.dart';

const double iconSize = 80.0;
const double spacerHeight = 15.0;
const TextStyle labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(fontColor),
);
const int fontColor = 0xFF8D8E98;

class IconContent extends StatelessWidget {
  IconContent({@required this.icon, @required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: iconSize,
        ),
        SizedBox(
          height: spacerHeight,
        ),
        Text(
          label,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
