import 'package:e_commerce_app/view/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
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

          //Get started button
          SizedBox(height: 200),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BottomNavPage()),
            ),
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
