import 'package:clash_royale/cards_page.dart';
import 'package:clash_royale/home_page.dart';
import 'package:clash_royale/initial_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark // tema escuro
        ),
      home: InitialPage(), // define a página que começa
      routes: { // rotas para os botões, com os nomes das páginas
        'Home': (context) => HomePage(),
        'Start': (context) => InitialPage(),
        'Card': (context) => CardsPage(),
      },
    );
  }
}