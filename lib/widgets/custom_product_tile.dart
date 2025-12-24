import 'package:alissons_app/utils/theme/pallette.dart';
import 'package:alissons_app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class CustomProductTile extends StatelessWidget {
  const CustomProductTile({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Container(
      width: w * 0.55, // Fixed width for horizontal scroll
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
              // Product Image (clipped for clean look)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/login_screen_image.jpg",
                  height: h * 0.12,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8),

              // Product Category
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
              SizedBox(height: 4),

              // Product Name
              Text(
                "Light pink salt 1kg",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),

              Text(
                "Rs 62",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Your action here
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // Sharp corners
                  ),
                  minimumSize: Size(1000, 40),
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
