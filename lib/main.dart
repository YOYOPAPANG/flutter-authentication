import 'package:flutter/material.dart';
import 'package:loginsystem/screen/%E0%B8%B7navigation.dart';
import 'package:loginsystem/screen/home.dart';
import 'package:loginsystem/screen/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ihelpU',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: HomeScreen(),
        // initialRoute: HomeScreen.id,
        //home มันคือ welcome เรา
        //welcome มันคือ navigation เรา
        // routes:{
        //   HomeScreen.id=(context)=>HomeScreen(),
        //   WelcomeScreen.id=(context)=>WelcomeScreen(),
        //   NavigationScreen.id=(context)=>NavigationScreen(),

        // },
        );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
