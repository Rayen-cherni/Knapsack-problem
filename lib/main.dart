import 'package:flutter/material.dart';
import 'game.dart';
import 'scores.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Simulation probleme Sac à Dos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//*** Dialog ********/
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Aide et support'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  void _showScoresDialog(List scores) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Last Scores',textAlign: TextAlign.center,style: TextStyle(color:Colors.grey,fontSize:30),),
        content: Column(
          children: <Widget>[
             for(String i in scores)
               Text("Player: "+ i,style: TextStyle(color:Colors.black87,fontSize:22),),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Center(
            child: Text(
              "Welcome to Our Application",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 22),
            ),
          ),
          Center(
              child: Text(
            "Producted with passionate.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 22),
          )),
          SizedBox(height: 40),
          //****************** Burrons **************
          Center(
            child: Container(
              width: 120,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[800]),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen()),);
                },
                child: Center(
                  child: Text(
                    "Jouer",
                    style: TextStyle(
                      color: Colors.white.withOpacity(.7),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          Center(
            child: Container(
              width: 120,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[800]),
              child: InkWell(
                onTap: () async {
                  List arr = scores;
                  // for (String i in arr) {
                  //   print(i);
                  // }
                  _showScoresDialog(arr);
                },
                child: Center(
                  child: Text(
                    "Score",
                    style: TextStyle(
                      color: Colors.white.withOpacity(.7),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          Center(
            child: Container(
              width: 120,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[800]),
              child: InkWell(
                onTap: () {
                  _showErrorDialog(
                      "En cas de probleme, contactez nous rapidement!");
                },
                child: Center(
                  child: Text(
                    "Aide",
                    style: TextStyle(
                      color: Colors.white.withOpacity(.7),
                    ),
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
