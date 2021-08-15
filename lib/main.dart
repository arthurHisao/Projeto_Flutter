import 'package:flutter/material.dart';
import 'package:myapp/pages/login.page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/*void main() {
  runApp(MyApp());
}*/

Future main() async {
  final json = await fetch();
  runApp(MyApp());
}

Future<Map> fetch() async {
  var url = "http://worldtimeapi.org/api/timezone/America/Sao_Paulo";
  var response = await http.get(Uri.parse(url));
  var json = jsonDecode(response.body);
  return json;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: LoginPage(),
    );
  }
}