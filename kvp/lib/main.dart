import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kvp/provider/attendenceprovider.dart';
import 'package:kvp/provider/checkbox.dart';
import 'package:kvp/provider/girlidprovider.dart';
import 'package:kvp/provider/timeprovider.dart';
import 'package:kvp/provider/vastifilterprovider.dart';
import 'package:kvp/screen/searchname.dart';
import 'package:kvp/screen/splashscreen.dart';

import 'package:provider/provider.dart';

import 'provider/dateprovider.dart';
import 'provider/suggestionprovider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CheckboxProvider()),
        ChangeNotifierProvider(create: (_) => Suggestionprovider()),
        ChangeNotifierProvider(create: (_) => TimeProvider()),
        ChangeNotifierProvider(create: (_) => AttendenceProvider()),
        ChangeNotifierProvider(create: (_) => GirlIdProvider()),
        ChangeNotifierProvider(create: (_) => DateProvider()),
        ChangeNotifierProvider(create: (_) => VastiProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
