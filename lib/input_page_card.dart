import 'package:flutter/material.dart';

class InputPageCard extends StatelessWidget {
  InputPageCard({@required this.bgColor, this.cardChild, this.onTapFunction});

  final Color bgColor;
  final Widget cardChild;
  final Function onTapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapFunction();
      },
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
//          color: Color(0xFF1D1E33),
          color: bgColor,
        ),
      ),
    );
  }
}
