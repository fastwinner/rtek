import 'package:flutter/material.dart';


class Presentation1 extends StatefulWidget {
  const Presentation1({super.key});

  @override
  State<Presentation1> createState() => _Presentation1State();
}

class _Presentation1State extends State<Presentation1> {
  final controller = PageController(
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  "assets/images/home1.png",
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
