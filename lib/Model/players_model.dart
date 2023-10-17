import 'package:players_stats/Model/team_model.dart';

class Player {
  final String firstName;
  final String lastName;
  final String position;
  final Team team;

  Player({
    required this.firstName,
    required this.lastName,
    required this.position,
    required this.team,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      firstName: json['first_name'],
      lastName: json['last_name'],
      position: json['position'],
      team: Team.fromJson(json['team']),
    );
  }
}
