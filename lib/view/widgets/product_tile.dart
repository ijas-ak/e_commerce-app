import 'package:e_commerce_app/controllers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, value, child) => Expanded(
        child: value.filteredList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.70,
                  crossAxisCount: 2,
                ),
                itemCount: value.filteredList.length,
                itemBuilder: (context, index) {
                  final product = value.filteredList[index];
                  return Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xff78B9B5),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 2, color: Colors.grey.shade600),
                    ),
                    child: Column(
                      children: [
                        Image.network(product.image[0], height: 150),
                        Text(
                          textAlign: TextAlign.center,
                          product.title.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          product.price.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
