import 'package:flutter/material.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:flutter_app/resources/widgets/setting_item_widget.dart';
import 'package:nylo_support/widgets/ny_stateful_widget.dart';
import '../../app/controllers/settings_controller.dart';
import 'package:nylo_support/widgets/ny_state.dart';

class SettingsPage extends NyStatefulWidget {
  static const route = "/settings";
  final SettingsController controller = SettingsController();

  SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends NyState<SettingsPage> {
  @override
  widgetDidLoad() async {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cài đặt"),
      ),
      body: SafeArea(
          child: Container(
        color: NyColors.of(context).background,
        child: Column(
          children: <Widget>[
            Divider(
              indent: 5,
              endIndent: 5,
              color: NyColors.of(context).primaryAccent,
            ),
            SettingItemWidget(
              label: 'Cài đặt 1',
              icon: Icons.settings,
              subItem: [
                Icon(Icons.ac_unit, color: NyColors.of(context).primaryContent),
              ],
            ),
            SettingItemWidget(
              label: 'Cài đặt 2',
              icon: Icons.settings,
            ),
            Divider(
              indent: 5,
              endIndent: 5,
              color: NyColors.of(context).primaryAccent,
            ),
            SettingItemWidget(
              label: 'Cài đặt 3',
              icon: Icons.settings,
            ),
            SettingItemWidget(
              label: 'Cài đặt 4',
              icon: Icons.settings,
            ),
            SettingItemWidget(
              label: 'Cài đặt 5',
              icon: Icons.settings,
            ),
            Divider(
              indent: 5,
              endIndent: 5,
              color: NyColors.of(context).primaryAccent,
            ),
          ],
        ),
      )),
    );
  }
}
