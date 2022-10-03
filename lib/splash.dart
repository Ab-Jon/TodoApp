import 'dart:async';
import 'package:flutter/material.dart';
import 'todo.dart';


class SplashScreen extends StatelessWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    // Timer for the duration of splash screen.
    int splash_time = 8;
    Timer(
        Duration(seconds: splash_time),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Todo()))
    );

    return Scaffold(
        body: Container(
          alignment: Alignment.center,
        child:
            SizedBox(
              child: new Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: <Widget>[
                  Text(
                    'Todo',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D47A1),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'App',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFEB3B),
                    ),
                  ),
                ],
              ),
            ),
        ),
      backgroundColor: Colors.blue,
    );
  }
}