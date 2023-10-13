import 'dart:typed_data';

class Player {
  final String name;
  final String position;
  final int skillMoves;
  final int weakFoot;
  final int rating;
    final int playerId; 

  Player({
    required this.name,
    required this.position,
    required this.skillMoves,
    required this .weakFoot,
    required this.rating,
      required this.playerId
  });
}
