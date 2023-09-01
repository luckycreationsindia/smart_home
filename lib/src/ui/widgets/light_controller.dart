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
  bool onOffState = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    onOffState ? Container(
                      height: 2,
                      width: 2,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.yellow.shade300,
                            blurRadius: brightness * 10,
                            spreadRadius: brightness * 10,
                            offset: const Offset(0.0, 0.0),
                          )
                        ],
                      ),
                    ) : const SizedBox(),
                    Image.asset(Assets.imagesBulb),
                  ],
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Slider(
                  value: brightness,
                  label: brightness.toString(),
                  max: 1,
                  min: 0,
                  onChanged: onOffState ? (v) {
                    setState(() => brightness = v);
                  } : null,
                  onChangeEnd: (v) {},
                  inactiveColor: const Color(0xFFF8F8FA),
                  activeColor: const Color(0xFF05050A),
                ),
              ),
            ],
          ),
        ),
        LightControllerWidgets(
          onOffChange: (state) {
            setState(() {
              onOffState = state;
            });
          },
        ),
      ],
    );
  }
}
