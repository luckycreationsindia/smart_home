import 'package:flutter/material.dart';
import 'package:smart_home/generated/assets.dart';
import 'package:smart_home/src/ui/widgets/light_controller_widgets.dart';

class ACController extends StatefulWidget {
  const ACController({super.key});

  @override
  State<ACController> createState() => _ACControllerState();
}

class _ACControllerState extends State<ACController> {
  double brightness = 0.2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Image.asset(Assets.imagesAc),
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
        LightControllerWidgets(
          onOffChange: (state) {},
        ),
      ],
    );
  }
}
