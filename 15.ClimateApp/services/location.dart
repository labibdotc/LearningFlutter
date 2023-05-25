import 'package:geolocator/geolocator.dart';

class Location {
  int _longitude = 0, _latitude = 0;
  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied) {throw 'Location denied';}
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      // print(position);
      _longitude = position.longitude.round();
      _latitude = position.latitude.round();

    } catch (e) {
      print(e);
    }
  }
  int longitude(){
    return _longitude;
  }
  int latitude(){
    return _latitude;
  }
}