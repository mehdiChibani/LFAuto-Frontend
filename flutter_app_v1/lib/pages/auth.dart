import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../routes/routes.dart';
import '../pages/home.dart';
class Auth extends StatefulWidget {
  State<StatefulWidget> createState()=> new _Auth();

}
class _Auth extends State<Auth> {


  @override
  Widget build(BuildContext context) {
    return new
    SafeArea(child: Scaffold(
backgroundColor: Colors.blue[100],
        body:

        Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 25,),
              Text("LF#", style: TextStyle(fontFamily: "Pacifico",
                  fontSize: 30,
                  color: Colors.grey[800]),),
              Text("Auto", style: TextStyle(fontFamily: "Pacifico",
                  fontSize: 30,
                  color: Colors.grey[700]),),
            ],
          ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width:10),
                Text("login",style: TextStyle(fontSize: 20),),
                SizedBox(width:10),
                Expanded(
                    child: TextFormField(

                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Tom elis',
                          labelStyle:TextStyle(color: Colors.redAccent,)
                      ),

                    )
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(width:10),
                Text("Password ",style: TextStyle(fontSize: 20),),
                SizedBox(width:10),
                Expanded(
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,

                          labelStyle:TextStyle(color: Colors.redAccent,)
                      ),

                    )
                ),
              ],
            ),
            new RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.indigoAccent,
              onPressed: () {


                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ));



              },



              child: new Text("Se connecter"),
            )
        ],),)

    ));

  }

}
