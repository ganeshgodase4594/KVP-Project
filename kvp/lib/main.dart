import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kvp/provider/checkbox.dart';
import 'package:kvp/screen/homepage.dart';
import 'package:provider/provider.dart';

import 'demopage.dart';
import 'provider/suggestionprovider.dart';
import 'screen/registerform.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CheckboxProvider()),
        ChangeNotifierProvider(create: (_) => Suggestionprovider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
