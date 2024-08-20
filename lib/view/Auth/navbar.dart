
import 'package:flutter/material.dart';

class CenteredContentPage extends StatefulWidget {
  @override
  _CenteredContentPageState createState() => _CenteredContentPageState();
}

class _CenteredContentPageState extends State<CenteredContentPage> {
  int myCurrentIndex = 0;

  // Liste des pages
  final List<Widget> pages = [
    Center(child: Text('Home Page')),
    Center(child: Text('Favorite Page')),
    Center(child: Text('Settings Page')),
    Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 25,
            offset: const Offset(8, 20),
          )
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            selectedItemColor: Colors.redAccent,
            unselectedItemColor: Colors.black,
            currentIndex: myCurrentIndex,
            onTap: (index) {
              setState(() {
                myCurrentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favorite"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Setting"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: "Profile"),
            ],
          ),
        ),
      ),
      body: pages[myCurrentIndex],
    );
  }
}




/*
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [

          Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [ 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              children: [
                Row( 
                  children: [ 
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      //ici deviendra image.network
                      child: Image.asset(
                        "assets/images/Shape.png",
                        width: 40,
                        height: 40,
                      ),
                    ),
                    SizedBox(width: 5),
                    //prendre le nom dans la base de données
                    Text( 
                    "Hello, \nBinette"
                    )
                  ],
                ),
                Image.asset(
                  "assets/icones/Notification.png",
                  width: 40,
                  height: 40,
                ),
              ],
            ),
            Row( 
              children: [ 
                Expanded(
                  child: Divider(
                    color: Colors.blue,
                    thickness: 1,
                  ),
                ),
                Text("ou"),
                Expanded(child: Divider())
              ],
            )
          ],
        ),
      )
    
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: CustomNavigationBar()));
*/