import 'dart:convert';
import 'package:fut_app/model/player.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';

class HomeController extends GetxController with StateMixin {
  int championId = 0;
  var name, note, gp, pm, poste, i;
  final int maxPages = 18;
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
          'X-AUTH-TOKEN': 'd2fca0bd-96d1-4f2a-b7c5-3368a9591a8c',
        },
      );

       String apiUrlImage = 'https://futdb.app/api/players/$i/image'; // Remplacez par l'URL de votre API
      var responseImage = await http.get(
      Uri.parse(apiUrlImage),
      headers: {
        'accept': 'image/png', // Assurez-vous d'utiliser le bon type de contenu ici
        'X-AUTH-TOKEN': 'd2fca0bd-96d1-4f2a-b7c5-3368a9591a8c',
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
        print('Nom du joueur : $name');
        print('Position : $poste');
        print('Skill Moves : $gp');
        print('Weak Foot : $pm');
        print('Note : $note');

          // Convertissez la réponse en données d'image (Uint8List)
      imageData = response.bodyBytes;
      change(null, status: RxStatus.success());

        final player = Player(
      name: name,
      position: poste,
      skillMoves: gp,
      weakFoot: pm,
      rating: note,
     
    );
    

    players.add(player); 
      } else {
          change(null, status: RxStatus.error('Échec de la requête'));
        print('La requête a échoué avec le code de statut ${response.statusCode}');
      }
    }
  }

  
}
