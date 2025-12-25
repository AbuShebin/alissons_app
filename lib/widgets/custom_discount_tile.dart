import 'package:alissons_app/utils/theme/pallette.dart';
import 'package:flutter/material.dart';

class CustomDiscountTile extends StatelessWidget {
  final String percentage;
  const CustomDiscountTile({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h * 0.02,
      width: w * 0.09,
      decoration: BoxDecoration(
        color: Palette.primaryColor,
        borderRadius: BorderRadius.circular(2),
      ),
      child:Center(
        child: Text(
              '$percentage % off',
              style: TextStyle(color: Palette.whiteColor,
              fontSize: h*0.009,
              fontWeight: FontWeight.bold),
            ),
      ),
    );
  }
}
