import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kvp/components/snackbar.dart';
import 'package:kvp/screen/welcomepage.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate the screen width
          double screenWidth = constraints.maxWidth;

          // Adjust padding and font sizes based on screen width
          double padding = screenWidth > 600 ? 40.0 : 20.0;
          double fontSize = screenWidth > 600 ? 16.0 : 13.0;

          return Padding(
            padding: EdgeInsets.all(padding),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/loginimage.png",
                      height: screenWidth > 600 ? 200 : 150),
                  const SizedBox(height: 20),
                  Text(
                    textAlign: TextAlign.center,
                    "Empower their academic journey! Sign in now to securely track and manage academic records effortlessly.",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      signInWithGoogle(context);
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("assets/images/google.png"),
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              "Continue with Google",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: fontSize + 1,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void signInWithGoogle(BuildContext context) async {
  final googleUser = await GoogleSignIn().signIn();
  final googleAuth = await googleUser!.authentication;

  AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

  if (userCredential.user != null) {
    SnacKBar.success(
        title: 'Login Successful!', message: "Enjoy The Application");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Homepage()));
  } else {
    SnacKBar.error(
      title: 'Login Failed',
      message: "You can try again!",
    );
  }
}
