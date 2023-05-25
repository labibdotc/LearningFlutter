import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;
import 'package:bitcoin_ticker/services/networking.dart';
import 'constants.dart';
import 'cryptoCoinCard.dart';


class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  List<DropdownMenuItem<String>> menuItemsList = [];
  String selectedValue = 'USD';
  Map<String,dynamic>M = {'BTC': null, 'ETH': null, 'LTC':null};

  Future<void> updateUI(String base, String quote) async {

    Uri url = Uri(
        scheme: 'https', //'https/rest.coinapi.io/v1/exchangerate/BTC/USD?X-CoinAPI-Key=035540BA-7678-449C-B486-82864FC0DD30'
        host: 'rest.coinapi.io',
        path: '/v1/exchangerate/${base}/${quote}',
        queryParameters: {'apikey' : coinAPIKey}
    );
    NetworkHelper http = NetworkHelper(url);
    var jsonData = await http.getData();
    setState(() {
      M[base] = jsonData['rate'].round();
      // rate = jsonData['rate'].round();
    });
    // print(jsonData['rate']);
  }
  //Android
  void initDropDownMenuItems() {
    for(String currency in currenciesList) {
      menuItemsList.add(DropdownMenuItem(child: Text(currency), value: currency));
    }
    // currenciesList.forEach(item) => print(item);
    // for i = 0; i < length(currenciesList); i++

  }
  DropdownButton<String> androidMenu() {
    return DropdownButton(
      items: menuItemsList,
      value: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value.toString();
          updateUI('BTC', selectedValue);
          updateUI('ETH', selectedValue);
          updateUI('LTC', selectedValue);
        });
        print(value);
      },
    );
  }
  //ios
  List<Text> cupertinoList() {
    List<Text> list = [];
    for(String currency in currenciesList) {
      list.add(Text(currency));
    }
    return list;
  }
  Widget cupertinoMenu() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Selected Currency: '),

          TextButton(
            // Display a CupertinoPicker with list of fruits.
            onPressed: () => _showDialog(
              CupertinoPicker(
                  magnification: 1.22,
                  squeeze: 1.2,
                  useMagnifier: true,
                  itemExtent: currenciesList.length.toDouble(),
                  // This sets the initial item.
                  scrollController: FixedExtentScrollController(initialItem: 0,),
                  // This is called when selected item is changed.
                  onSelectedItemChanged: (int i) {
                    setState(() {
                      selectedValue = menuItemsList[i].value.toString();
                      updateUI('BTC', selectedValue);
                      updateUI('ETH', selectedValue);
                      updateUI('LTC', selectedValue);
                    });
                  },
                  children:cupertinoList()
              ),
            ),
            child: Text(
              selectedValue,
              style: const TextStyle(
                  fontSize: 22.0,
                  color: Colors.white
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget getPicker() {
    if(Platform.isIOS) {
      return cupertinoMenu();
    }
    return androidMenu();
  }
  // Future<void> updateUI(String base, String quote) async {
  //   Uri url = Uri(
  //       scheme: 'https', //'https/rest.coinapi.io/v1/exchangerate/BTC/USD?X-CoinAPI-Key=035540BA-7678-449C-B486-82864FC0DD30'
  //       host: 'rest.coinapi.io',
  //       path: '/v1/exchangerate/${base}/${quote}',
  //       queryParameters: {'apikey' : coinAPIKey}
  //   );
  //   NetworkHelper http = NetworkHelper(url);
  //   var jsonData = await http.getData();
  //   setState(() {
  //     rate = jsonData['rate'].round();
  //   });
  //   // print(jsonData['rate']);
  // }

  Future<void> initAPI() async {
    String base = 'BTC';
    String quote = 'USD';
    updateUI(base,quote);
    base = 'ETH';
    updateUI(base,quote);
    base = 'LTC';
    updateUI(base,quote);
    // print(jsonData['rate']);
  }

  @override
  void initState() {
    super.initState();
    initDropDownMenuItems();
    initAPI();
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
              children:[
                CryptoCard('BTC',selectedValue, M['BTC']),
                CryptoCard('ETH', selectedValue, M['ETH']),
                CryptoCard('LTC', selectedValue, M['LTC']),
              //   Padding(
              //       padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              //       child: Card(
              //         color: Colors.lightBlueAccent,
              //         elevation: 5.0,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(10.0),
              //         ),
              //         child: Padding(
              //           padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
              //           child: Text(
              //             '1 BTC = ${rate == null ? '?' : rate} $selectedValue',
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //               fontSize: 20.0,
              //               color: Colors.white,
              //             ),
              //           ),
              //           ),
              //       ),
              //   ),
              // Padding(
              //   padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              //   child: Card(
              //     color: Colors.lightBlueAccent,
              //     elevation: 5.0,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
              //       child: Text(
              //         '1 ETH = ${rate == null ? '?' : rate} $selectedValue',
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //           fontSize: 20.0,
              //           color: Colors.white,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              //   child: Card(
              //     color: Colors.lightBlueAccent,
              //     elevation: 5.0,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
              //       child: Text(
              //         '1 LTC = ${rate == null ? '?' : rate} $selectedValue',
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //           fontSize: 20.0,
              //           color: Colors.white,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              ]
          ),

          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker()
          )
        ]
      )
    );
  }
}
//CupertinoPicker(
//               children: cupertinoList(),
//               onSelectedItemChanged: (i) {
//                 setState(() {
//                   selectedValue = menuItemsList[i].value.toString();
//                 });
//
//               },
//               itemExtent: 32,
//             )








