import 'package:flutter/material.dart';
import 'package:players_stats/Model/players_model.dart';
import 'package:players_stats/Pages/Player_info.dart';
import 'package:players_stats/Services/PlayersServices.dart';

class PlayersPage extends StatefulWidget {
  
  const PlayersPage({Key? key}) : super(key: key);

  @override
  State<PlayersPage> createState() => _playersPage();
}

class _playersPage extends State<PlayersPage> {
  final _playerService = PlayerServices();

  List<Player> _players = []; // List of players instead of Weather object

  // Fetch players
  _fetchPlayers() async {
    try {
      // get players
      final players = await _playerService.getPlayers("searchTerm");
      print("Player Data: $players"); // Add this line
      setState(() {
        _players = players;
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
    print("Building PlayersPage");
    return Scaffold(
       appBar: AppBar(
        
        title: Text("NBA Players",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.group),
          onPressed: () {
            Navigator.pushNamed(context, "/teams");
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
                itemCount: _players.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                     onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlayerInfo(player: _players[index]),
                    ),
                  );
                },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the border radius as needed
                      ),
                      child: ListTile(
                        title: Text(
                          "Player:${_players[index].firstName} ${_players[index].lastName} ",
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Text("Position ${_players[index].position}"),
                        trailing:
                            Text("team: ${_players[index].team.abbreviation}"),
                  
                        // Add any additional player information you want to display
                      ),
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
