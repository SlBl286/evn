import 'package:flutter/material.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:flutter_app/resources/widgets/search_bar.dart';
import 'package:maplibre_gl/mapbox_gl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nylo_support/widgets/ny_stateful_widget.dart';
import '../../app/controllers/giam_sat_controller.dart';
import 'package:nylo_support/widgets/ny_state.dart';

class GiamSatPage extends NyStatefulWidget {
  final GiamSatController controller = GiamSatController();
  static const route = "/giam_sat";
  GiamSatPage({Key? key}) : super(key: key);

  @override
  _GiamSatPageState createState() => _GiamSatPageState();
}

class _GiamSatPageState extends NyState<GiamSatPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
  }

  @override
  widgetDidLoad() async {}

  @override
  void dispose() {
    _tabController.dispose();
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
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Giám sát",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(MdiIcons.bell),
          ),
        ],
        bottom: TabBar(
          indicatorWeight: 3,
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: "Bản đồ",
            ),
            Tab(
              text: "Danh sách",
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Center(
              child: MaplibreMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(15.023069980780286, 105.7213568620676),
                  zoom: 5,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SearchBar(label: 'tim kiem'),
                  Builder(builder: (context) {
                    List<Widget> a = [];
                    for (var i = 0; i < 10; i++) {
                      a.add(ListTile(
                        leading: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        title: Text(
                          "P04 chuyen vien",
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Text(
                          "P04 chuyen vien",
                          style: TextStyle(color: Colors.black54),
                        ),
                        trailing: Icon(
                          MdiIcons.bell,
                          color: Colors.grey,
                        ),
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
            ),
          ],
        ),
      ),
    );
  }
}
