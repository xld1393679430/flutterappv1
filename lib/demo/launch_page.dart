import 'package:flutter/material.dart';

// 打开第三方应用 (flutter版本过低 url_launcher版本不兼容， 暂时无法使用)
class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("打开第三方应用"),
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
            RaisedButton(
              onPressed: () => _handleLaunch(),
              child: Text("打开浏览器"),
            ),
          ],
        ),
      ),
    );
  }

  _handleLaunch() async {
    print('_handleLaunch - 1');
    String url = "http://www.devio.org/";
  }
}
