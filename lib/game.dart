import 'dart:math';
import 'package:flutter/material.dart';
import 'sack.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  //************ Values ******************/
  var sackCapacity;
  int usercapacity = 0;
  int minPoidsObj = 999999999; //maximum value par default
  int sommePoids = 0;
  int userValue = 0;
  var bestValue;
  List<int> valeur = [35, 8, 16, 26]; //Contient les valeurs
  List<int> poids = [5, 3, 7, 11]; //Contient les poids
  Knapsack knapsack = Knapsack();
  Random random_number = Random();

  //Choix des objets
  String choixItem1 = "Non";
  String choixItem2 = "Non";
  String choixItem3 = "Non";
  String choixItem4 = "Non";

   void _showErrorDialog(String message) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Resultat'),
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

  void change() {
      Random random = new Random();
      setState(() {
        sackCapacity = random.nextInt(sommePoids - minPoidsObj) + minPoidsObj;
        bestValue = knapsack.knapsackValue(sackCapacity, poids, valeur, 4);
      });
    }

    void tester() {
      if (usercapacity <= sackCapacity && userValue == bestValue) {
        _showErrorDialog("BRAVO!! u did a great job");
      } else {
        _showErrorDialog(
            "fail !! play again\n" +"Sack capacity: $sackCapacity\n"+ "User value: "+userValue.toString()+"\n" +"User capacity: "+ usercapacity.toString());
      }
    }
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
      sommePoids = poids[0] + poids[1] + poids[2] + poids[3];
    for (int i = 0; i < poids.length; i++) {
      if (poids[i] < minPoidsObj) {
        minPoidsObj = poids[i]; //put minimum poids in minPoidsObj
      }
    }
      sackCapacity =
        random_number.nextInt(sommePoids - minPoidsObj) + minPoidsObj;
    bestValue = knapsack.knapsackValue(sackCapacity, poids, valeur, 4);
  }
  @override
  Widget build(BuildContext context) {    
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("Choose your Objects")),
        body: ListView(padding: EdgeInsets.all(10), children: [
          Column(
            children: [
              Row(
                children: <Widget>[
                  SizedBox(height: 10),
                  Text(
                    "Capacité de sac: " + "$sackCapacity",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Nom de l'objet: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  Text(
                    "Camera",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Poids: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  Text(
                    "5",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Valeur: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  Text(
                    "35",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Image de l'objet: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        size: 50,
                      ),
                      onPressed: null),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Selected: ",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.blueGrey),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Radio(
                    value: "Oui",
                    groupValue: choixItem1,
                    onChanged: (String value) {
                      setState(() {
                        choixItem1 = value;
                      });

                      usercapacity += 5;
                      userValue += 35;
                      print(usercapacity);
                      //_choixItem1State(value);
                    },
                    activeColor: Colors.blueGrey,
                  ),
                  Text(
                    "Oui",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  Radio(
                    value: "Non",
                    groupValue: choixItem1,
                    onChanged: (String value) {
                      setState(() {
                        choixItem1 = value;
                      });
                      usercapacity -= 5;
                      userValue -= 35;
                      print(usercapacity);
                    },
                    activeColor: Colors.blueGrey,
                  ),
                  Text(
                    "Non",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.blueGrey,
              ),
              //****************************************************************** */
              Row(
                children: [
                  Text(
                    "Nom de l'objet: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  Text(
                    "Mic",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Poids: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  Text(
                    "3",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Valeur: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  Text(
                    "8",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Image de l'objet: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.mic,
                        size: 50,
                      ),
                      onPressed: null),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Selected: ",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.blueGrey),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Radio(
                    value: "Oui",
                    groupValue: choixItem2,
                    onChanged: (String value) {
                      setState(() {
                        choixItem2 = value;
                      });

                      usercapacity += 3;
                      userValue += 8;
                      print(usercapacity);
                      //_choixItem1State(value);
                    },
                    activeColor: Colors.blueGrey,
                  ),
                  Text(
                    "Oui",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  Radio(
                    value: "Non",
                    groupValue: choixItem2,
                    onChanged: (String value) {
                      setState(() {
                        choixItem2 = value;
                      });
                      usercapacity -= 3;
                      userValue -= 8;
                      print(usercapacity);
                    },
                    activeColor: Colors.blueGrey,
                  ),
                  Text(
                    "Non",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.blueGrey,
              ),
              //****************************************************************** */
              Row(
                children: [
                  Text(
                    "Nom de l'objet: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  Text(
                    "House",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Poids: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  Text(
                    "7",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Valeur: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  Text(
                    "16",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Image de l'objet: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.home,
                        size: 50,
                      ),
                      onPressed: null),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Selected: ",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.blueGrey),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Radio(
                    value: "Oui",
                    groupValue: choixItem3,
                    onChanged: (String value) {
                      setState(() {
                        choixItem3 = value;
                      });

                      usercapacity += 7;
                      userValue += 16;
                      print(usercapacity);
                      //_choixItem1State(value);
                    },
                    activeColor: Colors.blueGrey,
                  ),
                  Text(
                    "Oui",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  Radio(
                    value: "Non",
                    groupValue: choixItem3,
                    onChanged: (String value) {
                      setState(() {
                        choixItem3 = value;
                      });
                      usercapacity -= 7;
                      userValue -= 16;
                      print(usercapacity);
                    },
                    activeColor: Colors.blueGrey,
                  ),
                  Text(
                    "Non",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.blueGrey,
              ),

//****************************************************************** */
              Row(
                children: [
                  Text(
                    "Nom de l'objet: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  Text(
                    "Message",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Poids: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  Text(
                    "11",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Valeur: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  Text(
                    "26",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Image de l'objet: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.mail,
                        size: 50,
                      ),
                      onPressed: null),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Selected: ",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.blueGrey),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Radio(
                    value: "Oui",
                    groupValue: choixItem4,
                    onChanged: (String value) {
                      setState(() {
                        choixItem4 = value;
                      });

                      usercapacity += 11;
                      userValue += 26;
                      print(usercapacity);
                      //_choixItem1State(value);
                    },
                    activeColor: Colors.blueGrey,
                  ),
                  Text(
                    "Oui",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  Radio(
                    value: "Non",
                    groupValue: choixItem4,
                    onChanged: (String value) {
                      setState(() {
                        choixItem4 = value;
                      });
                      usercapacity -= 11;
                      userValue -= 26;
                      print(usercapacity);
                    },
                    activeColor: Colors.blueGrey,
                  ),
                  Text(
                    "Non",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.blueGrey,
              ),

              //**************************************** Buttons */
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: 120,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue[800]),
                      child: InkWell(
                        onTap: () {
                          tester();
                          print(sackCapacity.toString() + " $poids $valeur");
                        },
                        child: Center(
                          child: Text(
                            "Tester",
                            style: TextStyle(
                              color: Colors.white.withOpacity(.7),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Center(
                    child: Container(
                      width: 120,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue[800]),
                      child: InkWell(
                        onTap: () {
                          change();
                          //sackCapacity++;
                          print(sackCapacity.toString() + " $poids $valeur");
                        },
                        child: Center(
                          child: Text(
                            "Changer",
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
              SizedBox(height: 20),
            ],
          ),
        ]),
      ),
    );
  }
}
