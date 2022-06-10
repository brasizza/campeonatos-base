// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Game {
  final String gameId;
  final String time1;
  final String idTime1;
  final int placarTime1;
  final String time2;
  final String idTime2;
  final int placarTime2;
  final String status;
  final DateTime dateGame;
  Game({
    required this.gameId,
    required this.time1,
    required this.idTime1,
    required this.placarTime1,
    required this.time2,
    required this.idTime2,
    required this.placarTime2,
    required this.status,
    required this.dateGame,
  });

  Game copyWith({
    String? gameId,
    String? time1,
    String? idTime1,
    int? placarTime1,
    String? time2,
    String? idTime2,
    int? placarTime2,
    String? status,
    DateTime? dateGame,
  }) {
    return Game(
      gameId: gameId ?? this.gameId,
      time1: time1 ?? this.time1,
      idTime1: idTime1 ?? this.idTime1,
      placarTime1: placarTime1 ?? this.placarTime1,
      time2: time2 ?? this.time2,
      idTime2: idTime2 ?? this.idTime2,
      placarTime2: placarTime2 ?? this.placarTime2,
      status: status ?? this.status,
      dateGame: dateGame ?? this.dateGame,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gameId': gameId,
      'time1': time1,
      'idTime1': idTime1,
      'placarTime1': placarTime1,
      'time2': time2,
      'idTime2': idTime2,
      'placarTime2': placarTime2,
      'status': status,
      'dateGame': dateGame.millisecondsSinceEpoch,
    };
  }

  factory Game.fromMap(Map<String, dynamic> map) {
    return Game(
      gameId: map['gameId'] as String,
      time1: map['side1'] as String,
      idTime1: map['side1ScId'] as String,
      placarTime1: map['score1'] as int,
      time2: map['side2'] as String,
      idTime2: map['side2ScId'] as String,
      placarTime2: map['score2'] as int,
      status: map['status'] as String,
      dateGame: DateTime.parse(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Game.fromJson(String source) => Game.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Game(gameId: $gameId, time1: $time1, idTime1: $idTime1, placarTime1: $placarTime1, time2: $time2, idTime2: $idTime2, placarTime2: $placarTime2, status: $status, dateGame: $dateGame)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Game && other.gameId == gameId && other.time1 == time1 && other.idTime1 == idTime1 && other.placarTime1 == placarTime1 && other.time2 == time2 && other.idTime2 == idTime2 && other.placarTime2 == placarTime2 && other.status == status && other.dateGame == dateGame;
  }

  @override
  int get hashCode {
    return gameId.hashCode ^ time1.hashCode ^ idTime1.hashCode ^ placarTime1.hashCode ^ time2.hashCode ^ idTime2.hashCode ^ placarTime2.hashCode ^ status.hashCode ^ dateGame.hashCode;
  }
}
