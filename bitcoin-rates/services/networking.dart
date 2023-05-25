import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  Uri url;
  NetworkHelper(this.url);
  Future getData() async {
    var response = await get(url);
    if(response.statusCode != 200) {
      print('Error: response has code: ' + response.statusCode.toString());
      return null;
    }
    return jsonDecode(response.body);
  }
}