import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';
import 'package:marvin_app/ui/router/router.gr.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: ExtendedNavigator.builder(router: AutoRouter()),
      theme: ThemeData.dark().copyWith(
          accentColor: Color(0xffFF4B20),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color(0xff0D0D0D),
          ),
          scaffoldBackgroundColor: Color(0xff111010)),
    );
  }
}
