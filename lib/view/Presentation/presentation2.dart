import 'package:flutter/material.dart';

class Presentation2 extends StatefulWidget {
  const Presentation2({super.key});

  @override
  State<Presentation2> createState() => _Presentation2State();
}

class _Presentation2State extends State<Presentation2> {

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Column(
          children: [
           Padding(
             padding: const EdgeInsets.only(left: 30,right: 30),
             child: Container(
               child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  "assets/images/home2.png",
                 ),
               ),
             ),
           )
          ],
        ),
      )
    );  
 
 
  }
}
