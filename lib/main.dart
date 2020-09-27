import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'core/widgets/app_widget.dart';
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependecies(Environment.prod);
  await Firebase.initializeApp();
  runApp(AppWidget());
}
