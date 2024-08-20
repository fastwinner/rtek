import 'package:flutter/material.dart';
import 'package:rtek/view/Auth/Bienvenue.dart';

class Presentation3 extends StatefulWidget {
  const Presentation3({super.key});

  @override
  State<Presentation3> createState() => _Presentation3State();
}

class _Presentation3State extends State<Presentation3> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70,left: 30,right: 30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                "assets/images/home3.png",
                ),
              ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Bienvenue()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, 
                  backgroundColor: Color(0xFF748CDF), // Couleur du texte
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Forme arrondie du bouton
                  ), 
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Padding interne
                ),
                child: Text("Suivant") 
                ),
              ),
            ],
          )
        ],
      )
    );  

  }
}
