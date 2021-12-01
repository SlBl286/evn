import 'package:flutter/material.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:flutter_app/resources/widgets/search_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nylo_support/widgets/ny_stateful_widget.dart';
import '../../app/controllers/tra_cuu_controller.dart';
import 'package:nylo_support/widgets/ny_state.dart';

class TraCuuPage extends NyStatefulWidget {
  final TraCuuController controller = TraCuuController();
  static const route = "/tra-cuu";
  TraCuuPage({Key? key}) : super(key: key);

  @override
  _TraCuuPageState createState() => _TraCuuPageState();
}

class _TraCuuPageState extends NyState<TraCuuPage> {
 

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
              style: TextStyle(
                fontSize: 16,
                color: NyColors.of(context).appBarPrimaryContent,
              ),
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
              SearchBar(label: 'tim kiem'),
            ],
          ),
        ),
      ),
     
    );
  }
}
