import 'package:alissons_app/utils/theme/pallette.dart';
import 'package:alissons_app/widgets/custom_discount_tile.dart';
import 'package:flutter/material.dart';

class CustomProductTile extends StatelessWidget {
  final bool showDiscontTIle;
  final bool showCategoryName;
  const CustomProductTile({
    super.key,
    required this.showDiscontTIle,
    required this.showCategoryName,
  });

  @override
  Widget build(BuildContext context) {
    print(showDiscontTIle);
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Container(
      width: w * 0.5,
      margin: EdgeInsets.all( 5),
      child: Container(
        decoration: BoxDecoration(
          color: Palette.cardBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/images/product_image.png",
                      height: h * 0.12,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Icon(Icons.favorite_outline),
                    ),
                  ),
                  if (showDiscontTIle)
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CustomDiscountTile(percentage: "27"),
                      ),
                    ),
                ],
              ),
              Visibility(
                visible: showCategoryName,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Flours & Sugars",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: h * 0.01),
                  ],
                ),
              ),

              Text(
                "Light pink salt 1kg",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: h * 0.01),

              Row(
                spacing: w * 0.01,
                children: [
                  Text(
                    "Rs 62",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Palette.primaryColor,
                    ),
                  ),
                  Text(
                    "80",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  minimumSize: Size(double.infinity, 40),
                ),
                child: Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
