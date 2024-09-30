import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kvp/screen/homescreen.dart';
import 'package:permission_handler/permission_handler.dart';

import 'navigation/bottom_navigation.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    _requestStoragePermission(); // Requests storage permission when the app starts
  }

  Future<void> _requestStoragePermission() async {
    // Check if the platform is NOT web
    if (!kIsWeb) {
      // Check if it's Android or iOS since these are the only platforms that need permission
      if (Platform.isAndroid || Platform.isIOS) {
        var status = await Permission.storage.status;

        if (status.isGranted) {
          // If permission is granted, you can proceed with storage-related actions
          log("Storage permission is granted.");
        } else {
          // Request permission if it hasn't been granted yet
          var result = await Permission.storage.request();
          if (result.isGranted) {
            log("Storage permission granted after request.");
          } else {
            log("Storage permission denied.");
          }
        }
      } else {
        log("Storage permission is not required for this platform.");
      }
    } else {
      // For web, permissions are not required
      log("Storage permission is not required on the web.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(25, 72, 106, 1.0),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            Image.asset("assets/images/SevaLogo.png"),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Welcome to ",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                    children: [
                      TextSpan(
                        text: "SEVA SAHAYOG ",
                        style: GoogleFonts.poppins(
                            color: Colors.yellow,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                      TextSpan(
                        text: "foundation.",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      )
                    ])),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Celebrating Humanity",
              style: GoogleFonts.poppins(
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                letterSpacing: 2.0,
                shadows: const [
                  Shadow(
                      offset: Offset(3.0, 3.0),
                      blurRadius: 5.0,
                      color: Colors.black),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BottomNavigation()),
                );
              },
              child: Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text("Join Our Mission",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
