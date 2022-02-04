import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColor= Color(0xFF1D1E33);
const inactiveCardColor= Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

enum Gender {
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  Gender selectedGenger;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children:<Widget> [
          Expanded(child: Row(
            children:<Widget>[
              Expanded(
                child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGenger = Gender.male;
                      });
                    },
                    color:selectedGenger == Gender.male ? activeCardColor:inactiveCardColor,
                    cardChild:IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    )
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGenger = Gender.female;
                    });
                  },
                  color:selectedGenger == Gender.female ? activeCardColor:inactiveCardColor,
                    cardChild:IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    )
                )
              ),
            ]
          )),
          Expanded(child:
              ReusableCard(color:activeCardColor)
            ),
          Expanded(child:
            ReusableCard(color:activeCardColor),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            height: bottomContainerHeight,
            width: double.infinity,
          )
        ],
      )
    );
  }
}



