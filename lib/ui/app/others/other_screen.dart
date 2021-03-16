import 'package:flutter/material.dart';

class OtherScreen extends StatefulWidget {
  @override
  _OtherScreenState createState() => _OtherScreenState();
}

class _OtherScreenState extends State<OtherScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Text("others"),
      ),
    );
  }
}
