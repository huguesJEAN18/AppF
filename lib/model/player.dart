import 'dart:typed_data';

class Player {
 
  final String name;
  final String position;
  final int skillMoves;
  final int weakFoot;
  final int rating;
    final int dribbling;
  final int defending;
  final int physicality;
    final String attackWorkRate;
  final String defenseWorkRate;
  final String foot;
  final int totalStatsInGame;
  final int pace;
  final int shooting;
  final int passing;

  Player(
    {required this.attackWorkRate, 
    required this.defenseWorkRate, 
    required this.foot, 
    required this.totalStatsInGame, 
    required this.pace, 
    required this.shooting, 
    required this.passing, 
    required this.dribbling, 
    required this.defending, 
    required this.physicality,  
    
    required this.name,
    required this.position,
    required this.skillMoves,
    required this.weakFoot,
    required this.rating,
      
  });
}