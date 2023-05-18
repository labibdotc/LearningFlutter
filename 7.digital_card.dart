import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/labibheadshot.jpg'),
                radius:70
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text('Abdulrahman Labib',
                      style:TextStyle(
                          fontFamily: 'JosefinSans',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 40
                      )
                  ),
                  SizedBox(
                    width: 10
                  ),
                  Icon(
                    Icons.verified_rounded,
                    color: Colors.white
                  )
                ]
              ),

              Text('FLUTTER DEVELOPER',
              style: TextStyle(
                  fontFamily: 'JosefinSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15,
                letterSpacing: 7
                )
              ),
              SizedBox(height: 10),
              Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical:10,horizontal: 25),
                  child: Row(
                      children:[
                        Icon(
                            Icons.volume_up_outlined,
                            color: Colors.black
                        ),
                        SizedBox(
                            width: 20
                        )
                        ,
                        Text('Name Pronunciation',
                          style: TextStyle(
                              fontFamily: 'JosefinSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black
                          ),
                        )

                      ]
                  )

              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical:10,horizontal: 25),
                child: Row(
                  children:[
                    Icon(
                      Icons.phone,
                      color: Colors.black
                    ),
                    SizedBox(
                      width: 20
                    ),
                    Text('+1 (857) 523-5779',
                    style: TextStyle(
                              fontFamily: 'JosefinSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black
                            ),
                    )

                  ]
                )
              ),
              Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical:10,horizontal: 25),
                  child: Row(
                      children:[
                        Icon(
                            Icons.code,
                            color: Colors.black
                        ),
                        SizedBox(
                          width: 20
                        )
                        ,
                        Text('@labibdotc',
                          style: TextStyle(
                              fontFamily: 'JosefinSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black
                          ),
                        )

                      ]
                  )

              ),
              Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical:10,horizontal: 25),
                  child: Row(
                      children:[
                        Icon(
                            Icons.http_rounded,
                            color: Colors.black
                        ),
                        SizedBox(
                            width: 20
                        )
                        ,
                        Text('Personal Website',
                          style: TextStyle(
                              fontFamily: 'JosefinSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black
                          ),
                        )

                      ]
                  )

              ),
              Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical:10,horizontal: 25),
                  child: Row(
                      children:[
                        Icon(
                            Icons.bookmark_border_outlined,
                            color: Colors.black
                        ),
                        SizedBox(
                            width: 20
                        )
                        ,
                        Text('Add to contacts',
                          style: TextStyle(
                              fontFamily: 'JosefinSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black
                          ),
                        )

                      ]
                  )

              )

            ]
          )
        )
      ),
    );
  }
}


