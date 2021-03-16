import 'package:apppro/main.dart';
import 'package:apppro/screens/home.dart';
import 'package:apppro/screens/mode.dart';
import 'package:apppro/screens/set.dart';
import 'package:apppro/screens/show.dart';
import 'package:apppro/screens/showgrod.dart';
import 'package:apppro/utility/normai.dart';
import 'package:apppro/screens/setup.dart';
import 'package:apppro/utility/my_sety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homee extends StatefulWidget {
  @override
  _HomeeState createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {
  Widget sigOut(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      tooltip: 'Log Out',
      onPressed: () {
        myAlert();
      },
    );
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are You Sure ?'),
            content: Text('Do You Whnt Log Out ?'),
            actions: <Widget>[canel(), okBu(context)],
          );
        });
  }

  Widget okBu(BuildContext context) {
    return FlatButton(
      child: Text('OK'),
      onPressed: () {
        Navigator.of(context).pop();
        myLogOut(context);
      },
    );
  }

  Future<void> myLogOut(BuildContext context) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut().then((respose) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Home());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    });
  }

  Widget canel() {
    return FlatButton(
      child: Text('Cancel'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('             My Home App'),
        actions: <Widget>[sigOut(context)],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MySety().showlog(),
              MySety().mySizedBox(),
              myButtonsetup(),
              MySety().mySizedBox(),
              myButtonset(),
              MySety().mySizedBox(),
              myButtonshow(),
              MySety().mySizedBox(),
              myButtonmode(),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginButton() {
    return Row(children: [
      Expanded(
        child: RaisedButton(
          color: Colors.blue,
          child: Text(
            'control'.toUpperCase(),
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Setup()));
          },
        ),
      )
    ]);
  }

  Widget myButtonsetup() => Container(
        width: 300.0,
        child: RaisedButton(
          color: MySety().bolColor,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Setup()));
          },
          child: Text(
            'Control',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      );

  Widget myButtonset() => Container(
        width: 300.0,
        child: RaisedButton(
          color: MySety().bolColor,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Set1()));
          },
          child: Text(
            'Setdata',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      );

  Widget myButtonshow() => Container(
        width: 300.0,
        child: RaisedButton(
          color: MySety().bolColor,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Showgrod()));
          },
          child: Text(
            'Showgraph',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      );

  Widget myButtonmode() => Container(
        width: 300.0,
        child: RaisedButton(
          color: MySety().bolColor,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Mode()));
          },
          child: Text(
            'Manual',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      );
}
