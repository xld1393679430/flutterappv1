import 'package:flutter/material.dart';

import 'demo/app_lifecycle.dart';
import 'demo/gesture_page.dart';
import 'demo/launch_page.dart';
import 'demo/layout.dart';
import 'demo/less_group_page.dart';
import 'demo/plugin_use.dart';
import 'demo/resource_page.dart';
import 'demo/statefull_group_page.dart';
import 'demo/widget_lifecycle.dart';
import 'photoApp/photo_app.dart';

void main() {
  runApp(DynamicTheme());
}

class DynamicTheme extends StatefulWidget {
  @override
  State<DynamicTheme> createState() => _DynamicThemeState();
}

// 动态切换主题
class _DynamicThemeState extends State<DynamicTheme> {
  Brightness _brightness = Brightness.light;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "KingnamMaiyuan", // 全局字体
        brightness: _brightness,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter"),
        ),
        body: Column(
          children: [
            RaisedButton(
              onPressed: () {
                setState(() {
                  _brightness = _brightness == Brightness.light
                      ? Brightness.dark
                      : Brightness.light;
                });
              },
              child: Text(
                "切换主题",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "ChuangKeTieJinGangTi", // 局部字体
                ),
              ),
            ),
            RouterNavigator()
          ],
        ),
      ),
      routes: <String, WidgetBuilder>{
        "lessState": (BuildContext context) => LessGroupPage(),
        "fulState": (BuildContext context) => StateFullGroupPage(),
        "usePlugin": (BuildContext context) => PluginUsePage(),
        "layout": (BuildContext context) => Layout(),
        "gesTure": (BuildContext context) => GesTurePage(),
        "resourcePage": (BuildContext context) => ResourcePage(),
        "launchPage": (BuildContext context) => LaunchPage(),
        "widgetLifeCyclePage": (BuildContext context) => WidgetLifeCyclePage(),
        "appLifecyclePage": (BuildContext context) => AppLifecyclePage(),
        "photoApp": (BuildContext context) => PhotoApp(),
      },
    );
  }
}

class RouterNavigator extends StatefulWidget {
  @override
  _RouterNavigatorState createState() => _RouterNavigatorState();
}

class _RouterNavigatorState extends State<RouterNavigator> {
  bool navTypeByName = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SwitchListTile(
              title: Text("${navTypeByName ? '' : '不'}通过路由名字跳转"),
              value: navTypeByName,
              onChanged: (value) {
                setState(() {
                  navTypeByName = value;
                });
              }),
          _item("无状态Widget", 'lessState', LessGroupPage()),
          _item("有状态Widget", 'fulState', StateFullGroupPage()),
          _item("plugin使用", 'usePlugin', PluginUsePage()),
          _item("布局", 'layout', Layout()),
          _item("手势", 'gesTure', GesTurePage()),
          _item("资源使用", 'resourcePage', ResourcePage()),
          _item("打开第三方应用", 'launchPage', LaunchPage()),
          _item("页面的生命周期", 'widgetLifeCycle', WidgetLifeCyclePage()),
          _item("应用的生命周期", 'appLifecyclePage', AppLifecyclePage()),
          _item("拍照App", 'photoApp', PhotoApp()),
        ],
      ),
    );
  }

  _item(String title, String routeName, page) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (navTypeByName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(
          title,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
