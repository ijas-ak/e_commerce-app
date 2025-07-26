import 'package:e_commerce_app/constants/consts.dart';
import 'package:e_commerce_app/controllers/product_provider.dart';
import 'package:e_commerce_app/view/favourite_product_page.dart';
import 'package:e_commerce_app/view/widgets/category_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    Provider.of<ProductProvider>(context, listen: false).getData();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: MyColors.bgColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/shopify.png'),
          ),
          title: Consumer<ProductProvider>(
            builder: (context, value, child) => value.isSearching
                ? SizedBox(
                    height: 40,
                    child: TextField(
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Search Item",
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        context.read<ProductProvider>().searchedProducts(
                          searchController.text,
                        );
                      },
                    ),
                  )
                : Text(
                    "Shopify!",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                context.read<ProductProvider>().searching();
              },
              icon: Consumer<ProductProvider>(
                builder: (context, value, child) => Icon(
                  value.isSearching ? Icons.close : Icons.search,
                  size: 35,
                ),
              ),
            ),
            Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavouriteProduct(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.favorite,
                    size: 35,
                    color: Colors.black87,
                  ),
                ),
                Consumer<ProductProvider>(
                  builder: (context, value, child) =>
                      value.favouriteList.isEmpty
                      ? Text('')
                      : Positioned(
                          right: 6,
                          top: 8,
                          child: Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                value.favCount.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            TabBar(
              labelColor: Colors.deepPurple,
              indicatorColor: Colors.black,
              unselectedLabelColor: Colors.black,
              padding: EdgeInsets.all(10),
              tabs: [
                Tab(icon: Icon(Icons.local_grocery_store), text: "All"),
                Tab(icon: Icon(LucideIcons.beef), text: "foods"),
                Tab(icon: Icon(FontAwesomeIcons.compactDisc), text: "Beauty"),
                Tab(icon: Icon(Icons.bed), text: "Furnitures"),
              ],
            ),
            Expanded(
              //MainView
              child: TabBarView(
                children: [
                  CategoryTab(category: 'all'),
                  CategoryTab(category: 'groceries'),
                  CategoryTab(category: 'beauty'),
                  CategoryTab(category: 'furniture'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
