import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../routes/routes.dart';
import 'package:flutter/animation.dart';
class AnimTwo extends StatefulWidget {
  State<StatefulWidget> createState() => new _AnimTwo();
}

class _AnimTwo extends State<AnimTwo> with SingleTickerProviderStateMixin {
  Animation anim, childAnim;
  AnimationController animController;
  @override
  void initState() {
    super.initState();
    animController =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    anim = Tween(begin: -0.25, end: 0.0).animate(
        CurvedAnimation(parent: animController, curve: Curves.fastOutSlowIn));
childAnim=Tween(begin: 20.0,end: 125.0).animate(CurvedAnimation(parent: animController,curve: Curves.easeIn));
    animController.forward();
    print("kkkk");
  }
  @override
  Widget build(BuildContext context) {

    final double width=MediaQuery.of(context).size.width;
    return new AnimatedBuilder(
        animation: animController,
        builder: (BuildContext context, Widget child) {
      return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.indigo[300],
          title: new Text(
            "Anim",
            style: TextStyle(fontFamily: "Merriweather"),
          ),
        ),
        body: new Align(
            alignment: Alignment.center,
            child: new Container(
              child: Transform(
                  transform: Matrix4.translationValues(
                      anim.value * width, 0.0, 0.0),
                  child: Center(
                      child: AnimatedBuilder(
                        animation: childAnim,
                        builder: (BuildContext context, Widget child) {
                          return new Center(
                              child: Container(
                                padding: EdgeInsets.all(15.0),
                                height: childAnim.value * 2,
                                width: childAnim.value * 2,
                                child: new ListView(
                                  children: <Widget>[
                                    TextField(
                                        decoration:
                                        InputDecoration(hintText: 'Username')
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(hintText: 'Password'),
                                      obscureText: true,
                                    ),
                                    SizedBox(height: 20.0),
                                    RaisedButton(
                                      child: Text('Login'),
                                      onPressed: () {},
                                      color: Colors.lightBlue,
                                      elevation: 7.0,
                                      textColor: Colors.white,
                                    ),
                                    SizedBox(height: 20.0),
                                    Center(
                                      child: Text('Don\'t have an account?'),
                                    ),

                                    SizedBox(height: 20.0),
                                    OutlineButton(
                                      child: Text('Signup'),
                                      onPressed: () {},
                                      color: Colors.lightGreen,
                                      textColor: Colors.green,
                                      highlightColor: Colors.green,
                                      borderSide: BorderSide(
                                          color: Colors.green,
                                          style: BorderStyle.solid,
                                          width: 2.0),
                                    ),
                                  ],
                                ),
                              ));
                        },
                      ))),
            )),
      );
  });
}}