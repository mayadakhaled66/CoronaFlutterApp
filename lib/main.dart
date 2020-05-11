import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/Providers/dataLoader.dart';
import 'package:flutterapp/bloc/home_bloc.dart';
import 'package:flutterapp/screens/CountScreen.dart';
import 'package:provider/provider.dart';
import './screens/aboutScreen.dart';
import './screens/doaaScreen.dart';
import './screens/rankScreen.dart';

import 'screens/homeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
//      MultiProvider(
//      providers: [ChangeNotifierProvider.value(value: DataLoader())],
//      child
      BlocProvider(
        create:(context) => HomeBloc(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: new Color(0xFF1abc9c),
            accentColor: Colors.teal,
            tabBarTheme: TabBarTheme(labelColor: Colors.white),
            textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                title: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ),
          home: MyHomePage(title: 'Counter/تعداد'),
          routes: {
            "./": (context) => MyHomePage(),
            "/CountScreen": (context) => CountScreen(),
            "/RankScreen": (context) => RankScreen(),
            "/DoaaScreen": (context) => DoaaScreen(),
            "/AboutScreen": (context) => AboutScreen(),
          },
          onGenerateRoute: (settings) {
            print(settings.arguments);
            if (settings.name == '/CountScreen') {
              return MaterialPageRoute(
                builder: (ctx) => CountScreen(),
              );
            } else if (settings.name == '/RankScreen') {
              return MaterialPageRoute(
                builder: (ctx) => RankScreen(),
              );
            } else if (settings.name == '/DoaaScreen') {
              return MaterialPageRoute(
                builder: (ctx) => DoaaScreen(),
              );
            } else if (settings.name == '/AboutScreen') {
              return MaterialPageRoute(
                builder: (ctx) => AboutScreen(),
              );
            }
            return MaterialPageRoute(
              builder: (ctx) => MyHomePage(),
            );
          },
        ),
      );
//    );
  }
}
