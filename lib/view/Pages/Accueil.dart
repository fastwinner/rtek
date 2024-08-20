import 'package:flutter/material.dart';
import 'package:rtek/view/Pages/test.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class accueil extends StatefulWidget {
  @override
  _accueilState createState() => _accueilState();
}

class _accueilState extends State<accueil> {
  final controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Container(
                    height: 150,
                    child: PageView(
                      controller: controller,
                      children: [
                        Container( color: Colors.orange),
                        Container( color: Colors.blue),
                        Container( color: Colors.green),
                      ],
                    ),
                  ),
                ),
                Padding( 
                  padding: EdgeInsets.all(0),
                  child : SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: WormEffect(
                      activeDotColor: Color(0xFF748CDF),
                      dotColor: Color(0xFFD9D9D9),
                      dotHeight: 18,
                      dotWidth: 18,
                    ), 
                  ),
                ),
                Text("bonjour"),
                MyGridView()
                
              ],
            ),
          )
    
        ],
      ),
    );
  }
}

