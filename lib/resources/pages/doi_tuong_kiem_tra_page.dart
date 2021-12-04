import 'package:flutter/material.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:flutter_app/resources/widgets/setting_item_widget.dart';
import 'package:flutter_app/resources/widgets/so_item.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:maplibre_gl/mapbox_gl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:nylo_support/widgets/ny_stateful_widget.dart';
import '../../app/controllers/doi_tuong_kiem_tra_controller.dart';
import 'package:nylo_support/widgets/ny_state.dart';

class DoiTuongKiemTraPage extends NyStatefulWidget {
  static const route = "/doi_tuong_kiem_tra";
  final DoiTuongKiemTraController controller = DoiTuongKiemTraController();

  DoiTuongKiemTraPage({Key? key}) : super(key: key);

  @override
  _DoiTuongKiemTraPageState createState() => _DoiTuongKiemTraPageState();
}

class _DoiTuongKiemTraPageState extends NyState<DoiTuongKiemTraPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isSearching = false;
  int _selectedIndex = 1;
  bool _a = false, _b = false;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> tabOptions = <Widget>[
    MapTab(),
    DsTab(),
  ];
  @override
  widgetDidLoad() async {}

  @override
  void dispose() {
    super.dispose();
  }

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                      routeTo(MyHomePage.route,
                          navigationType: NavigationType.pushAndRemoveUntil,
                          removeUntilPredicate: (route) => false);
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
                    "Sổ nhật ký vận hành",
                    style: TextStyle(
                      fontSize: 20,
                      color: NyColors.of(context).appBarPrimaryContent,
                    ),
                  ),
                ],
              ),
        actions: [
          if (_selectedIndex == 1 && !isSearching)
            IconButton(
              onPressed: () {
                setState(() {
                  isSearching = true;
                });
              },
              icon: Icon(
                Icons.search,
                color: NyColors.of(context).appBarPrimaryContent,
              ),
            )
          else if (_selectedIndex == 1 && isSearching)
            IconButton(
              onPressed: () {
                setState(() {
                  isSearching = false;
                });
              },
              icon: Icon(
                Icons.cancel,
                color: NyColors.of(context).appBarPrimaryContent,
              ),
            ),
          if (_selectedIndex == 1 && !isSearching)
            IconButton(
              onPressed: () {
                _openEndDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: NyColors.of(context).appBarPrimaryContent,
              ),
            ),
        ],
      ),
      endDrawer: Drawer(
        child: SafeArea(
          child: Container(
            color: NyColors.of(context).background,
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: NyColors.of(context).appBarBackground,
                  height: AppBar().preferredSize.height,
                  child: Center(
                      child: Text('Tùy chọn',
                          style: TextStyle(
                            fontSize: 18,
                            color: NyColors.of(context).appBarPrimaryContent,
                          ))),
                ),
                Divider(
                  indent: 5,
                  endIndent: 5,
                  color: NyColors.of(context).primaryAccent,
                ),
                SettingItemWidget(
                  label: 'Sắp xếp',
                  icon: Icons.sort_by_alpha,
                  subItem: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: NyColors.of(context).secondaryContent,
                      ),
                      child: Icon(Icons.arrow_downward,
                          color: NyColors.of(context).primaryAccent),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: NyColors.of(context).secondaryContent,
                      ),
                      child: Icon(Icons.arrow_upward,
                          color: NyColors.of(context).primaryAccent),
                    ),
                  ],
                ),
                SettingItemWidget(
                  direction: Direction.vertical,
                  label: 'Lọc theo',
                  icon: Icons.filter_list,
                  subItem: [
                    Row(
                      children: [
                        Checkbox(
                            onChanged: (bool) {
                              setState(() {
                                _a = !_a;
                              });
                            },
                            value: _a),
                        Text(
                          'Đã có vị trí',
                          style: TextStyle(
                              color: NyColors.of(context).secondaryContent),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            onChanged: (bool) {
                              setState(() {
                                _b = !_b;
                              });
                            },
                            value: _b),
                        Text(
                          'Chua có vị trí',
                          style: TextStyle(
                              color: NyColors.of(context).secondaryContent),
                        ),
                      ],
                    ),
                  ],
                ),
                SettingItemWidget(label: 'Chỉnh sửa', icon: Icons.edit),
                Divider(
                  indent: 5,
                  endIndent: 5,
                  color: NyColors.of(context).primaryAccent,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: tabOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: NyColors.of(context).bottomTabBarIconSelected,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map_outlined,
              color: NyColors.of(context).bottomTabBarIconUnselected,
            ),
            activeIcon: Icon(
              Icons.map_outlined,
              color: NyColors.of(context).primaryAccent,
            ),
            label: 'Bản đồ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt_outlined,
              color: NyColors.of(context).bottomTabBarIconUnselected,
            ),
            activeIcon: Icon(
              Icons.list_alt_outlined,
              color: NyColors.of(context).bottomTabBarIconSelected,
            ),
            label: 'Danh sách',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class MapTab extends StatelessWidget {
  const MapTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaplibreMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(15.023069980780286, 105.7213568620676),
          zoom: 5,
        ),
      ),
    );
  }
}

class DsTab extends StatelessWidget {
  const DsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Builder(builder: (context) {
            List<Widget> a = [];
            for (var i = 0; i < 10; i++) {
              a.add(SoItem(
                name: "Doi TT&QLVH $i",
              ));
            }
            return Container(
              child: Column(
                children: a,
              ),
            );
          })
        ],
      ),
    );
  }
}
