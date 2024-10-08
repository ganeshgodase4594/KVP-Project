import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kvp/screen/attendencepage.dart';
import 'package:kvp/screen/registerform.dart';
import 'assesment.dart';
import 'nutritionpage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController controller;
  late List<Animation<Offset>> animation;
  late Animation<Offset> emojiAnimation;
  late AnimationController emojicontoller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    emojicontoller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));

    emojiAnimation = Tween(begin: const Offset(0, 0), end: const Offset(0, 0.1))
        .animate(
            CurvedAnimation(parent: emojicontoller, curve: Curves.easeInOut))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          emojicontoller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          emojicontoller.forward();
        }
      });

    emojicontoller.forward();

    animation = [
      Tween(begin: const Offset(-1, 0), end: Offset.zero)
          .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut)),
      Tween(begin: const Offset(1, 0), end: Offset.zero)
          .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut)),
      Tween(begin: const Offset(0, -1), end: Offset.zero)
          .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut)),
      Tween(begin: const Offset(0, 1), end: Offset.zero)
          .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut)),
    ];

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String firstName = getFirstName();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Welcome !",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  "Hii $firstName",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 5),
                SlideTransition(
                  position: emojiAnimation,
                  child: const Text(
                    "👋", // Hi Emoji
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8, // Sets the ratio for grid items
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2, // Creates a 2-column grid
                ),
                itemCount: 4, // Specifies the number of grid items
                itemBuilder: (context, index) {
                  return GestureDetector(
                    // Detects when a grid item is tapped
                    onTap: () {
                      navigateToPage(index); // Navigates based on the index
                    },
                    child: SlideTransition(
                      position: animation[index],
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Colors.white,
                              Color.fromRGBO(240, 240, 240, 1.0),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                          border: Border.all(
                              color: Colors.black.withOpacity(0.3), width: 1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(height: 5),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                height: 100,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                getImage(
                                    index), // Retrieves image based on the index
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.lightBlueAccent.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  getText(
                                      index), // Retrieves text based on the index
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5, // Limits the text to 5 lines
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  // Function to retrieve image path based on index
  String getImage(int index) {
    switch (index) {
      case 0:
        return "assets/images/register.jpg";
      case 1:
        return "assets/images/finalattend.png";
      case 2:
        return "assets/images/assesment.jpeg";
      case 3:
        return "assets/images/nutrition.jpg";
      default:
        return "assets/images/attendance1.jpg";
    }
  }

  // Function to retrieve text based on index
  String getText(int index) {
    switch (index) {
      case 0:
        return "Register Form";
      case 1:
        return "Attendence";
      case 2:
        return "Assessment ";
      case 3:
        return "Nutrition";
      default:
        return "Unknown";
    }
  }

  // Function to navigate to different pages based on index
  void navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RegisterForm()));
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AttendencePage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AssessmentPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NutritionPage()),
        );
        break;
      default:
      // Handle unexpected cases
    }
  }
}

String getFirstName() {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    return user.displayName?.split(' ')[0] ?? '';
  }
  return 'Guest';
}
