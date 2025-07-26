import 'package:e_commerce_app/controllers/product_provider.dart';
import 'package:e_commerce_app/view/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryTab extends StatelessWidget {
  final String category;

  const CategoryTab({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      Provider.of<ProductProvider>(
        context,
        listen: false,
      ).getFilteredList(category);
    });

    return Padding(padding: const EdgeInsets.all(8.0), child: ProductTile());
  }
}
