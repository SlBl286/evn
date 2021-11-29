import 'package:flutter/material.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SquareButton extends StatefulWidget {
  Color? backgroundColor;
  IconData? icon;
  String label;
  Function? onpress;
  SquareButton(
      {Key? key,
      required this.label,
      this.backgroundColor,
      this.icon,
      this.onpress})
      : super(key: key);

  @override
  _SquareButtonState createState() => _SquareButtonState();
}

class _SquareButtonState extends State<SquareButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      width: (MediaQuery.of(context).size.width - 10) / 4,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        height: MediaQuery.of(context).size.width / 5,
        color: widget.backgroundColor ?? NyColors.of(context).buttonBackground,
        onPressed: () {
          if (widget.onpress != null) widget.onpress!();
        },
        child: Column(
          children: [
            Icon(
              widget.icon ?? MdiIcons.nullIcon,
              size: 30,
              color: NyColors.of(context).primaryContent,
            ),
            SizedBox(
              height: 5,
            ),
            FittedBox(
              fit: BoxFit.contain,
              child: Text(
                widget.label,
                style: TextStyle(
                    color: NyColors.of(context).primaryContent, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
