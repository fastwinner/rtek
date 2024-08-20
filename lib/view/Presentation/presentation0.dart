import 'package:flutter/material.dart';
import 'package:rtek/view/Presentation/Presentation1.dart';
import 'package:rtek/view/Presentation/Presentation2.dart';
import 'package:rtek/view/Presentation/Presentation3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Presentation0 extends StatefulWidget {
  const Presentation0({super.key});

  @override
  State<Presentation0> createState() => _Presentation0State();
}

class _Presentation0State extends State<Presentation0> {
  final controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              children: [
                Presentation1(),
                Presentation2(),
                Presentation3(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: SmoothPageIndicator(
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
        ],
      ),
    );
  }
}
