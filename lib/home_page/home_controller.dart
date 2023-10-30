import 'dart:convert';
import 'package:fut_app/model/config.dart';
import 'package:fut_app/model/player.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';

class HomeController extends GetxController with StateMixin {
  int championId = 0;
   var name, note, gp, pm, poste, i,weakFoot,skillMoves,physicality,defending,dribbling,passing,shooting,totalStatsInGame
   ,defenseWorkRate,attackWorkRate,pace,foot, id;
  final int maxPages = 78;
    late Uint8List imageData; 

  List<Player> players = [];

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());

    if (Get.arguments != null && Get.arguments.containsKey("championId")) {
      championId = Get.arguments["championId"];
    }
    
    await getPlayersFromPages();
   
    change(null, status: RxStatus.success());
    super.onInit();
  }

  Future<void> getPlayersFromPages() async {
    for (i = 1; i <= maxPages; i++) {
      final String apiUrl = 'https://futdb.app/api/players/$i';
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'accept': 'application/json',
          'X-AUTH-TOKEN': apiToken,
        },
      );

       String apiUrlImage = 'https://futdb.app/api/players/$i/image';
      var responseImage = await http.get(
      Uri.parse(apiUrlImage),
      headers: {
        'accept': 'image/png',
        'X-AUTH-TOKEN': apiToken,
      },
    );
      print('Page $i:');
      print(response);
       print('Response status: ${response.statusCode}');
      print('Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        name = jsonResponse['player']['name'];
        poste = jsonResponse['player']['position'];
        gp = jsonResponse['player']['skillMoves'];
        pm = jsonResponse['player']['weakFoot'];
        note = jsonResponse['player']['rating'];
        attackWorkRate = jsonResponse['player']['attackWorkRate'];
        defenseWorkRate= jsonResponse['player']['defenseWorkRate'];
        foot= jsonResponse['player']['foot'];
        totalStatsInGame= jsonResponse['player']['totalStatsInGame'];
        pace= jsonResponse['player']['pace'];
        shooting = jsonResponse['player']['shooting'];
        passing = jsonResponse['player']['passing'];
        dribbling = jsonResponse['player']['dribbling'];
        defending = jsonResponse['player']['defending'];
        physicality = jsonResponse['player']['physicality'];
        print('Nom du joueur : $name');
        print('Position : $poste');
        print('Skill Moves : $gp');
        print('Weak Foot : $pm');
        print('Note : $note');

          
      imageData = response.bodyBytes;
      change(null, status: RxStatus.success());

        final player = Player(
      name: name,
      position: poste,
      skillMoves: gp,
      weakFoot: pm,
      rating: note,
     attackWorkRate:attackWorkRate,
      defenseWorkRate:defenseWorkRate,
      foot:foot,
      totalStatsInGame:totalStatsInGame,
      pace:pace,
      shooting:shooting,
      passing:passing,
      dribbling:dribbling,
      defending:defending,
      physicality:physicality, 
      
    );
    

    players.add(player); 
      } else {
          change(null, status: RxStatus.error('Échec de la requête'));
        print('La requête a échoué avec le code de statut ${response.statusCode}');
      }
    }
  }

  
}
