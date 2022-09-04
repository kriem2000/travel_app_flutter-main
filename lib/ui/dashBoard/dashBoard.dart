import 'package:flutter/material.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:qi_bus_prokit/utils/AppWidget.dart';
// import 'package:qi_bus_prokit/utils/QiBusColors.dart';
// import 'package:qi_bus_prokit/utils/QiBusImages.dart';

import '../home/home.dart';
import '../offers/offers.dart';
import '../more/more.dart';

class Dashboard extends StatefulWidget {
  static String tag = '/Dashboard';

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  var isSelected = 0;
  final List<Widget> _children = [
    Home(),
    Offers(),
    More(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            tabItem(0, "images/qibus_ic_home_selected.png",
                "images/qibus_ic_home.png"),
            tabItem(1, "images/qibus_ic_package_selected.png",
                "images/qibus_ic_package.png"),
            tabItem(2, "images/qibus_ic_more_selected.png",
                "images/qibus_ic_more.png"),
          ],
        ),
      ),
      body: _children[isSelected],
    );
  }

  Widget tabItem(var pos, var icon, var icon1) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            isSelected = pos;
          },
        );
      },
      child: Container(
        width: 45,
        height: 45,
        alignment: Alignment.center,
        decoration: isSelected == pos
            ? const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 253, 160, 160),
              )
            : const BoxDecoration(),
        child: Image.asset(isSelected == pos ? icon : icon1,
            width: 20, height: 20),
      ),
    );
  }
}
