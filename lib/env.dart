import 'package:elki_testovoe/injection.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Env {
  Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    final injectionContainer = await injection(const App());
    runApp(injectionContainer);
  }
}
