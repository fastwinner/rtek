import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:rtek/view/Pages/historique.dart';
import 'package:rtek/view/Pages/messages.dart';
import 'package:rtek/view/Pages/rdv.dart';
import 'package:rtek/view/Pages/resultat.dart';

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
                        Text("Hello, \nBinette")
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
                        Container(color: Colors.orange),
                        Container(color: Colors.blue),
                        Container(color: Colors.green),
                      ],
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: WormEffect(
                    activeDotColor: Color(0xFF748CDF),
                    dotColor: Color(0xFFD9D9D9),
                    dotHeight: 5,
                    dotWidth: 10,
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: myGridView(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

GridView myGridView() {
  final List<String> nom = [
    'Mes resultats',
    'Messages',
    'Prendre rdv',
    'Historiques',
  ];

  final List<String> icone = [
    "assets/icones/Resume.png",
    "assets/icones/Message.png",
    "assets/icones/Calendar.png",
    "assets/icones/Medical.png",
  ];

  final List<Widget> lien = [resultat(), message(), rdv(), historique()];
  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 15.0,
      mainAxisSpacing: 15.0,
      childAspectRatio: 1.0,
    ),
    itemCount: nom.length,
    itemBuilder: (context, index) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFD9D9D9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => lien[index]),
          );
        },
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(icone[index]),
          SizedBox(
            height: 20,
          ),
          Text(
            nom[index],
            style: TextStyle(color: Color(0xFF535353), fontSize: 18),
          ),
        ]),
      );
    },
  );
}
