import 'package:climafinale/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:climafinale/utilities/constants.dart';

// class inputField extends StatelessWidget {
//   String city;
//   inputField({required this.city});
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
//
class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String city = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(weatherData: ,)));
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                    color:Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    city = value;
                  },

                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, city);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle.copyWith(color: Colors.white),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
