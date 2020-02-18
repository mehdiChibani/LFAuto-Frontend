import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/MyDrawer.dart';
import 'package:badges/badges.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../routes/routes.dart';
class DmdDetail extends StatefulWidget {
  final int id;
  final String date;
  final int etat;
  DmdDetail({Key key, @required this.id, @required this.date, @required this.etat}) : super(key: key);
  @override
  State<StatefulWidget> createState()=> new _DmdDetail(id: id,date: date,etat: etat);}

class _DmdDetail extends State<DmdDetail>{
  _makePostRequest(int id) async {
    // set up POST request arguments
    String url = Routes.apiUrl + "pai";
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"prixPayee": "1500",'
        +'"idDmd": '+id.toString()+',"idClt":"1","idComptable": 1}'; // make POST request
    http.Response response = await http.post(url, headers: headers,
        body: json); // check the status code for the result
    int statusCode = response
        .statusCode; // this API passes back the id of the new item added to the body
    String body = response.body;
    print(body);
    // {
    //   "title": "Hello",
    //   "body": "body text",
    //   "userId": 1,
    //   "id": 101
    // }}
  }
  final int id;
  final String date;
  final int etat;
  _DmdDetail({Key key, @required this.id, @required this.date, @required this.etat});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(child:
    Scaffold(
      appBar: new AppBar(
      actions: <Widget>[
      /*Container(
            margin: EdgeInsets.fromLTRB(0,7,17,0),
            child: Badge(
              badgeContent: Text("0"),
              child: Icon(Icons.shopping_basket,size: 35,),
            ),
          )*/
      ],
      backgroundColor: Colors.indigo[300],
      title: new Text("Datails de la demande", style: TextStyle(
          fontFamily: "Merriweather"
      ),),),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
    child:
    new
    Column(children: <Widget>[
      Row(
        children: <Widget>[
          SizedBox(width: 25,),
          Text("LF#", style: TextStyle(fontFamily: "Pacifico",
              fontSize: 30,
              color: Colors.grey[800]),),
          Text("Auto", style: TextStyle(fontFamily: "Pacifico",
              fontSize: 30,
              color: Colors.grey[700]),),
          SizedBox(width: 200,),
        ],),
      Row(children: <Widget>[
        SizedBox(width: 20,height: 40,),
        Icon(Icons.build),SizedBox(width: 10),
        Text("Detail de la demande : ",style: TextStyle(color: Colors.blueGrey,fontSize: 15),),
        Text(id.toString(),style: TextStyle(color: Colors.redAccent,fontSize: 15),)
      ],),
      Row(children: <Widget>[
        SizedBox(width: 20,height: 40,),
        Icon(Icons.calendar_today),SizedBox(width: 10),
        Text("date de la, demande : ",style: TextStyle(color: Colors.blueGrey,fontSize: 15),),
        Text(date.toString(),style: TextStyle(color: Colors.green,fontSize: 15),)
      ],),
      Row(children: <Widget>[
        SizedBox(width: 20,height: 40,),
        Icon(Icons.check),SizedBox(width: 10),
        Text("validé : ",style: TextStyle(color: Colors.blueGrey,fontSize: 15),),
        valide(etat)
      ],),
      Row(children: <Widget>[
        SizedBox(width: 20,height: 40,),
        Icon(Icons.view_module),SizedBox(width: 10),
        Text("Piéces demandées : ",style: TextStyle(color: Colors.blueGrey,fontSize: 15),),
        Text("moteurs et deux roues",style: TextStyle(color: Colors.blueGrey,fontSize: 15),),
      ],),
      Row(children: <Widget>[
        SizedBox(width: 20,height: 40,),
        Icon(Icons.attach_money),SizedBox(width: 10),
        Text("Prix à payer : ",style: TextStyle(color: Colors.blueGrey,fontSize: 15),),
        Text("1500 DH",style: TextStyle(color: Colors.blueGrey,fontSize: 15),),
      ],),
      Divider(
        height: 20,
        color: Colors.black,
      ),
      Text("Informations du mecanicien concérné : ",style: TextStyle(color: Colors.black,fontSize: 20) ,),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 15,height: 20,),
        CircleAvatar(backgroundImage:AssetImage("assets/images/luci.jpg"),maxRadius: 50,),
        Column(children: <Widget>[
          Row(children: <Widget>[
            SizedBox(width: 15),
            Icon(Icons.account_circle),SizedBox(width: 10),
            Text("Tom Elis ",style: TextStyle(color: Colors.blueGrey,fontSize: 15),),
          ],),
          Row(children: <Widget>[
            SizedBox(width: 15),
            Icon(Icons.email),SizedBox(width: 10),
            Text("Tom_Elis@netflix.com",style: TextStyle(color: Colors.blueGrey,fontSize: 15),),
          ],),
        ],),

    ]),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(Icons.check, color: Colors.green[100],size: 45,),
          new RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.indigoAccent,
              child: new Text("Valider le paiement"),
            onPressed: () {


              _makePostRequest(id);



            },
          ),
          SizedBox(width: 20),

        ],
      ),
        ]

      )
    ),
    ));
  }
  Widget valide(int i) {
    if (i == 1) {
      return Container(
        child: Text("Validé par le chef mecaniciens",style: TextStyle(color: Colors.green,fontSize: 15),),
      );
    }
    return Container(
      child: Text("Non validé par le chef mecaniciens",style: TextStyle(color: Colors.blueGrey,fontSize: 15),),
    );
  }

}