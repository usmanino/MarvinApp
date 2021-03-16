import 'package:flutter/material.dart';
import 'package:marvin_app/main_screen.dart';
import 'package:marvin_app/providers/home_provider.dart';
import 'package:marvin_app/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: NavigationProvider.initialize()),
      ChangeNotifierProvider.value(value: HomeProvider.initialize()),
    ],
    child: MainScreen(),
  ));
}
