import 'dart:math';

import 'package:flutter/material.dart';
import 'package:money_management/components/nav_bar.dart';
import 'package:money_management/main.dart';
import 'package:money_management/util/constants.dart';

import '../components/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Icon iconSelected;
  @override
  void initState() {
    super.initState();
    iconSelected = MyApp.themeNotifier.value == ThemeMode.light
        ? const Icon(Icons.dark_mode)
        : const Icon(Icons.light_mode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            const Header(),
            const Balance(),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonMoney(
                      color: const Color.fromARGB(255, 0, 168, 106),
                      press: () {},
                      text: 'Income',
                      price: 'Rp.1.000.000.000',
                    ),
                    ButtonMoney(
                      color: const Color.fromARGB(255, 253, 60, 73),
                      press: () {},
                      text: 'Expenses',
                      price: 'Rp.1.000.000',
                    ),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    margin: const EdgeInsets.symmetric(vertical: 14),
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      "Services",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    )),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 2),
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      alignment: Alignment.bottomLeft,
                      child: const Icon(
                        Icons.tune_rounded,
                      )),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                        4,
                        (index) => ServiceItem(
                            press: () {},
                            title: 'Send\nMoney',
                            icon: Icons.paid_rounded)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                        4,
                        (index) => ServiceItem(
                            press: () {},
                            title: 'Send\nMoney',
                            icon: Icons.paid_rounded)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    margin: const EdgeInsets.symmetric(vertical: 14),
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      "Recent Transaction",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    )),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      "* max 5",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    )),
              ],
            ),
            Column(
              children: List.generate(
                3,
                (index) => const TransactionItem(
                    title: "title",
                    desc: 'desc',
                    icon: Icon(
                      Icons.shopping_basket_rounded,
                      size: 38,
                      color: Color.fromARGB(255, 252, 170, 18),
                    ),
                    bgIcon: Color.fromARGB(80, 252, 170, 18),
                    price: 'price',
                    time: 'time'),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  const ServiceItem({
    Key? key,
    required this.press,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final GestureTapCallback press;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: press,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: const Color.fromARGB(50, 125, 125, 125),
                borderRadius: BorderRadius.circular(10)),
            child: Icon(
              icon,
              size: 42,
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w700, color: Colors.grey),
          )
        ],
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.title,
    required this.desc,
    required this.icon,
    required this.bgIcon,
    required this.price,
    required this.time,
  }) : super(key: key);
  final String title;
  final String desc;
  final Icon icon;
  final Color bgIcon;
  final String price;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ConstBackgroundLight.secondary,
      ),
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: bgIcon),
          child: icon,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(
                desc,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              )
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                price,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.red),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: const TextStyle(color: Colors.grey, fontSize: 10),
              )
            ],
          ),
        )
      ]),
    );
  }
}

class ButtonMoney extends StatelessWidget {
  const ButtonMoney({
    Key? key,
    required this.text,
    required this.color,
    required this.press,
    required this.price,
  }) : super(key: key);
  final String text;
  final String price;
  final Color color;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(5),
        alignment: Alignment.center,
        width: 170,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.rotate(
              angle: text == 'Income' ? 0 : 180 * pi / 180,
              child: const Icon(
                Icons.save_alt_rounded,
                color: Colors.white,
                size: 28,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: Text(text,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16)),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: Text(price,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Balance extends StatelessWidget {
  const Balance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(bottom: 7),
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Account Overview",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              )),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                color: ConstBackgroundLight.secondary,
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(10),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: const Text(
                          "2000",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w800),
                        ),
                      ),
                      const Text(
                        "Current Balance",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 172, 48),
                          borderRadius: BorderRadius.circular(100)),
                      child: const Icon(
                        Icons.add_rounded,
                        size: 24,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
