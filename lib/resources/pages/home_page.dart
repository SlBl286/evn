import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/controller.dart';
import 'package:flutter_app/app/controllers/home_controller.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:flutter_app/resources/pages/giam_sat_page.dart';
import 'package:flutter_app/resources/pages/kiem_tra_page.dart';
import 'package:flutter_app/resources/pages/settings_page.dart';
import 'package:flutter_app/resources/pages/thu_thap_page.dart';
import 'package:flutter_app/resources/pages/tra_cuu_page.dart';

import 'package:flutter_app/resources/widgets/square_button.dart';
import 'package:maplibre_gl/mapbox_gl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nylo_framework/metro/models/ny_command.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:nylo_framework/theme/helper/ny_theme.dart';

class MyHomePage extends NyStatefulWidget {
  static const route = "/";
  final HomeController controller = HomeController();

  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends NyState<MyHomePage> {
  MaplibreMapController? mapController;
  bool? _isDarkTheme;

  final style = {
    "version": 8,
    "sources": {
      "osm": {
        "type": "raster",
        "tiles": ["https://a.tile.openstreetmap.org/{z}/{x}/{y}.png"],
        "tileSize": 256,
        "attribution": "&copy; OpenStreetMap Contributors",
        "maxzoom": 19,
        "minzoom": 4
      }
    },
    "layers": [
      {
        "id": "osm",
        "type": "raster",
        "source": "osm" // This must match the source key above
      }
    ]
  };
  @override
  widgetDidLoad() {}
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // flexibleSpace: Container(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage(
        //           'public/assets/images/appbar_img.jpg',
        //         ),
        //         fit: BoxFit.fill,
        //         matchTextDirection: true),
        //   ),
        // ),
        backgroundColor: NyColors.of(context).appBarBackground,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  MdiIcons.home,
                  color: NyColors.of(context).appBarPrimaryContent,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Xin chào ...",
                style: TextStyle(
                    fontSize: 20,
                    color: NyColors.of(context).appBarPrimaryContent),
              ),
            ],
          ),
        ),
        actions: [
          // Switch(
          //   value: NyColors.of(context).isDarkTheme,
          //   onChanged: (bool value) {
          //     setState(() {
          //       if (value) {
          //         NyTheme.set(context, id: "default_dark_theme");
          //       } else {
          //         NyTheme.set(context, id: "default_light_theme");
          //       }
          //     });
          //   },
          //   activeThumbImage:
          //       new AssetImage("public/assets/app_icon/dark_theme_icon.png"),
          //   inactiveThumbImage:
          //       new AssetImage("public/assets/app_icon/light_theme_icon.png"),
          // ),
          IconButton(
            color: NyColors.of(context).appBarPrimaryContent,
            onPressed: () {},
            icon: Icon(MdiIcons.bell),
          ),
          IconButton(
            color: NyColors.of(context).appBarPrimaryContent,
            onPressed: () {
              routeTo(SettingsPage.route);
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Stack(
        children: [
          MaplibreMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(15.023069980780286, 105.7213568620676),
              zoom: 5,
            ),
            styleString: jsonEncode(style),
          ),
          Positioned(
            bottom: 15,
            left: 5,
            right: 5,
            child: Row(
              children: [
                SquareButton(
                  onpress: () {
                    NyNavigator.instance.router.call(ThuThapPage.route);
                  },
                  label: 'Thu thập',
                  backgroundColor: Color(0xFF63c3d5),
                  icon: MdiIcons.bagPersonal,
                ),
                SquareButton(
                    onpress: () {
                      Navigator.pushNamed(context, TraCuuPage.route);
                    },
                    label: 'Tra cứu',
                    backgroundColor: Color(0xFF00b4d8),
                    icon: Icons.search),
                SquareButton(
                    onpress: () {
                      Navigator.pushNamed(context, KiemTraPage.route);
                    },
                    label: 'Kiểm tra',
                    backgroundColor: Color(0xFF0077b6),
                    icon: MdiIcons.cogBox),
                SquareButton(
                  onpress: () {
                    Navigator.pushNamed(context, GiamSatPage.route);
                  },
                  icon: MdiIcons.eyeCircle,
                  label: 'Giám sát',
                  backgroundColor: Color(0xFF03045e),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
