import 'package:enigma/enigma.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

void setDefaults(var _rotor1, var _rotor2, var _rotor3) {
  rotor = [];
  final rot1 = int.parse(_rotor1.text);
  final rot2 = int.parse(_rotor2.text);
  final rot3 = int.parse(_rotor3.text);
  rotor.add(rotors[0]);
  rotor.add(rotors[rot1].sublist(0, (rotors[1].length)));
  rotor.add(rotors[rot2].sublist(0, (rotors[2].length)));
  rotor.add(rotors[rot3].sublist(0, (rotors[3].length)));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Enigma cipher',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _rotor1 = TextEditingController(text: '1');
  final _rotor2 = TextEditingController(text: '2');
  final _rotor3 = TextEditingController(text: '3');
  final _message = TextEditingController();
  final _result = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "ENIGMA CIPHER",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0),
        child: Container(
          child: Container(
            margin: EdgeInsets.only(right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Message",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextField(
                    controller: _message,
                    decoration: InputDecoration(
                      hintText: "Enter your message",
                      labelText: "Message",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        child: Text("Encrypt"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightGreen,
                          onPrimary: Colors.white,
                          elevation: 5,
                        ),
                        onPressed: () {
                          setDefaults(_rotor1, _rotor2, _rotor3);
                          _result.text = enigma(_message.text);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: ElevatedButton(
                          child: Text("Reset rotors"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            onPrimary: Colors.white,
                            elevation: 5,
                          ),
                          onPressed: () {
                            setDefaults(_rotor1, _rotor2, _rotor3);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    "Rotors",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: TextFormField(
                          controller: _rotor1,
                          decoration: InputDecoration(
                            hintText: "Enter position of the first rotor",
                            labelText: "Rotor 1",
                            labelStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: TextFormField(
                          controller: _rotor2,
                          decoration: InputDecoration(
                            hintText: "Enter position of the second rotor",
                            labelText: "Rotor 2",
                            labelStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: TextFormField(
                          controller: _rotor3,
                          decoration: InputDecoration(
                            hintText: "Enter position of the third rotor",
                            labelText: "Rotor 3",
                            labelStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    "Output",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: TextFormField(
                      controller: _result,
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: "Result",
                        labelText: "Result",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
