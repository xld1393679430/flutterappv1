import 'package:flutter/material.dart';

class LessGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatelessWidget与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("StatelessWidget与基础组件"),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.yellow),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text(
                "Hello world",
                style: TextStyle(fontSize: 40),
              ),
              Icon(
                Icons.android,
                size: 50,
                color: Colors.red,
              ),
              CloseButton(),
              BackButton(),
              Chip(
                avatar: Icon(Icons.people),
                label: Text("你好呀"),
              ),
              Divider(
                color: Colors.red,
                height: 10,
                indent: 20,
              ),
              Card(
                // 带有圆角阴影边框效果的卡片
                color: Colors.blue,
                elevation: 5,
                margin: EdgeInsets.all(80),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Text("我是卡片的内容"),
                ),
              ),
              AlertDialog(
                title: Text("弹他"),
                content: Text("我是弹窗组件的内容"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
