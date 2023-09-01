import 'package:flutter/material.dart';

class IOTButtonList extends StatefulWidget {
  const IOTButtonList({super.key, required this.onChange});
  final Function(int selectedIndex) onChange;

  @override
  State<IOTButtonList> createState() => _IOTButtonListState();
}

class _IOTButtonListState extends State<IOTButtonList> {
  int iotSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              IOTTypeButton(
                onTap: () {
                  setState(() {
                    iotSelectedIndex = 0;
                    widget.onChange(0);
                  });
                },
                icon: iotSelectedIndex == 0
                    ? Icons.lightbulb
                    : Icons.lightbulb_outline,
                selected: iotSelectedIndex == 0,
              ),
              SizedBox(width: constraints.maxWidth * .1),
              IOTTypeButton(
                onTap: () {
                  setState(() {
                    iotSelectedIndex = 1;
                    widget.onChange(1);
                  });
                },
                icon: iotSelectedIndex == 1
                    ? Icons.ac_unit
                    : Icons.ac_unit_outlined,
                selected: iotSelectedIndex == 1,
              ),
              SizedBox(width: constraints.maxWidth * .1),
              IOTTypeButton(
                onTap: () {
                  setState(() {
                    iotSelectedIndex = 2;
                    widget.onChange(2);
                  });
                },
                icon: iotSelectedIndex == 2
                    ? Icons.kitchen
                    : Icons.kitchen_outlined,
                selected: iotSelectedIndex == 2,
              ),
              SizedBox(width: constraints.maxWidth * .1),
              IOTTypeButton(
                onTap: () {
                  setState(() {
                    iotSelectedIndex = 3;
                    widget.onChange(3);
                  });
                },
                icon: iotSelectedIndex == 3 ? Icons.home : Icons.home_outlined,
                selected: iotSelectedIndex == 3,
              ),
            ],
          ),
        );
      },
    );
  }
}

class IOTTypeButton extends StatelessWidget {
  const IOTTypeButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.selected = false,
  });

  final IconData icon;
  final bool selected;
  final Function() onTap;
  final Color selectedColor = const Color(0xFF05050A);
  final Color unSelectedColor = const Color(0xFFF8F8FA);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 100,
        width: 70,
        decoration: BoxDecoration(
          color: selected ? selectedColor : unSelectedColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: selected ? unSelectedColor : selectedColor,
          size: 30,
        ),
      ),
    );
  }
}