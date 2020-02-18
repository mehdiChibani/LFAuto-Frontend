import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../routes/routes.dart';
class Adddmd extends StatefulWidget {
  State<StatefulWidget> createState()=> new _Adddmd();

}
class _Adddmd extends State<Adddmd> {
  _makePostRequest(String voiture) async {
    // set up POST request arguments
    String url = Routes.apiUrl + "dmdfr";
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"id": "0101101",'
    +'"voiture": '+'"'+voiture+'"'+',"date":"2019-12-10 00:00:00","idMec": 1,"etat":0}'; // make POST request
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
  String id;
  String voiture;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.indigo[300],
          title: new Text(
            "Ajout d'une demande",
            style: TextStyle(fontFamily: "Merriweather"),
          ),
        ),
        body:
        SingleChildScrollView(child:
        Column(
            children: <Widget>[
              Row(
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
                children: <Widget>[
                  SizedBox(width:10),
                  Text("Id : ",style: TextStyle(fontSize: 20),),
                  SizedBox(width:10),
                  Expanded(
                      child: TextFormField(
                        onChanged: (text) {
                          setState(() {
                            id = text;
                          });
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Entrez un id comme 1101005',
                            labelStyle:TextStyle(color: Colors.redAccent,)
                        ),

                      )
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(width:10),
                  Text("Voiture : ",style: TextStyle(fontSize: 20),),
                  SizedBox(width:10),
                  Expanded(
                      child: TextFormField(
                        onChanged: (text) {
                          setState(() {
                            voiture = text;
                          });
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Mercedes 190',
                            labelStyle:TextStyle(color: Colors.redAccent,)
                        ),

                      )
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(width:10),
                  Text("Pieces: ",style: TextStyle(fontSize: 20),),

                ],
              ),
              Container(
                  margin: EdgeInsets.all(30),
                  child:
                  TextFormField(
                    maxLines: 10,
                    decoration: InputDecoration(
                        labelText: 'moteurs, roues ....etc',
                        labelStyle:TextStyle(color: Colors.redAccent,),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.indigo[100],
                            ))
                    ),
                  )
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: <Widget>[

                  Icon(Icons.add_box, color: Colors.indigoAccent[100],size: 45,),
                  new RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.white,
                    color: Colors.indigoAccent,
                    onPressed: () {


                      _makePostRequest(voiture);



                    },



                    child: new Text("Ajouter"),
                  ),
                  SizedBox(width: 15,)
                ],
              ),





            ])
          ,)
    );
  }

  }
