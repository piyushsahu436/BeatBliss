import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('S E T T I N G S'),
      ),
      body:Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(25),
        child :Column(
          children:[
            Text("Dark Mode"),
            CupertinoSwitch(
              value: Provider.of<ThemeProvider>(context , listen : false).isDarkMode,

              onChanged: (value){
                final provider = Provider.of<ThemeProvider>(context , listen : false);
                provider.toggleTheme();
              },
            )
          ]
        )
      )
    );
  }
}
