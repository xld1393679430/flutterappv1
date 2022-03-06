import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// 打开第三方应用
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
              onPressed: () => _handleLaunchApp(),
              child: Text("打开浏览器"),
            ),
            RaisedButton(
              onPressed: () => _handleLaunchMap(),
              child: Text("打开地图"),
            ),
          ],
        ),
      ),
    );
  }

  _handleLaunchApp() async {
    String url = "http://www.baidu.com";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "can not launch $url";
    }
  }

  _handleLaunchMap() async {
    // android
    String url1 = "geo:52.32.4.917";
    if (await canLaunch(url1)) {
      await launch(url1);
    } else {
      String url2 = "http://maps.apple.com/?ll=52.32.4.917";
      if (await canLaunch(url2)) {
        await launch(url2);
      } else {
        throw "can not launch $url1";
      }
    }
  }
}
