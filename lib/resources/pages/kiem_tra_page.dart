import 'package:flutter/material.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:flutter_app/resources/widgets/kiem_tra_listTile.dart';
import 'package:flutter_app/resources/widgets/search_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nylo_support/widgets/ny_stateful_widget.dart';
import '../../app/controllers/kiem_tra_controller.dart';
import 'package:nylo_support/widgets/ny_state.dart';

class KiemTraPage extends NyStatefulWidget {
  final KiemTraController controller = KiemTraController();
  static const route = "/kiem-tra";
  KiemTraPage({Key? key}) : super(key: key);

  @override
  _KiemTraPageState createState() => _KiemTraPageState();
}

class _KiemTraPageState extends NyState<KiemTraPage> {
  @override
  widgetDidLoad() async {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NyColors.of(context).background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: NyColors.of(context).appBarBackground,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, MyHomePage.route, (route) => false);
              },
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
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              MdiIcons.bell,
              color: NyColors.of(context).appBarPrimaryContent,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              MdiIcons.refresh,
              color: NyColors.of(context).appBarPrimaryContent,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(label: 'tim kiem'),
              Builder(builder: (context) {
                List<Widget> a = [];
                for (var i = 0; i < 10; i++) {
                  a.add(KiemTraItem(
                    line1: "1. sổ nhật ký vận hành",
                    line2: "1. sổ nhật ký vận hành",
                    line3: "23 bản ghi",
                    line4: "0 bản ghi và 0 ảnh cần đồng bộ",
                  ));
                }
                return Container(
                  child: Column(
                    children: a,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
