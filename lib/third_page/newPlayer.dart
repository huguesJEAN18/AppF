import 'package:flutter/material.dart';
import 'package:fut_app/model/rarety.dart';

class RarityView extends StatelessWidget {
  final List<Rarity> rarities;

  RarityView({required this.rarities});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Rarités'),
      ),
      body: ListView.builder(
        itemCount: rarities.length,
        itemBuilder: (context, index) {
          final rarity = rarities[index];
          return ListTile(
            title: Text(rarity.rarety),
            // Affichez d'autres propriétés de la rareté ici si nécessaire
          );
        },
      ),
    );
  }
}
