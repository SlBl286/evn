import 'package:nylo_framework/nylo_framework.dart';

class ThemeStorage extends Storable {
  static const key = 'app.evn.currentTheme';
  late String currentMode; // authentication token

  @override
  toStorage() => {
        "currentMode": this.currentMode,
      };

  @override
  fromStorage(dynamic data) {
    this.currentMode = data['currentMode'];
  }
}
