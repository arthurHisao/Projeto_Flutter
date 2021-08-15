import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:convert';

Future<Hour> fetchHour() async {
  final response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/America/Sao_Paulo'));

  if(response.statusCode == 200) {
    return Hour.fromJson(jsonDecode(response.body));
  }else {
    throw Exception('Failed to load album');
  }
}

class Hour {
  final String now;

  Hour({
    required this.now,
  });

  factory Hour.fromJson(Map<String, dynamic> json) {
    return Hour(
      now: json['utc_datetime'],
    );
  }
}

class Dashboard extends StatefulWidget {
  final String value;
  const Dashboard({Key? key, required this.value}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState(); // retorna a instancia do objeto state abaixo
}

class _DashboardState extends State<Dashboard> {
  int _counter = 0;
  late Future<Hour> futureHour;

  /*getTime() async {
    // make the request
    var url = "http://worldtimeapi.org/api/timezone/America/Sao_Paulo";
    var response = await http.get(Uri.parse(url));
    Map data = jsonDecode(response.body);

    // get properties from json
    String datetime = data['utc_datetime'];
    String offset = data['utc_offset'].substring(1,3);

    // create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print('valor de  now: $now');
    setState(() {
      time = offset;
    });
  }*/

  //start first
  @override
  void initState() {
    super.initState();
    futureHour = fetchHour();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: Center(
          child: FutureBuilder<Hour>(
            future: futureHour,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.now);
              } else {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}