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

  bool allBoxesSelected() {
    for (int i = 0; i < colors.length; i++) {
      if (colors[i] == Colors.white) {
        return false;
      }
    }
    return true;
  }

  String getWinner() {
    if (colors[0] == colors[1] && colors[1] == colors[2]) {
      return colors[0] == Colors.red ? 'Player 1 won' : 'Player 2 won';
    } else if (colors[3] == colors[4] && colors[4] == colors[5]) {
      return colors[3] == Colors.red ? 'Player 1 won' : 'Player 2 won';
    } else if (colors[6] == colors[7] && colors[7] == colors[8]) {
      return colors[6] == Colors.red ? 'Player 1 won' : 'Player 2 won';
    } else if (colors[0] == colors[3] && colors[3] == colors[6]) {
      return colors[0] == Colors.red ? 'Player 1 won' : 'Player 2 won';
    } else if (colors[1] == colors[4] && colors[4] == colors[7]) {
      return colors[1] == Colors.red ? 'Player 1 won' : 'Player 2 won';
    } else if (colors[2] == colors[5] && colors[5] == colors[8]) {
      return colors[2] == Colors.red ? 'Player 1 won' : 'Player 2 won';
    } else if (colors[0] == colors[4] && colors[4] == colors[8]) {
      return colors[0] == Colors.red ? 'Player 1 won' : 'Player 2 won';
    } else if (colors[2] == colors[4] && colors[4] == colors[6]) {
      return colors[2] == Colors.red ? 'Player 1 won' : 'Player 2 won';
    } else if (allBoxesSelected()) {
      return 'Nobody won';
    }
  }

  Widget getBox(int index) {
    return GestureDetector(
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
    );
  }

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
              children: List<Widget>.generate(9, (int index) => getBox(index)),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.bottomStart,
            padding: const EdgeInsets.all(10.0),
            child: Text(
              getWinner(),
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
          FlatButton(
              onPressed: () {
                setState(() {
                  colors = List<Color>.generate(9, (int index) => Colors.white);
                  player = '1';
                });
              },
              child: const Text('Reset'))
        ],
      ),
    );
  }
}
