import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/players_model.dart';

class PlayerServices {
  static const BASE_URL = "https://www.balldontlie.io/api/v1/players";

  Future<List<Player>> getPlayers(String searchTerm) async {
    final response = await http.get(Uri.parse('$BASE_URL?'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      // Extract the list of players from the "data" key
      final List<dynamic> playersData = data['data'];

      return playersData.map((playerData) {
        // Map each player data to a Player object
        return Player.fromJson(playerData);
      }).toList();
    } else {
      final errorMessage = response.statusCode == 401
          ? "Unauthorized request. Please check your API key."
          : "Failed to load player data. Status code: ${response.statusCode}";
      throw Exception(errorMessage);
    }
  }
}
