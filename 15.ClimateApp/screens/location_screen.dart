import 'package:climafinale/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:climafinale/utilities/constants.dart';
import 'package:climafinale/services/weather.dart';


class LocationScreen extends StatefulWidget {
  LocationScreen({this.weatherData});
  final weatherData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  var weatherData;
  double temp = 0;
  int condition = 0;
  String city = "";
  String weatherMessage = '';
  String weatherIcon = '';

  @override
  void initState() {
    super.initState();
    weatherData = widget.weatherData;


    updateUI(weatherData);

    // condition = weatherData['weather'][0]['id'];
    // temp = weatherData['main']['temp'];
    // city = weatherData['name'];
  }
  void updateUI(dynamic weatherData) {
    setState(() {
      this.weatherData = weatherData;
      condition = weatherData != null ? weatherData['weather'][0]['id'] : 0;
      temp = weatherData != null ? weatherData['main']['temp'] : 0;
      city = weatherData != null ? weatherData['name'] : '';
      weatherIcon = weatherData != null ? weather.getWeatherIcon(condition) : '';
      weatherMessage =  weatherData != null ? weather.getMessage(temp.round()) : 'Unable to get weather data';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context) => CityScreen()));
                      if(typedName == null) return;
                      var data = await weather.getCityWeather(typedName);

                      updateUI(data);
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Row (
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,

                        children: [Text(
                      temp.round().toString(),
                      style: kTempTextStyle,
                    ),
                    //kMessageTextStyle
                    Text(
                      '°C ',
                      style: kMessageTextStyle,
                    ),]),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "${weatherMessage} in ${city}",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
