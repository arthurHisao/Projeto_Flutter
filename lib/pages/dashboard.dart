import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Dashboard extends StatefulWidget {
  final String value;
  const Dashboard({Key? key, required this.value}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState(); // retorna a instancia do objeto state abaixo
}

class _DashboardState extends State<Dashboard> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Container (
        color: Colors.white,
        padding: EdgeInsets.only(
          top:50,
          left:40,
          right:40,
        ),
        child: ListView(
          children: <Widget> [
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Bem vindo: "+widget.value, // acessando o valor do da variavel declarada acima

                style: TextStyle(
                    fontSize: 15
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Text(
              'Qtd: ' +'$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Container(
              height: 40,
              child: FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text(
                  "Contador ++",
                  textAlign: TextAlign.center,
                ),
                onPressed: _incrementCounter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



/*class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {
    // make the request
    Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/America/Sao_Paulo"));
    Map data = jsonDecode(response.body);
    print(data);

    // get properties from json
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    //print(datetime);
    print(offset);

    // create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading screen'),
    );
  }
}*/