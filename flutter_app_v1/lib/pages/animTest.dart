import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/animation.dart';

class AnimTest extends StatefulWidget {
  State<StatefulWidget> createState() => new _AnimTest();
}

class _AnimTest extends State<AnimTest> with SingleTickerProviderStateMixin {
  Animation anim,delayedAnim,del;
  AnimationController animController;

  @override
  void initState() {
    super.initState();
    animController =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    anim = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: animController, curve: Curves.fastOutSlowIn));
    delayedAnim=Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
      parent: animController,
      curve: Interval(0.5,1.0,curve: Curves.fastOutSlowIn)
    ));
    del=Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
        parent: animController,
        curve: Interval(0.8,1.0,curve: Curves.fastOutSlowIn)
    ));
    animController.forward();
    print("kkkk");
  }
  @override
  Widget build(BuildContext context) {

    final double width=MediaQuery.of(context).size.width;
    return new AnimatedBuilder(
      animation:animController,
      builder:(BuildContext context,Widget child){
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.indigo[300],
        title: new Text(
          "Anim",
          style: TextStyle(fontFamily: "Merriweather"),
        ),
      ),
      body:
      Column(children: <Widget>[
        Transform(transform: Matrix4.translationValues(anim.value *width, 0.0, 0.0),
          child:
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(width:10),
                  Text("Id : ",style: TextStyle(fontSize: 20),),
                  SizedBox(width:10),
                  Expanded(
                      child: TextFormField(
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
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Mercedes 190',
                            labelStyle:TextStyle(color: Colors.redAccent,)
                        ),

                      )
                  ),
                ],
              ),

            ],
          )
        ),
        Transform(transform: Matrix4.translationValues(delayedAnim.value *width, 0.0, 0.0),
        child:
        Column(
        children: <Widget>[
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

        ])),
        Transform(transform: Matrix4.translationValues(del.value *width, 0.0, 0.0),
        child:
        Column(
        children: <Widget>[GestureDetector(child:
        Container(
          height: 70.0,
          width: 100.0,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(15.0)
          ),
          child: Text("Click me"),
        )


          ,onDoubleTap: (){print("double taped");},)])),

      ],)


    );});
  }


}
