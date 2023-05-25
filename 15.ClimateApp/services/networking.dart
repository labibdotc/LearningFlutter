import 'package:http/http.dart';
import 'dart:convert';

class Network {
  final Uri url;
  Network(this.url);

  Future getData() async {
    var response = await get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      print( 'bad response. Error: '+ response.statusCode.toString());
    }
  }

}