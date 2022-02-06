import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';

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
    getData();
  }
  void getData() async{
    Response response = await get(Uri.parse('http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=85f364c6573bf8de09d146383314a00b'));
    print(response.body);
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
