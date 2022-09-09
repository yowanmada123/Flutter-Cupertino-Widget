// import 'package:flutter/cupertino.dart';
// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        theme: CupertinoThemeData(brightness: Brightness.light),
        home: TampilAlertDialog());
  }
}

class TampilAlertDialog extends StatefulWidget {
  TampilAlertDialog({Key? key}) : super(key: key);

  @override
  State<TampilAlertDialog> createState() => _TampilAlertDialogState();
}

class _TampilAlertDialogState extends State<TampilAlertDialog> {
  int pilihIndex = 0;

  @override
  void initState() {
    pilihIndex = 0;
    super.initState();
  }

  List<Widget> dataBody = [
    Text(
      "Home",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    Text(
      "Search",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    Text(
      "Arsip",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    Text(
      "Profile",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.all(0),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        backgroundColor: Colors.blue,
        middle: Text(
          "Cupertino Widget",
          style: TextStyle(color: Colors.white),
        ),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              CupertinoIcons.settings,
              color: Colors.white,
              size: 22,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
              size: 22,
            )
          ],
        ),
      ),
      child: Center(
          child: CupertinoTabScaffold(
              tabBar: CupertinoTabBar(
                  onTap: (nilai) {
                    pilihIndex = nilai;
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.home),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.search), label: "Search"),
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.archivebox), label: "Arsip"),
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.profile_circled),
                        label: "Profile"),
                  ]),
              tabBuilder: (context, index) {
                return CupertinoTabView(builder: (context) {
                  return Center(child: dataBody[pilihIndex]);
                });
              })),
    );
  }
}
