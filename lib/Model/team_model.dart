class Team{
  final String abbreviation;
  final String city;
  final String conference;
  final String fullName;

  Team({
    required this.abbreviation,
    required this.city,
    required this.conference,
    required this.fullName
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      abbreviation: json["abbreviation"],
      city: json["city"],
      conference: json["conference"],
      fullName: json["full_name"]
    );
  }

}