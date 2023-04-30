import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [Locale('es')],
      theme: theme,
      routerConfig: goRouter,
    );
  }
}