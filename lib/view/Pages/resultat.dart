import 'package:flutter/material.dart';

class resultat extends StatefulWidget {
  const resultat({super.key});

  @override
  State<resultat> createState() => _resultatState();
}

class _resultatState extends State<resultat>
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
    return const Text("resultat");
  }
}