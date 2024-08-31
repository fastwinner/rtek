
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rtek/view/Pages/Accueil.dart';

class navbar extends StatefulWidget {
  @override
  _navbarState createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  int myCurrentIndex = 0;

  // Liste des pages
  final List<Widget> pages = [
    accueil(),
    Center(child: Text('Favorite Page')),
    Center(child: Text('Settings Page')),
    Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title : Row(
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
                  "Hello, \nBinette",
                  style:TextStyle( 
                    fontSize: 20
                  )  
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
      ),
      body: pages[myCurrentIndex],
      bottomNavigationBar: Container(
        height: 75,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xFF748CDF),
            selectedItemColor: Colors.pink,
            unselectedItemColor: Colors.white,
            currentIndex: myCurrentIndex,
            onTap: (index) {
              setState(() {
                myCurrentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
              BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
            ],
          ),
        ),
      ),
    );


  }
}

/**
 
  bottomNavigationBar: Container(
    height: 75,
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    
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
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
    ),
  ),
  body: pages[myCurrentIndex],

 */
