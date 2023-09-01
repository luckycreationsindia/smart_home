import 'package:flutter/material.dart';

class LightControllerWidgets extends StatefulWidget {
  const LightControllerWidgets({super.key});

  @override
  State<LightControllerWidgets> createState() => _LightControllerWidgetsState();
}

class _LightControllerWidgetsState extends State<LightControllerWidgets> {
  final Color selectedColor = const Color(0xFF05050A);
  final Color unSelectedColor = const Color(0xFFF8F8FA);
  bool onOffStatus = true;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 120,
                width: constraints.maxWidth * .4,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: unSelectedColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "4kWh (\$3/h)",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Energy usage",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 120,
              width: constraints.maxWidth * .4,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: unSelectedColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Switch(
                    value: onOffStatus,
                    onChanged: (newVal) {
                      setState(() {
                        onOffStatus = newVal;
                      });
                    },
                    activeColor: Colors.white,
                    hoverColor: Colors.transparent,
                    trackOutlineColor: MaterialStatePropertyAll(
                        selectedColor.withOpacity(0.5)),
                    activeTrackColor: selectedColor,
                  ),
                  const Text(
                    "Turn on/off",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
