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
                style:
                    TextStyle(color: NyColors.of(context).appBarPrimaryContent),
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
                    "Xin chào ...",
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
            children: [],
          ),
        ),
      ),
    );
  }
}
