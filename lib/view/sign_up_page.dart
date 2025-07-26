import 'package:e_commerce_app/controllers/auth_provider.dart';
import 'package:e_commerce_app/controllers/profile_provider.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:e_commerce_app/view/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passController = TextEditingController();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bgimage.jpg"),
            fit: BoxFit.cover,
            opacity: 0.6,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Center(
              child: Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 5),
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage("images/bgimage.jpg"),
                  ),
                  shape: BoxShape.circle,
                ),

                child: Center(
                  child: Image.asset('images/shopify.png', height: 80),
                ),
              ),
            ),
            SizedBox(height: 25),
            //title
            Text(
              "Shopify!",
              style: GoogleFonts.bebasNeue(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
              ),
            ),
            SizedBox(height: 20),
            Text(
              textAlign: TextAlign.center,
              'Sign Up To Shopify.',
              style: GoogleFonts.lato(
                fontSize: 18,
                color: Colors.grey.shade800,
              ),
            ),
            SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: "Enter Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Consumer<ProfileProvider>(
                builder: (context, value, child) => TextField(
                  obscureText: value.isVisible,
                  controller: passController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        value.showPass();
                      },
                      icon: Icon(
                        value.isVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    hintText: "Enter password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => IntroPage()),
                    );
                  },
                  child: Text("Already Have Account?"),
                ),
              ),
            ),

            //Get started button
            SizedBox(height: 70),
            GestureDetector(
              onTap: () async {
                final username = usernameController.text.trim();
                final password = passController.text.trim();
                context.read<UserAuth>().signIn(
                  User(username: username, password: password),
                );
                await Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => IntroPage()),
                );
              },
              child: Container(
                height: 70,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    'Sign Up',
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
      ),
    );
  }
}
