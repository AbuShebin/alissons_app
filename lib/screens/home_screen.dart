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
      backgroundColor: Palette.scaffoldBackgroundColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            spacing: h * 0.02,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(),
                height: h * 0.2,
                child: Column(
                  spacing: h * 0.02,

                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Lufga",
                      ),
                    ),
                    Expanded(
                      // Takes remaining space
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
                                    child: Text('${index + 1}'), // Add content
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
                child: CustomProductTile(),
              ),
              CustomProductSection(
                title: "Daily Best Selling",
                child: CustomProductTile(),
              ),
              CustomProductSection(
                title: "Recently Added",
                child: CustomProductTile(),
              ),
              CustomProductSection(
                title: "Popular Products",
                child: CustomProductTile(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
