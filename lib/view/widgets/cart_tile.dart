import 'package:e_commerce_app/constants/consts.dart';
import 'package:e_commerce_app/controllers/product_provider.dart';
import 'package:e_commerce_app/view/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, value, child) => Expanded(
        child: value.productCart.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your cart is empty!",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 40),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavPage(),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade800,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 40,
                        width: 140,
                        child: Center(
                          child: Text(
                            'Shop now',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: value.productCart.length,
                itemBuilder: (context, index) {
                  final cart = value.productCart[index];
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: StretchMotion(),
                      children: [
                        SlidableAction(
                          borderRadius: BorderRadius.circular(12),
                          icon: Icons.delete,
                          backgroundColor: Colors.red,
                          onPressed: (context) {
                            context.read<ProductProvider>().removeFromCart(
                              cart,
                            );
                          },
                        ),
                      ],
                    ),
                    child: Card(
                      color: Color.fromARGB(255, 210, 203, 198),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        height: 100,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(9),
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              cart.title,
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                          ),
                          leading: Container(
                            decoration: BoxDecoration(
                              color: MyColors.bgColor,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(12),
                              child: Image.network(
                                cart.image[0],
                                fit: BoxFit.cover,
                                width: 65,
                              ),
                            ),
                          ),
                          subtitle: Text(
                            '\$${cart.price}',
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                          trailing: Container(
                            height: 50,
                            width: 110,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    context
                                        .read<ProductProvider>()
                                        .itemdecreament(cart);
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                                Text(
                                  cart.itemCount.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    context
                                        .read<ProductProvider>()
                                        .itemIncreament(cart);
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
