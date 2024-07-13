import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicplayer/models/playlist_provider.dart';
import 'package:musicplayer/pages/home_page.dart';
import 'package:musicplayer/themes/light_mode.dart';
import 'package:musicplayer/themes/theme_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
  ChangeNotifierProvider
  (create:(context) => PlaylistProvider(),
    ),
  ],
  child: MyApp(),
  ),
  );
}
  class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
        theme:Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
