import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/services/networking.dart';
import 'constants.dart';


class CryptoCard extends StatelessWidget {
  final crypto;
  final coin;
  final rate;
  CryptoCard(this.crypto, this.coin, this.rate);

//   @override
//   State<CryptoCard> createState() => _CryptoCardState();
// }
//
// class _CryptoCardState extends State<CryptoCard> {

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // updateUI();
  // }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 ${this.crypto} = ${rate == null ? '?' : rate} ${this.coin}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
