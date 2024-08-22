import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakertutorial/models/cart.dart';
import 'package:sneakertutorial/pages/intro_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Cart(),
        builder: (context, child) => const MaterialApp(
            debugShowCheckedModeBanner: false, home: IntroPage()));
  }
}
