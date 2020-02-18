import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../routes/routes.dart';

class ProfilePage extends StatefulWidget {
  State<StatefulWidget> createState() => new _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: CustomSliverDelegate(expandedHeight: 120.0) ,
          ),
          SliverFillRemaining(
            child:Column(
              children: <Widget>[
                Row(children: <Widget>[
                  SizedBox(width: 10,height: 50,),
                  Icon(Icons.face,color: Colors.blue[500],),SizedBox(width: 8),
                  Text("Tom Ellis",style: TextStyle(fontSize: 20,fontFamily:"Merriweather"),),
                ],),
                Row(children: <Widget>[
                  SizedBox(width: 10,height: 50,),
                  Icon(Icons.work,color: Colors.blue[500],),SizedBox(width: 8),
                  Text("Poste : Mecanicien",style: TextStyle(fontSize: 20,fontFamily:"Merriweather"),),
                ],),
                Row(children: <Widget>[
                  SizedBox(width: 10,height: 50,),
                  Icon(Icons.email,color: Colors.blue[500],),SizedBox(width: 8),
                  Text("login : Tom_Ellis@Netflix.com",style: TextStyle(fontSize: 20,fontFamily:"Merriweather"),),
                ],),
                Row(children: <Widget>[
                  SizedBox(width: 10,height: 50,),
                  Icon(Icons.phone,color: Colors.blue[500],),SizedBox(width: 8),
                  Text("Adress telephonique : 0662035527",style: TextStyle(fontSize: 20,fontFamily:"Merriweather"),),
                ],),
                Divider(
                  height: 20,
                  color: Colors.grey[600],
                ),
                Column(children: <Widget>[
                  ListTile(  trailing: Icon(Icons.arrow_forward_ios,color: Colors.blue[500],),
                    leading: Icon(Icons.assignment,color: Colors.blue[500],),
                    title: Text("Consulter les demandes de fiche de reparation",style: TextStyle(fontSize: 20,fontFamily:"SourceSansPro"),),
                  )
                ],),
                Divider(
                  height: 20,
                  color: Colors.black,
                ),
    Expanded(child:
                 Text("Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker."
                    "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker"
                    ,style: TextStyle(fontSize: 20),))

              ],
            ) ,
          )
        ],
      )


    );
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;

  CustomSliverDelegate({
    @required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: AppBar(
              backgroundColor: Colors.indigo[300],
              elevation: 0.0,
              title: Opacity(
                  opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                  child: Text("Tom Ellis")),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: 0.0,
            child: Opacity(
              opacity: percent,
              child: Center(
                child: Container(
                  width: 140.0,
                  height: 140.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/luci.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(80.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 10.0,
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

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

