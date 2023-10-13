import 'package:flutter/material.dart';
import 'package:fut_app/home_page/home_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
          title: Text("FutApp"),
          backgroundColor: Colors.blue,
          elevation: 2,
          toolbarHeight: 70),
      body: controller.obx(
        (state) => 
        ListView.builder(
          itemCount: controller.players.length,
          itemBuilder: (context, index) {
            final player = controller.players[index];
            return listPlayer(player.name, player.position, player.rating,player.skillMoves, player.weakFoot);
          },
        ),

        //onLoading: const CircularProgressIndicator(),
        onError: (error) => Text("Mon erreur : $error"),
      ),
    );
  }
}

Widget listPlayer(nom, poste, note, skillMoves, weakFoot) {
  return Card(
    elevation: 4,
    child: Container(
      height: 70.0, // Hauteur fixe du Container
      child: Row(
        children: [
          Expanded(
            //flex: ,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 20.0,
                  left: 10,
                  right: 10), // Ajouter de l'espace autour du conteneur noir
              child: Container(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(nom),
          ),
          Expanded(
            flex: 0,
            child: Text(poste),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    border: Border.all(
                      color: const Color.fromARGB(255, 222, 197, 9),
                    ),
                  ),
                  child: Text(
                    "$note",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Centrer les éléments horizontalement
                  children: [
                    Text("$skillMoves"),
                    Icon(Icons.star),
                    Text("$weakFoot"),
                    Icon(Icons.star),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
