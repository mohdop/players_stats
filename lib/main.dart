import 'package:flutter/material.dart';
import 'package:players_stats/Pages/Players.dart';
import 'package:players_stats/Pages/teams.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: PlayersPage(),
      routes: {
        '/home': (context) => PlayersPage(),
        "/teams": (context) => TeamPage(),
      },
    );
  }
}
