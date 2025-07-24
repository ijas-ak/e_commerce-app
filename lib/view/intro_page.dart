import 'package:e_commerce_app/view/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = TextEditingController();
    void toHomePage() async {
      if (userController.text.isEmpty || userController.text.length <= 4) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Enter Username")));
      } else {
        final pref = await SharedPreferences.getInstance();
        await pref.setString('username', userController.text);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNavPage()),
        );
      }
    }

    return Scaffold(
      backgroundColor: Color(0xffFFEDF3),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //image or logo
          Center(
            child: Icon(
              Icons.local_grocery_store_sharp,
              size: 150,
              color: Colors.orange.shade600,
            ),
          ),
          SizedBox(height: 25),
          //title
          Text(
            "Storeeyyy!",
            style: GoogleFonts.bebasNeue(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          SizedBox(height: 25),
          Text(
            textAlign: TextAlign.center,
            'Providing you the latest\nmodels of products.',
            style: GoogleFonts.lato(fontSize: 18, color: Colors.grey.shade800),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: userController,
              decoration: InputDecoration(
                hintText: "Enter Username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),

          //Get started button
          SizedBox(height: 200),
          GestureDetector(
            onTap: toHomePage,
            child: Container(
              height: 70,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  'Get Started',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
