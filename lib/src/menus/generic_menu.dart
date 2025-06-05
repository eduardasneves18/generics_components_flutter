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
  final List<MenuItem> menuItems;

  final Color headerTextColor;
  final Color menuItemTextColor;
  final Color iconColor;
  final Color backgroundColor;
  final Color? headerBackgroundColor;

  const GenericDrawerMenu({
    Key? key,
    this.headerTitle = 'Menu',
    required this.menuItems,
    this.headerTextColor = Colors.white,
    this.menuItemTextColor = Colors.black,
    this.iconColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.headerBackgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: backgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: headerBackgroundColor != null
                  ? BoxDecoration(color: headerBackgroundColor)
                  : const BoxDecoration(
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
                style: TextStyle(
                  color: headerTextColor,
                  fontSize: 24,
                ),
              ),
            ),
            ...menuItems.map((item) => ListTile(
              leading: Icon(item.icon, color: iconColor),
              title: Text(
                item.title,
                style: TextStyle(color: menuItemTextColor),
              ),
              onTap: item.onTap,
            )),
          ],
        ),
      ),
    );
  }
}
