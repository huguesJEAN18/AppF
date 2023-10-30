import 'package:flutter/material.dart';
import 'package:fut_app/my_page/my_page_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class MyPage extends GetView<MyPageController> {
  const MyPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments = Get.arguments;
    if (arguments == null || arguments.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Erreur'),
        backgroundColor: Colors.blue,
        elevation: 2,
        toolbarHeight: 70,
       leading: IconButton(
    icon: Icon(Icons.arrow_back), 
    onPressed: () {
      Get.toNamed('/home');
    },
  ),
        ),
        body: Center(
          child: Text('Données manquantes ou incorrectes'),
        ),
      );
    }

    final name = arguments['name'];
    final poste = arguments['poste'];
    final rating = arguments['rating'];
    final skillMoves = arguments['skillMoves'];
    final weakFoot = arguments['weakFoot'];
    final attackWorkRate = arguments['attackWorkRate'];
    final defenseWorkRate = arguments['defenseWorkRate'];
    final defending = arguments['defending'];
    final foot = arguments['foot'];
    final dribbling = arguments['dribbling'];
    final totalStatsInGame = arguments['totalStatsInGame'];
    final pace = arguments['pace'];
    final passing = arguments['passing'];
    final physicality = arguments['physicality'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du joueur'),
        backgroundColor: Colors.blue,
        elevation: 2,
        toolbarHeight: 70,
       leading: IconButton(
    icon: Icon(Icons.arrow_back), 
    onPressed: () {
  Get.toNamed('/home');
    },
  ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
         
          children: [
            buildInfoCard('Nom', name),
            buildInfoCard('Poste', poste),
            buildInfoCard('Note générale', rating.toString()),
            buildInfoCard('Gestes techniques', skillMoves.toString()),
            buildInfoCard('Mauvais pied', weakFoot.toString()),
            buildInfoCard('Rendement défensif', defenseWorkRate.toString()),
            buildInfoCard('Rendement offensif', attackWorkRate.toString()),
            buildInfoCard('Pied', foot),
            buildInfoCard('Physique', physicality.toString()),
            buildInfoCard('Dribble', dribbling.toString()),
            buildInfoCard('Vitesse', pace.toString()),
            buildInfoCard('Passe', passing.toString()),
            buildInfoCard('Total jeux', totalStatsInGame.toString()),
          ],
        ),
      ),
    );
  }

  Widget buildInfoCard(String title, String value) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(value),
        ),
      ),
    );
  }
}
