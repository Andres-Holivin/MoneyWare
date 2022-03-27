import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../util/app_router.gr.dart';
import '../util/constants.dart';

bool isDark = MyApp.themeNotifier.value == ThemeMode.light ? false : true;
const double iconSize = 54.0;
Icon iconOff = const Icon(
  Icons.toggle_off,
  color: Colors.grey,
  size: iconSize,
);
Icon iconOn = const Icon(
  Icons.toggle_on,
  color: Colors.green,
  size: iconSize,
);

Icon iconPress =
    MyApp.themeNotifier.value == ThemeMode.light ? iconOff : iconOn;

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.45,
        child: Drawer(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 14, top: 10),
                height: MediaQuery.of(context).size.height * 0.1,
                child: Image.asset(
                  'assets/images/logo.png',
                ),
              ),
              ItemNavigation(
                icon: Icons.home_rounded,
                isPress: true,
                press: () {},
                title: 'Home',
              ),
              ItemNavigation(
                icon: Icons.person_rounded,
                isPress: false,
                press: () {
                  Navigator.of(context).pop();
                },
                title: 'Profile',
              ),
              ItemNavigation(
                icon: Icons.receipt_long_rounded,
                isPress: false,
                press: () {
                  AutoRouter.of(context).push(const TransactionRoute());
                  // print('router');
                },
                title: 'Transactions',
              ),
              ItemNavigation(
                icon: Icons.bar_chart_rounded,
                isPress: false,
                press: () {},
                title: 'Stats',
              ),
              ItemNavigation(
                icon: Icons.settings_rounded,
                isPress: false,
                press: () {},
                title: 'Settings',
              ),
              ItemNavigation(
                icon: Icons.power_settings_new_rounded,
                isPress: false,
                press: () {},
                title: 'Logout',
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                    color: Color.fromARGB(255, 125, 125, 125), thickness: 0.2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Dark Mode'),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: iconPress,
                    onTap: () {
                      setState(() {
                        MyApp.themeNotifier.value =
                            MyApp.themeNotifier.value == ThemeMode.light
                                ? ThemeMode.dark
                                : ThemeMode.light;
                        iconPress = MyApp.themeNotifier.value == ThemeMode.light
                            ? iconOff
                            : iconOn;
                      });
                    },
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.only(top: 0, bottom: 0),
                child: const Text(
                  'Version 1.0.0',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                    color: Color.fromARGB(255, 125, 125, 125), thickness: 0.7),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10, left: 10),
                child: Row(children: [
                  const CircleAvatar(
                    radius: 28,
                    child: Text('avatar'),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Name Name',
                            style: TextStyle(
                              fontSize: 14,
                            )),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemNavigation extends StatelessWidget {
  const ItemNavigation({
    Key? key,
    required this.icon,
    required this.title,
    required this.isPress,
    required this.press,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final bool isPress;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: press,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          decoration: BoxDecoration(
            color:
                isPress ? ConstBackgroundLight.secondary : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(icon),
            ),
            Text(title),
          ]),
        ),
      ),
    );
  }
}
