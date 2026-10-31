import 'package:flutter/material.dart';

import 'app/app.dart';
import 'firebase_options.dart';
import 'services/firebase_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseInitializer.initialize(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MedReturnApp());
}
