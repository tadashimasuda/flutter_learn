import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:clima/services/networking.dart';
import 'location_screen.dart';
import 'package:clima/services/weather.dart';

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
    var weatherData = await WeatherModel().getLocaitonData();

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
