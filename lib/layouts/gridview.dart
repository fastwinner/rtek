import 'package:flutter/material.dart';
import 'package:rtek/view/Pages/historique.dart';
import 'package:rtek/view/Pages/messages.dart';
import 'package:rtek/view/Pages/rdv.dart';
import 'package:rtek/view/Pages/resultat.dart';

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
