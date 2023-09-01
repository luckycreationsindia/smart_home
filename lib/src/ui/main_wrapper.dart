import 'package:flutter/material.dart';
import 'package:smart_home/l10n/l10n.dart';

class MainWrapper extends StatefulWidget {
  final Widget child;
  final int selectedIndex;

  const MainWrapper({
    super.key,
    required this.child,
    required this.selectedIndex,
  });

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.appTitle,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          context.l10n.subTitle,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      return IconButton(
                        onPressed: () => Scaffold.of(context).openEndDrawer(),
                        icon: const Icon(Icons.notifications_none_outlined),
                      );
                    },
                  )
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: widget.child,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      endDrawer: Builder(
        builder: (context) {
          return Drawer(
            child: Container(
              color: Theme.of(context).drawerTheme.backgroundColor,
              child: ListView(
                children: [
                  AppBar(
                    title: const Text("Notifications"),
                    actions: [
                      IconButton(
                        onPressed: () {
                          Scaffold.of(context).closeEndDrawer();
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
