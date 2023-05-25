import 'package:flutter/material.dart';
import 'package:climafinale/services/location.dart';
import 'package:climafinale/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:climafinale/services/weather.dart';

const APIKey = String.fromEnvironment('OpenWeatherAPIKey');



class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  void getLocationData() async {
      // Location location = Location();
      // await location.getCurrentLocation();
      // String lat = location.latitude().toString();
      // String lon = location.longitude().toString();
      //
      // Uri url = Uri(
      //     scheme: 'https',
      //     host: 'api.openweathermap.org',
      //     path: 'data/2.5/weather',
      //     queryParameters: {'lat': lat, 'lon': lon, 'appid': APIKey, 'units': 'metric'});
      //
      // Network networkHelper = Network(url);
      //
      WeatherModel weatherModel = WeatherModel();
      var weatherData = await weatherModel.getLocationWeather();

      Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(weatherData: weatherData,)));

      //   print(condition.toString() + temp.toString() + city);

  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 150
        )
      )
        // body: Center(
        //   child: ElevatedButton(
        //     onPressed: () {
        //       getLocation();
        //       //Get the current location
        //     },
        //     child: Text('Get Location'),
        //   ),
        // ),
        );
  }
}
