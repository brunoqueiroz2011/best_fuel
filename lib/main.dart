import 'package:best_fuel/pages/root_page.dart';
import 'package:best_fuel/utility/default_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Best Fuel",
    theme: ThemeData(
        primaryColor: DefaultColor.getcolorDefault,
        brightness: Brightness.light),
    debugShowCheckedModeBanner: false,
    home: const RootPage(),
  ));
}
