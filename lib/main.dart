import 'package:elki_testovoe/development.dart';
import 'package:flutter/material.dart';

import 'feature/presentation/cubit/catalog_page.dart';

Future<void> main() async => Development().init();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CatalogPage(),
    debugShowCheckedModeBanner: false,
    );
  }
}
