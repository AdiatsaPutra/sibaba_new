import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/info_lokasi/model/location.dart';
import 'package:sibaba/applications/info_lokasi/ui/pages/location_detail_page.dart';
import 'package:sibaba/infrastructures/extensions.dart';
import 'package:velocity_x/velocity_x.dart';

class LocationCard extends StatelessWidget {
  final Lokasi location;

  const LocationCard({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => LocationDetailPage(slug: location.locSlug!));
      },
      child: VxBox(
        child: VStack(
          [
            VxBox()
                .withDecoration(
                  BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(location.photo == null
                            ? 'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg'
                            : 'https://badkobantul.tatiumy.com/${location.photo!.fileLoc}'),
                        fit: BoxFit.cover),
                  ),
                )
                .height(200)
                .width(Get.width)
                .make(),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                (location.photo == null ? '-' : location.photo!.fileLoc)
                    .text
                    .lg
                    .bold
                    .make(),
                const SizedBox(height: 10),
                HStack(
                  [
                    'Akreditasi: '.text.base.make(),
                    location.akreditasi!.text.make(),
                  ],
                ),
                const SizedBox(height: 10),
                HStack(
                  [
                    const Icon(Icons.place),
                    location.alamat!.compact().text.make(),
                  ],
                ),
                const SizedBox(height: 10),
                HStack(
                  [
                    const Icon(Icons.phone),
                    Builder(
                      builder: (context) => location.email != null
                          ? location.telpUnit!.text.make()
                          : '-'.text.make(),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                HStack(
                  [
                    const Icon(Icons.mail),
                    Builder(
                      builder: (context) => location.email != null
                          ? location.email!.text.make()
                          : '-'.text.make(),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                HStack(
                  [
                    'Status: '.text.base.make(),
                    Builder(
                      builder: (context) => location.status == "Aktif"
                          ? location.status!.text.sm
                              .color(Colors.white)
                              .make()
                              .box
                              .rounded
                              .color(Colors.red)
                              .px8
                              .make()
                          : location.status!.text.sm
                              .color(Colors.white)
                              .make()
                              .box
                              .rounded
                              .color(Colors.green)
                              .px8
                              .make(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      )
          .rounded
          .color(Colors.white)
          .p16
          .margin(const EdgeInsets.only(bottom: 10))
          .outerShadowXl
          .make(),
    );
  }
}
