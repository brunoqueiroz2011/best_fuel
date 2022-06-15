import 'package:best_fuel/pages/home_page.dart';
import 'package:best_fuel/utility/default_color.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Álcool ou Gasolina"),
        backgroundColor: DefaultColor.getcolorDefault,
      ),
      body: const HomePage(),
    );
  }
}
