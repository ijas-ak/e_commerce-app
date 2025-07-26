import 'package:e_commerce_app/constants/consts.dart';
import 'package:e_commerce_app/controllers/product_provider.dart';
import 'package:e_commerce_app/view/widgets/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "My Cart",
          style: GoogleFonts.bebasNeue(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            CartTile(),
            Consumer<ProductProvider>(
              builder: (context, value, child) => value.totalAmount == 0
                  ? Text('')
                  : Container(
                      height: 60,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          ' Total  \$${value.totalAmount.toStringAsFixed(2)}',
                          style: GoogleFonts.lato(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
