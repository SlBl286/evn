import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:flutter_app/resources/widgets/custom_dropdown.dart';
import 'package:flutter_app/resources/widgets/search_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nylo_framework/theme/helper/ny_theme.dart';
import 'package:nylo_support/widgets/ny_stateful_widget.dart';
import '../../app/controllers/thu_thap_controller.dart';
import 'package:nylo_support/widgets/ny_state.dart';

class ThuThapPage extends NyStatefulWidget {
  static const route = "/thu-thap";
  final ThuThapController controller = ThuThapController();

  ThuThapPage({Key? key}) : super(key: key);

  @override
  _ThuThapPageState createState() => _ThuThapPageState();
}

class _ThuThapPageState extends NyState<ThuThapPage> {
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
            children: [
              CustomDropdown(
                backgroundColor: NyColors.of(context).appBarBackground,
                label: "Chọn biểu mẫu",
                chidren: [
                  DropDownItem(text: "biểu mẫu 1"),
                  DropDownItem(text: "biểu mẫu 2"),
                  DropDownItem(text: "biểu mẫu 3"),
                  DropDownItem(text: "biểu mẫu 4")
                ],
              ),
              SearchBar(label: 'tim kiem'),

            ],
          ),
        ),
      ),
    );
  }
}
