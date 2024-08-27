import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kvp/provider/checkbox.dart';
import 'package:provider/provider.dart';

import 'demopage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CheckboxProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoPage(),
    );
  }
}
