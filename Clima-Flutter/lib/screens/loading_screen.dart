import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:clima/services/networking.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState(){
    super.initState();
    getLocationData();
  }

   void getLocationData() async {
    Locaiton location = Locaiton();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    String url = 'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=85f364c6573bf8de09d146383314a00b&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);

    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather:weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
