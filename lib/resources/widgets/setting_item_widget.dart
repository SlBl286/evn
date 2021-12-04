import 'package:flutter/material.dart';
import 'package:flutter_app/config/app_theme.dart';

class SettingItemWidget extends StatelessWidget {
  final String label;
  final IconData icon;

  final Direction direction;

  List<Widget> subItem = [];
  SettingItemWidget(
      {Key? key,
      required this.label,
      required this.icon,
      this.subItem = const [],
      this.direction = Direction.horizotal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Detail(
      label: label,
      icon: icon,
      subItem: subItem,
      direction: direction,
    );
  }
}

class Detail extends StatefulWidget {
  final Direction direction;
  final String label;
  final IconData icon;
  List<Widget> subItem = [];
  Detail(
      {Key? key,
      required this.label,
      required this.icon,
      required this.subItem,
      this.direction = Direction.horizotal})
      : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  double _animatedHeight = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: GestureDetector(
            onTap: () {
              if (widget.subItem.length > 0) {
                setState(() {
                  _animatedHeight != 0.0
                      ? _animatedHeight = 0.0
                      : _animatedHeight = widget.direction == Direction.vertical
                          ? widget.subItem.length * 50.0
                          : 50.0;
                });
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: NyColors.of(context).primaryAccent,
                  ),
                  child: Icon(widget.icon,
                      color: NyColors.of(context).secondaryContent),
                ),
                Text(
                  widget.label,
                  style: TextStyle(
                      color: NyColors.of(context).primaryAccent, fontSize: 20),
                ),
                Icon(Icons.arrow_forward_ios_outlined,
                    color: NyColors.of(context).primaryAccent),
              ],
            ),
          ),
        ),
        new AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          child: _animatedHeight > 0
              ? (widget.direction == Direction.horizotal
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: widget.subItem)
                  : Column(
                      children: widget.subItem,
                    ))
              : null,
          height: _animatedHeight,
          color: NyColors.of(context).primaryAccent,
          width: MediaQuery.of(context).size.width,
        )
      ],
    );
  }
}

enum Direction {
  vertical,
  horizotal,
}
