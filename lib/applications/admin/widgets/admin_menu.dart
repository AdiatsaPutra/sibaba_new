import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sibaba/applications/admin/models/user.dart';
import 'package:sibaba/applications/admin/pages/data_santri_page.dart';
import 'package:sibaba/applications/admin/pages/data_unit_page.dart';
import 'package:sibaba/applications/admin/pages/data_ustadz_page.dart';
import 'package:sibaba/applications/admin/pages/lokasi/add_lokasi_page.dart';
import 'package:velocity_x/velocity_x.dart';

import 'kategori_item.dart';

class AdminMenu extends StatelessWidget {
  final User user;
  const AdminMenu({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack([
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          KategoriItem(
            icon: Icons.map,
            title: 'Lokasi Unit',
            onTap: () {
              Get.to(
                () => AddLokasiPage(
                  isEdit: false,
                  user: user,
                  latLng: LatLng(19.782211, 29.089234),
                ),
              );
            },
          ),
          KategoriItem(
            icon: Icons.school_outlined,
            title: 'Data Ustadz',
            onTap: () {
              Get.to(() => const DataUstadzPage());
            },
          ),
          KategoriItem(
            icon: Icons.school,
            title: 'Data\nSantri',
            onTap: () {
              Get.to(() => DataSantriPage(user: user));
            },
          ),
        ],
      ),
      const SizedBox(height: 20),
    ]);
  }
}