import 'package:e_commerce_app/controllers/product_provider.dart';
import 'package:e_commerce_app/view/details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, value, child) {
        if (value.filteredList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.55,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: value.isSearching
              ? value.searchedList.length
              : value.filteredList.length,
          itemBuilder: (context, index) {
            final product = value.isSearching
                ? value.searchedList[index]
                : value.filteredList[index];

            return GestureDetector(
              onTap: () {
                // Navigate to product detail
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(
                      image: product.image[0],
                      description: product.description,
                      rating: product.rating,
                      productName: product.title,
                      price: product.price,
                      product: product,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<ProductProvider>().liked(product);
                      },
                      icon: Icon(
                        product.isLiked
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: product.isLiked ? Colors.red : Colors.black,
                      ),
                    ),

                    // Product Image
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(18),
                      ),
                      child: Image.network(
                        product.image[0],
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Product Info
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${product.price}",
                                style: const TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  context.read<ProductProvider>().addToCart(
                                    product,
                                    context,
                                  );
                                },
                                icon: Consumer<ProductProvider>(
                                  builder: (context, value, child) => Icon(
                                    Icons.shopping_cart_outlined,
                                    color: product.isOrdered
                                        ? Colors.blue
                                        : Colors.grey,
                                    size: 26,
                                  ),
                                ),
                                splashRadius: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
