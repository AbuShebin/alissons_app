import 'package:alissons_app/providers/home_provider.dart';
import 'package:alissons_app/providers/user_provider.dart';
import 'package:alissons_app/utils/theme/pallette.dart';
import 'package:alissons_app/widgets/custom_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomProductSection extends ConsumerStatefulWidget {
  final String title;
  final Widget child;
  const CustomProductSection({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  ConsumerState<CustomProductSection> createState() =>
      _CustomProductSectionState();
}

class _CustomProductSectionState extends ConsumerState<CustomProductSection> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final user = ref.read(userProvider);
    if (user == null) {
      throw "Usermodel is null" ;
    }
    final homeData = ref.watch(homeDataProvider(user));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: "Lufga",
            color: Palette.primaryColor,
          ),
        ),
        SizedBox(
          height: h * 0.32,
          child:homeData.when(data: (data) =>  ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CustomProductTile(
              showCategoryName: true,
              showDiscontTIle: true,
            ),
            itemCount: 10,
          ), error: (error, stackTrace) => Text(error.toString()), loading: () => CircularProgressIndicator(),)
        ),
      ],
    );
  }
}
