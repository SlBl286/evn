import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomDropdown extends StatefulWidget {
  final String label;
  Color? backgroundColor = NyColors.light.appBarBackground;
  List<DropDownItem> chidren = [];
  CustomDropdown(
      {Key? key,
      required this.label,
      this.backgroundColor,
      required this.chidren})
      : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  bool isDropdownOpened = false;
  late GlobalKey actionKey;
  double? height, width, xPosition, yPosition;
  OverlayEntry? floatingDropdown;
  @override
  void initState() {
    actionKey = LabeledGlobalKey(widget.label);
    super.initState();
  }

  @override
  void dispose() {
    if (isDropdownOpened) {
      floatingDropdown!.remove();
    }
    super.dispose();
  }

  void findDropdownData() {
    RenderBox renderBox =
        actionKey.currentContext!.findRenderObject() as RenderBox;
    width = renderBox.size.width;
    height = renderBox.size.height;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
  }

  OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        left: xPosition,
        width: width,
        top: (yPosition! + height!),
        height: widget.chidren.length * height! + 60,
        child: DropDown(
          itemHeight: 40,
          chidren: widget.chidren,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: () {
        setState(() {
          if (isDropdownOpened) {
            floatingDropdown!.remove();
          } else {
            findDropdownData();

            floatingDropdown = _createFloatingDropdown();
            Overlay.of(context)!.insert(floatingDropdown!);
          }

          isDropdownOpened = !isDropdownOpened;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          // borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Text(
              widget.label,
              style: TextStyle(
                color: NyColors.of(context).appBarPrimaryContent,
                fontSize: 20,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_drop_down,
              color: NyColors.of(context).appBarPrimaryContent,
            )
          ],
        ),
      ),
    );
  }
}

class DropDown extends StatelessWidget {
  final double itemHeight;
  List<DropDownItem> chidren = [];
  DropDown({Key? key, required this.itemHeight, required this.chidren})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment(-0.90, 0),
            child: ClipPath(
              clipper: ArrowClipper(),
              child: Container(
                height: 20,
                width: 30,
                decoration:
                    BoxDecoration(color: NyColors.of(context).appBarBackground),
              ),
            ),
          ),
          Container(
              height: chidren.length * itemHeight + 16,
              decoration: BoxDecoration(
                color: NyColors.of(context).appBarBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Column(
                      children: chidren,
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}

class DropDownItem extends StatelessWidget {
  final String text;
  final IconData? iconData;
  final bool? isSelected;

  const DropDownItem(
      {Key? key, required this.text, this.iconData, this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: NyColors.of(context).appBarBackground,
            // borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: TextStyle(
                    color: NyColors.of(context).appBarPrimaryContent,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    decoration: TextDecoration.none),
              ),
              Spacer(),
              if (iconData != null)
                Icon(
                  iconData,
                  color: NyColors.of(context).appBarPrimaryContent,
                )
            ],
          ),
        ),
        Divider(
          height: 5,
          color: Colors.white,
        )
      ],
    );
  }
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
