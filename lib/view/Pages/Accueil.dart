import 'package:flutter/material.dart';
import 'package:rtek/layouts/card.dart';
import 'package:rtek/layouts/gridview.dart';
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Container(
                    height: 175,
                    child: PageView(
                      controller: controller,
                      children: [
                        card(),
                        card(),
                        card(),
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
                SizedBox(height: 50,),
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
