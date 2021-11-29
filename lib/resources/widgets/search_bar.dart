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
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      decoration: BoxDecoration(
        color: NyColors.of(context).primaryAccent,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              style: TextStyle(color: NyColors.of(context).primaryContent),
              cursorColor: NyColors.of(context).primaryContent,
              decoration: InputDecoration(
                hintText: "Tìm kiếm",
                hintStyle: TextStyle(
                  color: NyColors.of(context).primaryContent,
                ),
                border: InputBorder.none,
              ),
              onChanged: (String keyword) {},
            ),
          ),
          Icon(
            Icons.search,
            color: NyColors.of(context).primaryContent,
          )
        ],
      ),
    );
  }
}
