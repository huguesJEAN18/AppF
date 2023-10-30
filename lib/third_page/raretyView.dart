import 'package:flutter/material.dart';
import 'package:fut_app/model/rarety.dart';
import 'package:fut_app/third_page/rarety_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';

class RarityPage extends GetView<RaretyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Raretés'),
      ),
      body: controller.obx(
        (state) => ListView.builder(
          itemCount: controller.rarities.length,
          itemBuilder: (context, index) {
            final rarity = controller.rarities[index];
            return ListTile(
              title: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Container(
                  height: 80,
                  color: Color.fromARGB(179, 217, 216, 216),
                  child: Row(
                    children: [
                      SizedBox(width: 15,),
                      Container(
                        height: 40,
                        width: 40,
                       color: getRarityColor(rarity.name),
                      ),
                      SizedBox(width: 15,),
                      Text(rarity.name),
                    ],
                  )
                  ),
              ),
            
            );
          },
        ),
        onLoading: const CircularProgressIndicator(),
        onError: (error) => Center(child: Text('Erreur: $error')),
      ),
      bottomNavigationBar:  BottomAppBar(
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                       
                        Get.toNamed('/home');
                      },
                      child: const Text(
                        "Home",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed('/rarity');
                      },
                      child: const Text(
                        "Rarety",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}

Color getRarityColor(String rarityName) {
  if (rarityName == 'Non-Rare') {
    return Colors.red;
  } else if (rarityName == 'Rare') {
    return Colors.blue;
  } else if (rarityName == 'TOTW') {
    return const Color.fromARGB(255, 6, 6, 6);
  } 
   else if (rarityName == 'TOTY') {
    return Color.fromARGB(255, 3, 3, 123);
  } 
   else if (rarityName == 'Record Breaker') {
    return Colors.green;
  } 
   else if (rarityName == 'MOTM') {
    return Color.fromARGB(255, 250, 121, 9);
  } 
   else if (rarityName == 'Professional Player card') {
    return Color.fromARGB(255, 6, 191, 228);
  } 
   else if (rarityName == 'TOTS') {
    return Color.fromARGB(255, 19, 86, 130);
  } 
   else if (rarityName == 'Icon') {
    return const Color.fromARGB(255, 199, 221, 200);
  } 
   else if (rarityName == 'FUTTIES') {
    return Colors.green;
  } 
   else if (rarityName == 'FUT Champions') {
    return Color.fromARGB(255, 206, 26, 13);
  } 
   else if (rarityName == 'Ones To Watch') {
    return Color.fromARGB(255, 44, 7, 137);
  } 
   else if (rarityName == 'FUT Birthday') {
    return Color.fromARGB(255, 37, 108, 209);
  } 
   else if (rarityName == 'Award Winner') {
    return Color.fromARGB(255, 228, 17, 179);
  } 
   else if (rarityName == 'Hero') {
    return Color.fromARGB(255, 118, 163, 12);
  } 
   else if (rarityName == 'Eredivisie POTM SBC') {
    return Color.fromARGB(255, 70, 10, 222);
  } 
   else if (rarityName == 'Versus Fire') {
    return Color.fromARGB(255, 44, 7, 137);
  } 
   else if (rarityName == 'Next Generation') {
    return Color.fromARGB(255, 198, 12, 189);
  } 
   else if (rarityName == 'Winter Wildcards') {
    return Color.fromARGB(255, 131, 130, 133);
  } 
   else if (rarityName == 'UCL RTTF') {
    return Color.fromARGB(255, 44, 7, 137);
  } 
   else if (rarityName == 'UEL RTTF') {
    return Color.fromARGB(255, 160, 116, 4);
  } 
   else if (rarityName == 'UECL RTTF') {
    return Color.fromARGB(255, 17, 178, 6);
  } 
   else if (rarityName == 'Ones To Watch') {
    return Color.fromARGB(255, 44, 7, 137);
  } 
  else {
    return Colors.grey; // Couleur par défaut
  }
}
