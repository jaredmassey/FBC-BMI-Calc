// Dart Libs
import 'package:flutter/material.dart';

// Other Packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// My Packages
import 'input_page_card.dart';
import 'icon_content.dart';

const Color inactiveCardBGColor = Color(0xFF111328);
const Color activeCardBGColor = Color(0xFF1D1E33);
const Color bottomContainerColor = Color(0xFFEB1555);
const double bottomContainerHeight = 80.0;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // 0: Male, 1: Female
  List<bool> genderCardActiveState = [false, false];

  Color getGenderCardColor(int gender) {
    return genderCardActiveState[gender]
        ? activeCardBGColor
        : inactiveCardBGColor;
  }

  void setGenderActiveState(int gender) {
    if (genderCardActiveState[gender]) {
      genderCardActiveState[gender] = false;
    } else {
      for (int i = 0; i < genderCardActiveState.length; i++) {
        genderCardActiveState[i] = false;
      }
      genderCardActiveState[gender] = true;
    }
  }

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
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        setGenderActiveState(0);
                      });
                    },
                    child: InputPageCard(
                      bgColor: getGenderCardColor(0),
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        setGenderActiveState(1);
                      });
                    },
                    child: InputPageCard(
                      bgColor: getGenderCardColor(1),
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: InputPageCard(
                    bgColor: activeCardBGColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: InputPageCard(
                    bgColor: activeCardBGColor,
                  ),
                ),
                Expanded(
                  child: InputPageCard(
                    bgColor: activeCardBGColor,
                  ),
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
