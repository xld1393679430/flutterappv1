//手势

import 'package:flutter/material.dart';

class GesTurePage extends StatefulWidget {
  @override
  _GesTurePage createState() => _GesTurePage();
}

class _GesTurePage extends State<GesTurePage> {
  String msg = '';
  double moveX = 0, moveY = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("检测用户手势 & 处理点击事件"),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () => _handleTap("点击"),
                    onDoubleTap: () => _handleTap("双击"),
                    onLongPress: () => _handleTap("长按"),
                    onTapCancel: () => _handleTap("点击取消"),
                    onTapUp: (e) => _handleTap("松开"),
                    onTapDown: (e) => _handleTap("按下"),
                    child: Container(
                      padding: EdgeInsets.all(60),
                      decoration: BoxDecoration(color: Colors.yellow),
                      child: Text(
                        "点我",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                  Text(msg)
                ],
              ),
              Positioned(
                left: moveX,
                top: moveY,
                child: GestureDetector(
                  onPanUpdate: (e) => _handleMove(e),
                  child: Container(
                      height: 72,
                      width: 72,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(36))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _handleTap(String s) {
    setState(() {
      msg += "$s | ";
    });
  }

  _handleMove(DragUpdateDetails e) {
    setState(() {
      moveX += e.delta.dx;
      moveY += e.delta.dy;
    });
  }
}
