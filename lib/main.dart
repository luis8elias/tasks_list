import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'common/dependencies_injection.dart';
import 'presentation/app/app.dart';

void main() async{
  injectDependencies();
  await dotenv.load(fileName: '.env');
  runApp(const App());
}

