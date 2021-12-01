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

class _GiamSatPageState extends NyState<GiamSatPage> {
  int _selectedIndex = 1;
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
  void initState() {
    super.initState();
  }

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
              "Giám sát",
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
        ],
      ),
      body: SafeArea(
        child: tabOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Bản đồ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Danh sách',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: NyColors.of(context).primaryAccent,
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
          SearchBar(label: 'tim kiem'),
          Builder(builder: (context) {
            List<Widget> a = [];
            for (var i = 0; i < 10; i++) {
              a.add(Container(
                color: NyColors.of(context).secondaryContent,
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  title: Text(
                    "P04 chuyen vien",
                    style: TextStyle(
                      color: NyColors.of(context).appBarPrimaryContent,
                    ),
                  ),
                  subtitle: Text(
                    "P04 chuyen vien",
                    style: TextStyle(
                      color: NyColors.of(context).appBarPrimaryContent,
                    ),
                  ),
                  trailing: Icon(
                    MdiIcons.bell,
                    color: Colors.white,
                  ),
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
    );
  }
}
