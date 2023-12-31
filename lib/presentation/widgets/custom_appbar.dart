import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double elevation;

  const CustomAppbar({Key? key, required this.title, this.elevation = 1})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back,
          size: 20,
          color: Colors.white,
        ),
      ),
      title: title.text.lg.bold.color(Colors.white).make(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
