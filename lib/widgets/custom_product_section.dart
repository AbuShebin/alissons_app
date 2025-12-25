import 'package:alissons_app/utils/theme/pallette.dart';
import 'package:alissons_app/widgets/custom_product_tile.dart';
import 'package:flutter/material.dart';

class CustomProductSection extends StatelessWidget {
  final String title;
  final Widget child;
  const CustomProductSection({super.key,required this.child,required this.title});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: "Lufga",
            color: Palette.primaryColor,
          ),
        ),
        SizedBox(
          height: h * 0.32,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CustomProductTile(showCategoryName: true,showDiscontTIle: true,),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
