import 'package:flutter/material.dart';

const bottomContainerHeight = 80.0;
const activeCardColor=Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);

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
        children:<Widget> [
          Expanded(child: Row(
            children:[
              Expanded(
                child: ReusableCard(color:activeCardColor),
              ),
              Expanded(
                child: ReusableCard(color:activeCardColor)
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

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}