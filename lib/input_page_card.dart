import 'package:flutter/material.dart';

class InputPageCard extends StatelessWidget {
  InputPageCard({@required this.bgColor, this.cardChild});

  final Color bgColor;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
//          color: Color(0xFF1D1E33),
        color: bgColor,
      ),
    );
  }
}
