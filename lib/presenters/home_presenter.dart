import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:platform_channel_exemple/models/battery_model.dart';
import 'package:platform_channel_exemple/pages/home/home_presenter_contract.dart';

class HomePresenter extends ChangeNotifier implements HomePresenterContract {
  static const key = 'com.example.platform_channel_exemple/battery';
  final _platform = const MethodChannel(key);
  final BatteryModel _battery = BatteryModel(percentBattery: 0);

  @override
  int get batteryLvl => _battery.percentBattery;
  set setBatteryLvl(int value) => _battery.percentBattery = value;

  @override
  Future<void> getBatteryLevel() async {
    _battery.percentBattery = await _platform.invokeMethod("getBatteryLevel");
    notifyListeners();
  }
}
