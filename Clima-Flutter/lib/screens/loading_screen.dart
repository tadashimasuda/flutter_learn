import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState(){
    super.initState();
    getLocaiton();
  }

  void getLocaiton() async {
    Locaiton locaiton = Locaiton();
    await locaiton.getCurrentLocation();
    print(locaiton.longitude);
    print(locaiton.latitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            getLocaiton();
          },
          child: Text('Getting Location'),
        ),
      ),
    );
  }
}
