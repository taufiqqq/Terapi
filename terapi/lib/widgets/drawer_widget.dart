import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Nama Akaun'),
            accountEmail: Text('Nama Email'),
            currentAccountPicture: const CircleAvatar(
              child: FlutterLogo(size: 42.0),
            ),
          ),
          ListTile(
            title: Text('One'),
            leading: const Icon(Icons.favorite),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Two'),
            leading: const Icon(Icons.comment),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
