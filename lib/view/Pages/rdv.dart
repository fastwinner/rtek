import 'package:flutter/material.dart';

class rdv extends StatefulWidget {
  const rdv({super.key});

  @override
  State<rdv> createState() => _rdvState();
}

class _rdvState extends State<rdv>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Text( "rdv");
  }
}