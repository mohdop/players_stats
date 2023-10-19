import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Model/players_model.dart';

class PlayerInfo extends StatefulWidget {
  final Player player;
 

  const PlayerInfo({Key? key, required this.player}) : super(key: key);

  @override
  State<PlayerInfo> createState() => _PlayerInfoState();
}

class _PlayerInfoState extends State<PlayerInfo> {
  
  @override
  Widget build(BuildContext context) {
    int heightInfeet = widget.player.height_feet;
    int heightInches = widget.player.height_inches;
    String message="";
    if (heightInfeet==0) {
      message= "size not known";
    }else{
      message="$heightInfeet'$heightInches";
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Lottie.asset("assets/basketball.json"),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Text(
                  "${widget.player.firstName} ${widget.player.lastName}",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(
                        decoration: BoxDecoration(color: Colors.blue[900]),
                        children: [
                          _buildTableCell("Height", Colors.white),
                          _buildTableCell("Position", Colors.white),
                          _buildTableCell("Team", Colors.white),
                        ]),
                    TableRow(children: [
                      _buildTableCell(
                          "$message",
                          Colors.black),
                      _buildTableCell(
                          "${widget.player.position}", Colors.black),
                      _buildTableCell(
                          "${widget.player.team.fullName}", Colors.black),
                    ]),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTableCell(String text, Color color) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TableCell(
      child: Text(
        text,
        style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: color),
      ),
    ),
  );
}
