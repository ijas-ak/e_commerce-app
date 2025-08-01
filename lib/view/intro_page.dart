// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce_app/constants/consts.dart';
import 'package:e_commerce_app/controllers/auth_provider.dart';
import 'package:e_commerce_app/controllers/profile_provider.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:e_commerce_app/view/sign_up_page.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: MyColors.bgColor,

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/grocery.jpeg"),
            fit: BoxFit.cover,
            opacity: 0.3,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/shopify.png', height: 250),
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
              'Providing you the latest\nmodels of products.',
              style: GoogleFonts.lato(
                fontSize: 18,
                color: Colors.grey.shade800,
              ),
            ),
            SizedBox(height: 70),
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
            Padding(
              padding: const EdgeInsets.all(12),
              child: Consumer<ProfileProvider>(
                builder: (context, value, child) => TextField(
                  obscureText: value.isVisible,
                  controller: passwordController,
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
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text("Sign Up"),
                ),
              ),
            ),
            //Get started button
            SizedBox(height: 60),
            GestureDetector(
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                final username = userController.text.trim();
                final password = passwordController.text.trim();
                await prefs.setString("username", username);
                final userAuth = context.read<UserAuth>();
                await userAuth.getUsers(
                  User(username: username, password: password),
                );
                context.read<UserAuth>().login(username, password, context);
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
                    'Sign In',
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
