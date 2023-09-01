import 'package:flutter/material.dart';
import 'package:smart_home/generated/assets.dart';
import 'package:smart_home/src/ui/widgets/light_controller_widgets.dart';

class LightController extends StatefulWidget {
  const LightController({super.key});

  @override
  State<LightController> createState() => _LightControllerState();
}

class _LightControllerState extends State<LightController> {
  double brightness = 0.2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Image.asset(Assets.imagesBulb),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Slider(
                  value: brightness,
                  label: brightness.toString(),
                  max: 1,
                  min: 0,
                  onChanged: (v) {
                    setState(() => brightness = v);
                  },
                  onChangeEnd: (v) {},
                  inactiveColor: const Color(0xFFF8F8FA),
                  activeColor: const Color(0xFF05050A),
                ),
              ),
            ],
          ),
        ),
        const LightControllerWidgets(),
      ],
    );
  }
}
