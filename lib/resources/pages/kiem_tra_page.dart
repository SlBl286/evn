import 'package:flutter/material.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:flutter_app/resources/pages/doi_tuong_kiem_tra_page.dart';
import 'package:flutter_app/resources/pages/form_kiem_tra_page.dart';
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
  bool isSearching = false;
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
        title: isSearching
            ? TextField(
                cursorColor: NyColors.of(context).appBarPrimaryContent,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: NyColors.of(context).appBarPrimaryContent),
                    ),
                    focusedBorder: InputBorder.none,
                    hintText: 'Tìm kiếm',
                    hintStyle: TextStyle(
                        color: NyColors.of(context).appBarPrimaryContent),
                    icon: Icon(
                      Icons.search,
                      color: NyColors.of(context).appBarPrimaryContent,
                    )),
              )
            : Row(
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
                    "Kiểm tra ",
                    style: TextStyle(
                      fontSize: 20,
                      color: NyColors.of(context).appBarPrimaryContent,
                    ),
                  ),
                ],
              ),
        actions: [
          isSearching
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                    });
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: NyColors.of(context).appBarPrimaryContent,
                  ),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                  icon: Icon(
                    Icons.search,
                    color: NyColors.of(context).appBarPrimaryContent,
                  ),
                ),
          if (!isSearching)
            IconButton(
              onPressed: () {},
              icon: Icon(
                MdiIcons.bell,
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
              Builder(builder: (context) {
                List<Widget> a = [];
                for (var i = 0; i < 10; i++) {
                  a.add(KiemTraItem(
                    onItemTap: () {
                      routeTo(DoiTuongKiemTraPage.route, data: "test");
                    },
                    onAddPress: () {
                      routeTo(FormKiemTraPage.route, data: "them moi");
                    },
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
