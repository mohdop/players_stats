import 'package:flutter/material.dart';
import 'package:players_stats/Model/team_model.dart';

import '../Services/TeamServices.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({Key? key}) : super(key: key);

  @override
  State<TeamPage> createState() => _teamPage();
}

class _teamPage extends State<TeamPage> {
  final _teamServices = TeamServices();

  List<Team> _teams = []; // List of players instead of Weather object

  // Fetch players
  _fetchPlayers() async {
    try {
      // get players
      final players = await _teamServices.getTeams();
      print("Player Data: $players"); // Add this line
      setState(() {
        _teams = players;
      });
    } catch (e) {
      print("Error fetching players: $e"); // Add this line
    }
  }

  @override
  void initState() {
    super.initState();
    // fetch players on startup
    _fetchPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NBA Teams",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.sports),
          onPressed: () {
            Navigator.pushNamed(context, "/home");
          }),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // List of players
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: _teams.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Adjust the border radius as needed
                    ),
                    child: ListTile(
                      title: Text(
                        "${_teams[index].city} ${_teams[index].abbreviation} ",
                        style: TextStyle(color: Colors.black),
                      ),
                      subtitle:
                          Text(" ${_teams[index].conference}ern conference"),
                      trailing: Text(" ${_teams[index].abbreviation}"),

                      // Add any additional player information you want to display
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
