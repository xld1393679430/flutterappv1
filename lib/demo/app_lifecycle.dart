import 'package:flutter/material.dart';

// flutter应用的生命周期
class AppLifecyclePage extends StatefulWidget {
  @override
  _AppLifecyclePageState createState() => _AppLifecyclePageState();
}

class _AppLifecyclePageState extends State<AppLifecyclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter应用的生命周期"),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("flutter应用的生命周期"),
          ],
        ),
      ),
    );
  }
}
