import 'package:flutter/material.dart';
import 'input_page_card.dart';

const Color cardBGColor = Color(0xFF1D1E33);
const Color bottomContainerColor = Color(0xFFEB1555);
const double bottomContainerHeight = 80.0;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                InputPageCard(
                  bgColor: cardBGColor,
                ),
                InputPageCard(
                  bgColor: cardBGColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                InputPageCard(
                  bgColor: cardBGColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                InputPageCard(
                  bgColor: cardBGColor,
                ),
                InputPageCard(
                  bgColor: cardBGColor,
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            height: bottomContainerHeight,
            width: double.infinity,
            margin: EdgeInsets.only(top: 10.0),
          ),
        ],
      ),
    );
  }
}
