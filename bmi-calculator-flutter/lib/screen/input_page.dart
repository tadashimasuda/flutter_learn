import 'package:bmi_calculator/screen/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';

enum Gender {
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = kinactiveCardColor;
  Color femaleCardColor = kinactiveCardColor;

  Gender selectedGenger;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    color:selectedGenger == Gender.male ? kactiveCardColor:kinactiveCardColor,
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
                  color:selectedGenger == Gender.female ? kactiveCardColor:kinactiveCardColor,
                    cardChild:IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    )
                )
              ),
            ]
          )),
          Expanded(child:
              ReusableCard(
                  color:kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('HEIGHT',style: klabelTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                              height.toString(),
                            style:kNumberTextStyle
                          ),
                          Text(
                              'cm',
                              style:klabelTextStyle
                          ),
                        ],
                      ),
                      SliderTheme(data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                      ),
                        child:Slider(
                          value: height.toDouble(),
                          min: 20.0,
                          max: 220.0,
                          activeColor: Color(0xFFEB1555),
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newValue){
                            setState(() {
                              height = newValue.round();
                            });
                          }
                      ),
                      )
                    ],
                  ),
              )
            ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: kactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('WEIGHT',style: klabelTextStyle),
                          Text(weight.toString(),style: kNumberTextStyle),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPress:(){
                                    setState(() {
                                      weight++;
                                    });
                                  }
                                ),
                                SizedBox(
                                    width:10
                                ),
                                RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPress:(){
                                      setState(() {
                                        weight--;
                                      });
                                    }
                                ),
                              ]
                            )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE',style: klabelTextStyle,),
                          Text(age.toString(),style: kNumberTextStyle,),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPress:(){
                                      setState(() {
                                        age++;
                                      });
                                    }
                                ),
                                SizedBox(
                                    width:10
                                ),
                                RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPress:(){
                                      setState(() {
                                        age--;
                                      });
                                    }
                                ),
                              ]
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>ResultsPage()));
            },
            child: Container(
              child: Center(
                  child: Text('CACLCULATOR',style: kLargeButtonTextStyle,),
              ),
              color: kbottomContainerColor,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(bottom: 20),
              height: kbottomContainerHeight,
              width: double.infinity,
            ),
          )
        ],
      )
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon,this.onPress});

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}




