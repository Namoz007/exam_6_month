import 'package:flutter/material.dart';

class StattisticScreen extends StatefulWidget {
  const StattisticScreen({super.key});

  @override
  State<StattisticScreen> createState() => _StattisticScreenState();
}

class _StattisticScreenState extends State<StattisticScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistic screen"),
      ),
    );
  }
}
