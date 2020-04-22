// Dart Libs
import 'package:flutter/material.dart';
import 'file:///C:/Users/Boone/source/flutter_fiddle/flutter_app/bmi-calculator-flutter/lib/components/adjustable_numeric_content.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';

// Other Packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// My Packages
import 'package:bmi_calculator/components/reusable_page_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 80;
  int age = 25;

  Map<Gender, bool> genderCardActiveState = {
    Gender.male: false,
    Gender.female: false,
  };

  Color getGenderCardColor(Gender gender) {
    return genderCardActiveState[gender]
        ? kActiveCardBGColor
        : kInactiveCardBGColor;
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
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
                  child: ReusableCard(
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
            child: ReusableCard(
              bgColor: kActiveCardBGColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text('cm'),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 16.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                      overlayColor: Color(0x29EB1555),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: kMinHeightCM,
                      max: kMaxHeightCM,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onTapFunction: () {},
                    bgColor: kActiveCardBGColor,
                    cardChild: AdjustableNumericContent(
                      labelText: 'WEIGHT',
                      unitText: 'kg',
                      value: weight,
                      setValue: (change) {
                        setState(() {
                          weight += change;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    bgColor: kActiveCardBGColor,
                    cardChild: AdjustableNumericContent(
                      labelText: 'AGE',
                      value: age,
                      setValue: (int change) {
                        setState(() {
                          age += change;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiInterpretation: calc.getInterpretation(),
                            bmiResult: calc.getBMI(),
                            bmiResultText: calc.getResultText(),
                          )));
            },
          ),
        ],
      ),
    );
  }
}
