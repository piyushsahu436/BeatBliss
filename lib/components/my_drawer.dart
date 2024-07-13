import 'package:flutter/material.dart';
import 'package:musicplayer/pages/setting_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.music_note,
                size: 40,
                color: Theme.of(context).colorScheme.inversePrimary,
              )
            ),

          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'H O M E',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
              leading: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.primary,
              ),
            title: Text(
              'Settings',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context , MaterialPageRoute(builder:(context) => SettingsPage(),),
              );
            }
          ),
        ],
      ),

    );
  }
}
