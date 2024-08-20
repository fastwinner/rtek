import 'package:flutter/material.dart';
import 'package:rtek/view/Auth/Connexion.dart';
import 'package:rtek/view/Auth/Inscription.dart';

class Bienvenue extends StatefulWidget {
  const Bienvenue({super.key});

  @override
  State<Bienvenue> createState() => _BienvenueState();
}

class _BienvenueState extends State<Bienvenue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, bottom: 15),
            child: Image.asset(
              "assets/images/rtek.png",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 45),
            child: Image.asset(
              "assets/images/welcome.png",
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(175, 40),
                backgroundColor: Color(0xFF748CDF),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              Navigator.push(context,
                  PageRouteBuilder(pageBuilder: (_, __, ___) => connexion()));
            },
            child: Text(
              "Se Connecter",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal
              ),
            )
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                side: BorderSide(
                  color: Color(0xFF748CDF),
                  width: 2,
                ),
                minimumSize: Size(175, 40),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => inscription()));
            },
            child: Text(
              "S'inscrire",
              style: TextStyle( 
                color: Color(0xFF748CDF),
                fontSize: 18,
                fontWeight: FontWeight.normal
              ),
            )
          ),
        ],
      ),
    );
  }
}
