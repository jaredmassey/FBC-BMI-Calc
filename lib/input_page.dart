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

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Map<Gender, bool> genderCardActiveState = {
    Gender.male: false,
    Gender.female: false,
  };

  Color getGenderCardColor(Gender gender) {
    return genderCardActiveState[gender]
        ? activeCardBGColor
        : inactiveCardBGColor;
  }

  void setGenderActiveState(Gender gender) {
    if (genderCardActiveState[gender]) {
      genderCardActiveState[gender] = false;
    } else {
      for (Gender gender in genderCardActiveState.keys) {
        genderCardActiveState[gender] = false;
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
                  child: InputPageCard(
                    onTapFunction: () {
                      setState(() {
                        setGenderActiveState(Gender.male);
                      });
                    },
                    bgColor: getGenderCardColor(Gender.male),
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: InputPageCard(
                    onTapFunction: () {
                      setState(() {
                        setGenderActiveState(Gender.female);
                      });
                    },
                    bgColor: getGenderCardColor(Gender.female),
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
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
