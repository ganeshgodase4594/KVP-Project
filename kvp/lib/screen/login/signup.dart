import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_image/svg_image.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Form(
                child: Column(
              children: [
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      //color: Colors.black12,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.blueAccent, width: 2)),
                  child: TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          "assets/images/userpng.png",
                        ),
                      ),
                      hintText: "enter name",
                      hintStyle: GoogleFonts.poppins(
                          color: Colors.black.withOpacity(0.8)),
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
