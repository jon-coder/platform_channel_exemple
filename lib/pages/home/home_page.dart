import 'package:flutter/material.dart';
import 'package:platform_channel_exemple/presenters/home_presenter.dart';

class HomePage extends StatefulWidget {
  final presenter = HomePresenter();

  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.presenter.getBatteryLevel();
    widget.presenter.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Platform Channel'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Battery Level ${widget.presenter.batteryLvl}%.\nClick on button to refresh',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.deepPurple,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await widget.presenter.getBatteryLevel(),
        child: const Icon(Icons.battery_full),
      ),
    );
  }
}
