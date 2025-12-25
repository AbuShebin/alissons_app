import 'package:alissons_app/utils/theme/pallette.dart';
import 'package:alissons_app/widgets/custom_product_tile.dart';
import 'package:alissons_app/widgets/product_detailed_screen.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Palette.surfaceColor,
      appBar: AppBar(
        title: Text(
          "Unpolished Pulses",
          style: TextStyle(
            fontFamily: "Lufga",
            fontWeight: FontWeight.bold,
            fontSize: h * 0.02,
          ),
        ),
        actions: [
          Icon(Icons.search),
          Icon(Icons.shopping_bag_outlined)
        ],
        actionsPadding: EdgeInsets.only(right: 5),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.69,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
          ),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailedScreen(),)),
            child: CustomProductTile(showCategoryName: true,showDiscontTIle: true,)),
          itemCount: 30,
        ),

        bottomNavigationBar: Container(

  height: h * 0.07,
  padding: EdgeInsets.zero,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Row(
        children: [
          Icon(Icons.sort_outlined,color: Colors.black,),
          SizedBox(width: 8),
          Text("Sort By")
        ],
      ),
      Container(
        height: h * 0.03,
        width: 1,
        color: Colors.grey,
      ),
      Row(
        children: [
          Icon(Icons.filter_alt,color: Colors.black,),
          SizedBox(width: 8),
          Text("Filter")
        ],
      )
    ],
  ),
),
 
);
  }
}