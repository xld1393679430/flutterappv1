import 'package:flutter/material.dart';

// flutter应用的生命周期
// 通过绑定WidgetsBindingObserver观察器监听应用的生命周期
class AppLifecyclePage extends StatefulWidget {
  @override
  _AppLifecyclePageState createState() => _AppLifecyclePageState();
}

class _AppLifecyclePageState extends State<AppLifecyclePage>
    with WidgetsBindingObserver {
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

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // super.didChangeAppLifecycleState(state);
    print("State = $state");
    if (state == AppLifecycleState.paused) {
      print("Ap进入后台");
    } else if (state == AppLifecycleState.resumed) {
      print("App进入后台");
    } else if (state == AppLifecycleState.inactive) {
      print("App进入非激活状态, 比如被电话打断");
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this); // 在super之前调用
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // 在super之前调用
    super.dispose();
  }
}
