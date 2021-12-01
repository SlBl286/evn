import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:flutter_app/resources/pages/form_doi_tuong_page.dart';
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
  List<Widget> _objList = [];
  @override
  widgetDidLoad() async {
    await widget.controller.getListBieuMau();
  }

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
              Icons.search,
              color: NyColors.of(context).appBarPrimaryContent,
            ),
          ),
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
            children: [
              Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: NyColors.of(context).appBarBackground,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField<int>(
                    iconEnabledColor: NyColors.of(context).appBarPrimaryContent,
                    decoration: InputDecoration(
                      label: Text(
                        "Biểu mẫu",
                        style: TextStyle(color: Colors.white),
                      ),
                      filled: true,
                      fillColor: NyColors.of(context).appBarBackground,
                    ),
                    iconSize: 24,
                    isExpanded: true,
                    style: TextStyle(
                      color: NyColors.of(context).appBarPrimaryContent,
                    ),
                    onChanged: (int? newValue) {
                      setState(() {
                        widget.controller.currentBieuMauId = newValue;
                        widget.controller.getListObject();
                        _objList.clear();
                        if (widget.controller.listDoiTuong.length > 0) {
                          for (var item in widget.controller.listDoiTuong) {
                            _objList.add(GestureDetector(
                              onTap: () {
                                print(item.name);
                                routeTo(FormDoiTuongPage.route, data: item);
                              },
                              child: Container(
                                decoration: BoxDecoration(),
                                padding: EdgeInsets.only(bottom: 10),
                                child: ListTile(
                                  tileColor:
                                      NyColors.of(context).secondaryContent,
                                  leading: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    item.name,
                                    style: TextStyle(),
                                  ),
                                  subtitle: Text(
                                    item.id.toString(),
                                    style: TextStyle(),
                                  ),
                                  trailing: Icon(
                                    MdiIcons.bell,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ));
                          }
                        }
                      });
                    },
                    items: widget.controller.listBieuMau
                        .map<DropdownMenuItem<int>>((BieuMau item) {
                      return DropdownMenuItem<int>(
                        value: item.id,
                        child: Text(item.name),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Builder(builder: (context) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: _objList,
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
