import 'package:players_stats/Model/team_model.dart';

class Player {
  final String firstName;
  final String lastName;
  final String position;
  final Team team;
  final int height_feet;
  final int height_inches;

  Player({
    required this.firstName,
    required this.lastName,
    required this.position,
    required this.team,
    required this.height_feet,
    required this.height_inches,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      position: json['position'] ?? '',
      height_feet: json['height_feet'] ?? 0,
      height_inches: json['height_inches'] ?? 0,
      team: Team.fromJson(json['team'] ?? {}),
    );
  }
}
