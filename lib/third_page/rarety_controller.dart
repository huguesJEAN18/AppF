import 'dart:convert';
import 'package:fut_app/model/rarety.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

class RaretyController extends GetxController with StateMixin {
  List<Rarity> rarities = [];

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
  for (int page = 1; page <= 6; page++) {
    final String apiUrl = 'https://futdb.app/api/rarities?page=$page';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'accept': 'application/json',
        'X-AUTH-TOKEN': '28f95e7e-db2e-4674-a012-5527df2c74ce',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final items = jsonResponse['items'];

      for (var data in items) {
        final name = data['name'];

        final rarity = Rarity(
          name: name,
        );

        rarities.add(rarity);
      }
    } else {
      change(null, status: RxStatus.error('Échec de la requête sur la page $page'));
      print('La requête sur la page $page a échoué avec le code de statut ${response.statusCode}');
    }
  }

  change(rarities, status: RxStatus.success());
}

}
