import 'package:flutter/material.dart';
import 'package:fut_app/home_page/home_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Get.toNamed('/home');
              },
              child: const Text(
                "FutApp",
                style: TextStyle(
                  fontFamily: 'PermanentMarker',
                  color: Colors.white,
                  fontSize: 40.0,
                ),
              ),
            ),
            // Ajouter une barre de recherche ici
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 70),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Rechercher...",
                    hintStyle: TextStyle(color: Colors.white),
                    icon: Icon(Icons.search, color: Colors.white),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
        elevation: 2,
        toolbarHeight: 70,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 5),
              Expanded(
                child: RawScrollbar(
                  
                            
                  controller: _scrollController,
                  radius: const Radius.circular(10),
                  thumbVisibility: false,
                  thumbColor: const Color.fromARGB(255, 144, 127, 127),
                  child: controller.obx((state) => 
                    ListView.builder(
                      
                              shrinkWrap: true,
            itemCount: controller.players.length,
            itemBuilder: (context, index) {
              final player = controller.players[index];

              return InkWell(
                child: listPlayer(player.name, player.position, player.rating,
                    player.skillMoves, player.weakFoot),
                onTap: () {
                  Get.offAndToNamed('/mypage', arguments: {
                    'name': player.name,
                    'poste': player.position,
                    'rating': player.rating,
                    'skillMoves': player.skillMoves,
                    'weakFoot': player.weakFoot,
                    'attackWorkRate':player.attackWorkRate,
                    'defenseWorkRate':player.defenseWorkRate,
                    'defending':player.defending,
                    'foot':player.foot,
                    'dribbling':player.dribbling,
                    'totalStatsInGame':player.totalStatsInGame,
                    'pace':player.pace,
                    'passing':player.passing,
                    'physicality':player.physicality
                   
                  });
                },
              );
            },
          ),
                  ),
                ),
              ),
              BottomAppBar(
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed('/home');
                      },
                      child: Column(
                        children: [
                          Icon(Icons.home),
                          const Text(
                            "Home",
                            
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed('/rarity');
                      },
                      child: Column(
                        children: [
                          Icon(Icons.star),
                          const Text(
                            "Rarety",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 90,
            right: 10,
            height: 40,
            width: 40,
            child: FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(0,
                    duration: const Duration(seconds: 1), curve: Curves.easeInOut);
              },
              child: const Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
              backgroundColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

Widget listPlayer(
  String nom,
  String poste,
  note,
  skillMoves,
  weakFoot,
) {
  return Card(
    elevation: 4,
    margin: const EdgeInsets.all(8),
    color: const Color.fromARGB(255, 175, 165, 219),
    child: Container(
      height: 80.0,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                child: Image.network(
                  "https://i.redd.it/4ixnult45bk51.jpg",
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              nom,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              poste,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 222, 197, 9),
                    border: Border.all(
                      color: const Color.fromARGB(255, 222, 197, 9),
                    ),
                  ),
                  child: Text(
                    "$note",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 1,
                  width: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.translate(
                      offset: const Offset(0, 2),
                      child: Text(
                        "$skillMoves",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 215, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 215, 0),
                    ),
                    const SizedBox(width: 5),
                    Transform.translate(
                      offset: const Offset(0, 2),
                      child: Text(
                        "$weakFoot",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 215, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 215, 0),
                    ),
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
