import 'package:alissons_app/utils/theme/pallette.dart';
import 'package:alissons_app/widgets/custom_category_section_product_tile.dart';
import 'package:alissons_app/widgets/custom_product_tile.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "Unpolished Pulses",
              style: TextStyle(
                fontFamily: "Lufga",
                fontWeight: FontWeight.bold,
                fontSize: h * 0.02,
              ),
            ),
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 7,
        ),
        itemBuilder: (context, index) => CustomCategorySectionProductTile(),
        itemCount: 30,
      ),
      floatingActionButton: Container(
        color: Palette.surfaceColor,
        height: h*0.06,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(children: [Icon(Icons.sort),Text("Sort By")],),
            Text("|"),
            Row(children: [Icon(Icons.filter),Text("Filter")],)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
