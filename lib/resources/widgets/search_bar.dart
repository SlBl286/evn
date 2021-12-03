import 'package:flutter/material.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SearchBar extends StatefulWidget {
  // Color? backgroundColor;
  String label;
  Function? onpress;
  SearchBar({
    Key? key,
    required this.label,
    this.onpress,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool isSearchOpened = false;
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
    actionKey.currentState!.dispose();
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
        left: 10,
        width: width! + 50,
        top: (yPosition!),
        height: height!,
        child: Container(
          color: NyColors.of(context).background,
          width: 100,
          child: TextField(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: () {
        print(isSearchOpened);
        setState(() {
          if (isSearchOpened) {
            floatingDropdown!.remove();
          } else {
            findDropdownData();

            floatingDropdown = _createFloatingDropdown();
            Overlay.of(context)!.insert(floatingDropdown!);
          }

          isSearchOpened = !isSearchOpened;
        });
      },
      child: Icon(
        Icons.search,
        color: NyColors.of(context).appBarPrimaryContent,
      ),
    );
  }
}
