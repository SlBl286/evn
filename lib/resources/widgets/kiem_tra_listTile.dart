import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class KiemTraItem extends StatelessWidget {
  String? line1;
  String? line2;
  String? line3;
  String? line4;
  Function? onItemTap;
  Function? onAddPress;
  bool showAddBtn;
  KiemTraItem(
      {Key? key,
      this.line1,
      this.line2,
      this.line3,
      this.line4,
      this.onItemTap,
      this.onAddPress,
      this.showAddBtn = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onItemTap != null) onItemTap!();
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
        padding: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 15,
        ),
        height: 174,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              (line1 ?? "line 1").toUpperCase(),
              style: TextStyle(
                color: NyColors.of(context).secondaryContent,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              (line2 ?? "line 2").toUpperCase(),
              style: TextStyle(
                color: NyColors.of(context).secondaryContent,
                fontSize: 13,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              (line3 ?? "line 3").toLowerCase(),
              style: TextStyle(
                color: NyColors.of(context).secondaryContent.withOpacity(0.87),
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              (line4 ?? "line 4").toLowerCase(),
              style: TextStyle(
                color: NyColors.of(context).primaryContent.withAlpha(150),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            if (showAddBtn)
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      if (onAddPress != null) onAddPress!();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: NyColors.of(context).secondaryContent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      width: 100,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            MdiIcons.pen,
                            color: NyColors.of(context).primaryContent,
                            size: 18,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Thêm mới",
                            style: TextStyle(
                                color: NyColors.of(context).primaryContent),
                          ),
                        ],
                      ),
                    )),
              )
          ],
        ),
      ),
    );
  }
}
