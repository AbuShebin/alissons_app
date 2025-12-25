import 'package:alissons_app/screens/product_list_screen.dart';
import 'package:alissons_app/utils/theme/pallette.dart';
import 'package:alissons_app/widgets/custom_product_section.dart';
import 'package:alissons_app/widgets/custom_product_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Palette.surfaceColor,
      appBar: AppBar(
        leading: Image.asset(
          "assets/images/cart_icon.png",
          height: h * 0.05,
          width: w * 0.05,
        ),
        backgroundColor: Palette.primaryColor,
        actions: [
          Icon(Icons.search, color: Palette.scaffoldBackgroundColor),
          Icon(Icons.favorite_outline, color: Colors.white),
          Icon(Icons.notifications_active_outlined, color: Colors.white),
        ],
        actionsPadding: EdgeInsets.only(right: 5),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            spacing: h * 0.02,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Palette.surfaceColor,
                height: h * 0.2,
                child: Column(
                  spacing: h * 0.02,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Lufga",
                          color: Palette.primaryColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ProductListScreen(),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 28,
                                    backgroundColor: Colors.grey.shade300,
                                    child: Image.asset(
                                      "assets/images/category_avatar.png",
                                    ),
                                  ),
                                  SizedBox(height: h * 0.01),
                                  Text(
                                    "Unpolished\nPulses",
                                    style: TextStyle(
                                      fontSize: h * 0.014,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Lufga",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: 15,
                      ),
                    ),
                  ],
                ),
              ),

              CustomProductSection(
                title: "Featured Products",
                child: CustomProductTile(
                  showCategoryName: false,
                  showDiscontTIle: false,
                ),
              ),
              CustomProductSection(
                title: "Daily Best Selling",
                child: CustomProductTile(
                  showCategoryName: false,
                  showDiscontTIle: false,
                ),
              ),
              CustomProductSection(
                title: "Recently Added",
                child: CustomProductTile(
                  showCategoryName: false,
                  showDiscontTIle: false,
                ),
              ),
              CustomProductSection(
                title: "Popular Products",
                child: CustomProductTile(
                  showCategoryName: false,
                  showDiscontTIle: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
