import 'package:alissons_app/utils/theme/pallette.dart';
import 'package:flutter/material.dart';

class CustomCategorySectionProductTile extends StatelessWidget {

  const CustomCategorySectionProductTile({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Container(
      width: w * 0.55,
      margin: EdgeInsets.only(right: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Palette.cardBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/login_screen_image.jpg",
                  height: h * 0.1,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // Product Category
              
                         SizedBox(height: h*0.001),


              // Product Name
              Text(
                "Light pink salt 1kg",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              Text(
                "Rs 62",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700,
                ),
              ),
              SizedBox(height: h*0.001,),
              SizedBox(
                height: h*0.04,
                child: ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // Sharp corners
                    ),
                    minimumSize: Size(1000, 40),
                  ),
                  child: Text("Add"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
