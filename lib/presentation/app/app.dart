import 'package:flutter/material.dart';

import '/config/app_constants.dart';
import '/config/app_theme.dart';
import '/routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: nameApp ?? 'Nombre no disponible',
      debugShowCheckedModeBanner: false,
      theme: theme,
      routerConfig: goRouter,
    );
  }
}