import 'package:flutter/material.dart';
import 'package:smart_home/src/ui/widgets/ac_controller.dart';
import 'package:smart_home/src/ui/widgets/house_controller.dart';
import 'package:smart_home/src/ui/widgets/iot_button_list.dart';
import 'package:smart_home/src/ui/widgets/light_controller.dart';
import 'package:smart_home/src/ui/widgets/refrigerator_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IOTButtonList(
          onChange: (selectedIndex) {
            setState(() {
              _selectedIndex = selectedIndex;
            });
          },
        ),
        Expanded(child: getSelectedIOTType()),
      ],
    );
  }

  Widget getSelectedIOTType() {
    switch (_selectedIndex) {
      case 0:
        return const LightController();
      case 1:
        return const ACController();
      case 2:
        return const RefrigeratorController();
      case 3:
        return const HouseController();
      default:
        return const LightController();
    }
  }
}
