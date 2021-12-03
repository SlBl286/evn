import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:flutter_app/resources/pages/form_kiem_tra_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SoItem extends StatelessWidget {
  String? name, updatedby, updatedAt;
  double? lat, lng;
  SoItem(
      {Key? key,
      required this.name,
      this.updatedAt,
      this.updatedby,
      this.lat,
      this.lng})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, FormKiemTraPage.route, arguments: name);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: NyColors.of(context).primaryAccent,
          boxShadow: [
            BoxShadow(
              color: NyColors.of(context).primaryAccent.withOpacity(0.6),
              spreadRadius: 4,
              blurRadius: 4,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              width: MediaQuery.of(context).size.width - 20,
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name!,
                    style: TextStyle(
                      color: NyColors.of(context).secondaryContent,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Kinh do : " + (lng != null ? lng.toString() : "15."),
                    style: TextStyle(
                      color: NyColors.of(context).secondaryContent,
                      fontSize: 16,
                      height: 0.8,
                    ),
                  ),
                  Text(
                    "Vi do : " + (lat != null ? lat.toString() : "105."),
                    style: TextStyle(
                      color: NyColors.of(context).secondaryContent,
                      fontSize: 14,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Cap nhat ngay : " +
                        (updatedAt != null
                            ? updatedAt.toString()
                            : "1-12-2021"),
                    style: TextStyle(
                      color: NyColors.of(context).secondaryContent,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Cap nhat boi : " +
                        (updatedby != null ? updatedby.toString() : "sa"),
                    style: TextStyle(
                      color: NyColors.of(context).secondaryContent,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                right: 1,
                bottom: 5,
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          MdiIcons.upload,
                          color: NyColors.of(context).primaryContent,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          MdiIcons.mapMarker,
                          color: NyColors.of(context).primaryContent,
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
