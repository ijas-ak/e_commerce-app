import 'package:e_commerce_app/constants/consts.dart';
import 'package:e_commerce_app/controllers/provider.dart';
import 'package:e_commerce_app/view/widgets/category_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false).getData();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: MyColors.bgColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.location_on),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<SearchProvider>(
                builder: (context, value, child) => value.isSearching
                    ? Expanded(
                        child: TextField(
                          decoration: InputDecoration(hintText: "Search Item"),
                        ),
                      )
                    : Text("Kadavathur,kannur"),
              ),
              IconButton(
                onPressed: () {
                  context.read<SearchProvider>().searching();
                },
                icon: Consumer<SearchProvider>(
                  builder: (context, value, child) => Icon(
                    value.isSearching ? Icons.close : Icons.search,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
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
                Tab(icon: Icon(FontAwesomeIcons.sprayCan), text: "Fragrances"),
              ],
            ),
            Expanded(
              //MainView
              child: TabBarView(
                children: [
                  CategoryTab(category: 'all'),
                  CategoryTab(category: 'groceries'),
                  CategoryTab(category: 'beauty'),
                  CategoryTab(category: 'fragrances'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
