import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:players_stats/Model/team_model.dart';

class TeamServices {
  static const BASE_URL = "https://www.balldontlie.io/api/v1/teams";

  Future<List<Team>> getTeams() async {
    final response = await http.get(Uri.parse('$BASE_URL?'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      // Extract the list of players from the "data" key
      final List<dynamic> teamData = data['data'];

      return teamData.map((teamData) {
        // Map each player data to a Player object
        return Team.fromJson(teamData);
      }).toList();
    } else {
      final errorMessage = response.statusCode == 401
          ? "Unauthorized request. Please check your API key."
          : "Failed to load player data. Status code: ${response.statusCode}";
      throw Exception(errorMessage);
    }
  }
}
