import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kvp/firebase_options.dart';
import 'package:kvp/provider/assesmentrecordprovider.dart';
import 'package:kvp/provider/attendenceprovider.dart';
import 'package:kvp/provider/checkbox.dart';
import 'package:kvp/provider/girlidprovider.dart';
import 'package:kvp/provider/timeprovider.dart';
import 'package:kvp/provider/vastifilterprovider.dart';
import 'package:kvp/screen/welcomepage.dart';
import 'package:kvp/screen/login/signin.dart';
import 'package:provider/provider.dart';
import 'provider/dateprovider.dart';
import 'provider/suggestionprovider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialiaze the firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        /*

        Provides that uses for app state management

        */
        ChangeNotifierProvider(create: (_) => CheckboxProvider()),
        ChangeNotifierProvider(create: (_) => Suggestionprovider()),
        ChangeNotifierProvider(create: (_) => TimeProvider()),
        ChangeNotifierProvider(create: (_) => AttendenceProvider()),
        ChangeNotifierProvider(create: (_) => GirlIdProvider()),
        ChangeNotifierProvider(create: (_) => DateProvider()),
        ChangeNotifierProvider(create: (_) => VastiProvider()),
        ChangeNotifierProvider(create: (_) => AssesmentRecordProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {}
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.data == null) {
                return const SignIn();
              } else {
                return const Homepage();
              }
            }
            return const SignIn();
          }),
    );
  }
}
