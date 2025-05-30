import 'package:flutter/material.dart';

class MenuItem {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  MenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}

class GenericDrawerMenu extends StatelessWidget {
  final String headerTitle;
  final List<MenuItem> menuItems;  // <-- aqui está a correção

  const GenericDrawerMenu({
    Key? key,
    this.headerTitle = 'Menu',
    required this.menuItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFF0B0B0B),
                  Color(0xFF151515),
                ],
              ),
            ),
            child: Text(
              headerTitle,
              style: const TextStyle(
                color: Colors.yellow,
                fontSize: 24,
              ),
            ),
          ),
          ...menuItems.map((item) => ListTile(
            leading: Icon(item.icon, color: Colors.black),
            title: Text(item.title, style: const TextStyle(color: Colors.black)),
            onTap: item.onTap,
          )),
        ],
      ),
    );
  }
}
