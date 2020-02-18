import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import '../widgets/MyDrawer.dart';
import '../routes/routes.dart';
import './models/dmdfr.dart';
import './Adddmd.dart';
import './dmdDetail.dart';
class Home  extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> new _HomeState();
  }
  class _HomeState extends State<Home> {
    final String url = Routes.apiUrl + "dmdfr";
    List data;

    Future<String> getdmds() async {
      var res = await http.get(
          Uri.parse(url), headers: {"Accept": "application/json"});
      setState(() {
        var resBody = json.decode(res.body);
        data = resBody["data"];
      });
      return "Success!";
    }

    String getTime(String s) {
      List<String> date = s.split(" ");
      return date[1];
    }

    String getdate(String s) {
      List<String> date = s.split(" ");
      return date[0];
    }
    //put request
    _changeSt(Dmdfr dmd) async {
      // set up PUT request arguments

      String url = Routes.apiUrl + "dmdfr";
      Map<String, String> headers = {"Content-type": "application/json"};
      print('mm');
      String json =
          '{"id": '+dmd.id.toString()+","+
              '"voiture": '+'"'+dmd.voiture+'",'+'"date":'+'"'+dmd.date+'",'+'"idMec" :'+dmd.idMec.toString()+','+
              '"etat" :'+dmd.etat.toString()+"}";

      http.Response response = await http.put(url, headers: headers,
          body: json); // check the status code for the result
      int statusCode = response
          .statusCode; // this API passes back the updated item with the id added
      String body = response.body;
      print(body);
      // {
      //   "title": "Hello",
      //   "body": "body text",
      //   "userId": 1,
      //   "id": 1
      // }
    }

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      FlutterStatusbarcolor.setStatusBarColor(Colors.indigo[400]);
      return new
      SafeArea(child:
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
            title: new Text("Acceuil", style: TextStyle(
                fontFamily: "Merriweather"
            ),),),
          drawer: MyDrawer(),
          body:
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
            new
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                      SizedBox(width: 25,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("LF#", style: TextStyle(fontFamily: "Pacifico",
                                          fontSize: 30,
                                          color: Colors.grey[800]),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text("Auto", style: TextStyle(fontFamily: "Pacifico",
                          fontSize: 30,
                          color: Colors.grey[700]),),
                        SizedBox(width: 100,),
                        GestureDetector(
                          onTap:(){ Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Adddmd(),
                            ));},
                          child: Container(
                          child: Icon(Icons.add_box, color: Colors.blueGrey,size: 30,

                          ),
                        ),)


                    ],),
                    SizedBox(height: 10,),



                ListView.builder(
                    itemCount: data==null?0 : data.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: (){
                            Navigator.push(context,
                                    MaterialPageRoute(
                                           builder: (context) => DmdDetail(id:data[index]["id"],date: data[index]["date"],etat: data[index]["etat"])));
                        },
                        child:ListTile(
                          contentPadding: EdgeInsets.all(10.0),
                          leading:
                          Container(
                            height: 300,
                            decoration: new BoxDecoration(
                              color: Colors.blue,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  decoration: new BoxDecoration(
                                    color: Colors.blue,
                                  ),
                                  width: 77,

                                  child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Container(child: Text(
                                        getTime(data[index]["date"].toString()),
                                      ))
                                  ),),
                                Container(
                                  height: 30,
                                  decoration: new BoxDecoration(
                                    color: Colors.blue[200],
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          3, 0, 3, 0),
                                      child: Container(child: Text(
                                        getdate(data[index]["date"].toString()),
                                      ),)
                                  ),
                                ),
                              ],
                            ),),

                          title: new Text(data[index]['id'].toString(),
                            style: TextStyle(color: Colors.redAccent),),
                          subtitle: new Text(data[index]['voiture']),
                          trailing:
                          GestureDetector(
                              onTap:(){
                                Dmdfr d;
                                if(data[index]['etat']==0){
                                  d=new Dmdfr(id:data[index]['id'],voiture:data[index]['voiture'],date:data[index]['date'],idMec:data[index]['idMec'],etat:1);
                                  setState(() {
                                    data[index]['etat']=1;

                                  });
                                }else{
                                  d=new Dmdfr(id:data[index]['id'],voiture:data[index]['voiture'],date:data[index]['date'],idMec:data[index]['idMec'],etat:0);
                                  setState(() {
                                    data[index]['etat']=0;

                                  });
                                }
                                _changeSt(d);} ,
                              child:valide(data[index]['etat'] ,)
                          ),
                        )
                      );

                    })
              ],
            ),
          )

      ),
      );
    }

    @override
    void initState() {
      super.initState();
      this.getdmds();
    }

    Widget valide(int i) {
      if (i == 1) {
        return Container(
          child: Icon(Icons.check_circle, color: Colors.green,),
        );
      }
      return Container(
        child: Icon(Icons.check_circle, color: Colors.grey,),
      );
    }
  }