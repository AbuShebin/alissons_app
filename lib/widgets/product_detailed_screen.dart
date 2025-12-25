import 'package:alissons_app/utils/theme/pallette.dart';
import 'package:alissons_app/widgets/custom_product_section.dart';
import 'package:alissons_app/widgets/custom_product_tile.dart';
import 'package:flutter/material.dart';

class ProductDetailedScreen extends StatelessWidget {
  const ProductDetailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Palette.surfaceColor,
      appBar: AppBar(
        actions: [Icon(Icons.search), Icon(Icons.shopping_bag_outlined)],
        actionsPadding: EdgeInsets.only(right: 5),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/product_image_large.png",
                height: h * 0.25,
                width: double.infinity,
              ),
              Text(
                "Masoor dal",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: h * 0.02),
              ),
              Text("Unpolished masoor dal"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 5,
                    children: [
                      Text("125"),
                      Text(
                        "135",
                        style: TextStyle(decoration: TextDecoration.lineThrough),
                      ),
                      Text("16 off"),
                    ],
                  ),
                  Icon(Icons.share, color: Colors.black),
                ],
              ),
              SizedBox(height: h * 0.01),
              Text(
                "Description",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: h * 0.02),
              ),
              Text(
                "jfoaiwjfoawjefoawjefpojawoefjpawiheoawhidrftgyhbnjmk,lrftgybhnjmk;slkdjfoaiwjfoawjefoawjefpojawoefjpawiheoawhidrftgyhbnjmk,lrftgybhnjmk;slkdjfoaiwjfoawjefoawjefpojawoefjpawiheoawhidrftgyhbnjmk,lrftgybhnjmk;slkdjfoaiwjfoawjefoawjefpojawoefjpawiheoawhidrftgyhbnjmk,lrftgybhnjmk;slkdjfoaiwjfoawjefoawjefpojawoefjpawiheoawhidrftgyhbnjmk,lrftgybhnjmk;slkdjfoaiwjfoawjefoawjefpojawoefjpawiheoawhidrftgyhbnjmk,lrftgybhnjmk",
              ),
              SizedBox(height: h * 0.01),
     
              CustomProductSection(
                title: "Related Products",
                child: CustomProductTile(
                  showDiscontTIle: false,
                  showCategoryName: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
