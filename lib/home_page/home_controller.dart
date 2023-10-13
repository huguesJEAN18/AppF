import 'dart:convert';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController with StateMixin {
  int championId = 0;
  var name, note, gp ,pm, poste;

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());

    //Si il y a des arguments
    //Et si un argument à la clef 'championId'
    if (Get.arguments != null && Get.arguments.containsKey("championId")) {
      championId = Get.arguments["championId"];
    }
    await getComments();
    change(null, status: RxStatus.success());
    super.onInit();
  }

 Future<void> getComments() async {
  final String apiUrl = 'https://futdb.app/api/players/10';
  var response = await http.get(
    Uri.parse(apiUrl),
    headers: {
      'accept': 'application/json',
      'X-AUTH-TOKEN': 'd2fca0bd-96d1-4f2a-b7c5-3368a9591a8c',
    },
  );
  print(response);
  print('Response status: ${response.statusCode}');
  final Map<String, dynamic> jsonResponse = json.decode(response.body);
  name = jsonResponse['player']['name'];
  poste = jsonResponse['player']['position'];
  gp = jsonResponse['player']['skillMoves'];
  pm = jsonResponse['player']['weakFoot'];
  note = jsonResponse['player']['rating'];
   print('Nom du joueur : $name');
}

}
