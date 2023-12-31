import 'package:flutter/material.dart';
import 'package:fut_app/home_page/home_bindings.dart';
import 'package:fut_app/home_page/home_page.dart';
import 'package:fut_app/my_page/my_page.dart';
import 'package:fut_app/my_page/my_page_bindings.dart';
import 'package:fut_app/third_page/raretyView.dart';
import 'package:fut_app/third_page/rarety_binddings.dart';
import 'package:fut_app/third_page/rarety_controller.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FutApp',
      getPages: [
        GetPage(
          name: '/home',
          title: 'Home page',
          page: () =>  HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: '/mypage',
          title: 'My page',
          page: () => const MyPage(),
          binding: MyPageBindings(),
        ),
          GetPage(
          name: '/rarity',
          title: 'Rareté',
          page: () => RarityPage(), // Utilisez la page qui affiche la liste de rarités
          binding: RaretyBindings(), // Lier le contrôleur à la page
        ),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/home',
    );
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Text de test");
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TestWidget(),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
