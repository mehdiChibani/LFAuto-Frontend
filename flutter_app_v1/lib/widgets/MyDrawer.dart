import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  static _gotoPage(String route, BuildContext context) {
    Navigator.of(context).pushReplacementNamed(route);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text(
              "Tom Ellis",
              style: TextStyle(fontFamily: "Oswald", fontSize: 20),
            ),
            accountEmail: new Text(
              "Tom_Ellis@Netflix.com",
              style: TextStyle(fontFamily: "Oswald", fontSize: 20),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/luci.jpg"),
            ),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/blue.jpg"),
              ),
            ),
          ),
          Container(
              child: Column(children: <Widget>[
            new Hero(
              tag: 'dmdRep',
              child: ListTile(
                leading: new Icon(Icons.assignment),
                title: new Text('Demandes de fiche de reparation'),
                onTap: () {
// change app state...
                  MyDrawer._gotoPage("/home", context);
                },
              ),
            ),
            new Hero(
              tag: 'profil',
              child: ListTile(
                title: Text("Mon Profile"),
                leading: Icon(Icons.face),
                onTap: () {
// change app state...
                  MyDrawer._gotoPage("/auth", context);
                },
              ),
            ),
            Divider(
              height: 20,
              color: Colors.black,
            ),
            new Hero(
              tag: 'params',
              child: ListTile(
                title: Text("Paramétres"),
                leading: Icon(Icons.settings),
              ),
            ),
            new Hero(
              tag: 'info',
              child: ListTile(
                title: Text("A propos"),
                leading: Icon(Icons.info),
              ),
            ),
            Divider(
              height: 20,
              color: Colors.black,
            ),
            new Hero(
                tag: 'contact',
                child: ListTile(
                  title: Text("Contacter Nous"),
                  leading: Icon(Icons.speaker_phone),
                )),
                new Hero(
                  tag: 'Anim',
                  child: ListTile(
                    title: Text("Animations"),
                    leading: Icon(Icons.web),
                    onTap: () {
// change app state...
                      MyDrawer._gotoPage("/anim", context);
                    },
                  ),
                ),
                new Hero(
                  tag: 'Anim2',
                  child: ListTile(
                    title: Text("Animations Two"),
                    leading: Icon(Icons.looks_two),
                    onTap: () {
// change app state...
                      MyDrawer._gotoPage("/anim2", context);
                    },
                  ),
                ),
          ]))
        ],
      ),
    );
  }
}
