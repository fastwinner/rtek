import 'package:flutter/material.dart';
import 'package:rtek/view/Pages/historique.dart';
import 'package:rtek/view/Pages/messages.dart';
import 'package:rtek/view/Pages/rdv.dart';
import 'package:rtek/view/Pages/resultat.dart';

class MyGridView extends StatelessWidget {
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

  final List<Widget> lien = [
    resultat(),
    message(),
    rdv(),
    historique()
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 1.0,
        ),
        itemCount: nom.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom (
              backgroundColor: Color(0xFFD9D9D9),
              shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), 
                  ), 
            ),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => lien[index] ),
                );
            },
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(icone[index]),
                    SizedBox(height: 20,),
                    Text(
                      nom[index],
                      style: TextStyle(color: Color(0xFF535353), fontSize: 20),
                    ),
                  ]
                ),
              
          );
        },
      ),
    );
  }
}
