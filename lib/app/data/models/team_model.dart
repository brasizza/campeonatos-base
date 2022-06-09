// ignore_for_file: public_member_api_docs, sort_constructors_first
class Team {
  final String team;
  final String teamSlug;
  final String? teamId;
  final int teamScId;
  final int index;
  final int matches;
  final int points;
  final int wins;
  final int draws;
  final int loses;
  Team({
    required this.team,
    required this.teamSlug,
    this.teamId,
    required this.teamScId,
    required this.index,
    required this.matches,
    required this.points,
    required this.wins,
    required this.draws,
    required this.loses,
  });
}
