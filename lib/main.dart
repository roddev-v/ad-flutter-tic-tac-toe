import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isPlayerOne = true;
  List<Color> colors = List<Color>.generate(9, (int index) => Colors.white);
  String player = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: AlignmentDirectional.bottomStart,
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Player: $player',
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
          Center(
            child: GridView.count(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              crossAxisCount: 3,
              children: List<Widget>.generate(
                9,
                (int index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      final bool hasBeenTouched = colors[index] != Colors.white;
                      if (!hasBeenTouched) {
                        player = isPlayerOne ? '1' : '2';
                        print('Current player $player');
                        colors[index] = isPlayerOne ? Colors.red : Colors.green;
                        isPlayerOne = !isPlayerOne;
                      }
                    });
                  },
                  child: AnimatedContainer(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: colors[index],
                      border: Border.all(color: Colors.black),
                    ),
                    duration: const Duration(milliseconds: 500),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
