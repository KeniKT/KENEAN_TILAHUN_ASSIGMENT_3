import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../routes.dart';
import '../bloc/asebeza_bloc_bloc.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
  final drawerItems = [
    {"title": "HOME", "route": Routes.home, "icon": Icons.home},
    {"title": "PROFILE", "route": Routes.profile, "icon": Icons.account_circle},
    {"title": "HISTORY", "route": Routes.history, "icon": Icons.shopping_bag},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          backgroundColor: Colors.grey,
          child: Container(
            margin: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: drawerItems.length,
              itemBuilder: (BuildContext context, int index) {
                final item = drawerItems[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black87,
                          minimumSize: const Size(100, 50),
                          alignment: Alignment.centerLeft,
                          elevation: 0),
                      onPressed: () {
                        if (item["title"] == "HOME") {
                          BlocProvider.of<AsebezaBlocBloc>(context)
                              .add(FetchAsebezaBlocEvent());
                        }
                        Navigator.pushNamed(context, item["route"].toString());
                      },
                      icon: Icon(item["icon"] as IconData?),
                      label: Text(item["title"].toString())),
                );
              },
            ),
          )),
    );
  }
}
