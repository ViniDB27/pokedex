import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import 'src/app_module.dart';
import 'src/app.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const App()));
}
