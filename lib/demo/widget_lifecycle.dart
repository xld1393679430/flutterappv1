import 'package:flutter/material.dart';

// flutter页面的生命周期
// StatelessWidget: 只有createElement和build两个生命周期

// StatefulWidget
// 1 初始化时期 createState, initState
// 2 更新时期 didChangeDependencies, build, didUpdateWidget
// 3 销毁期 deactivate, dispose
class WidgetLifeCyclePage extends StatefulWidget {
  // 构建新的StatefulWidget， 会立即调用createState
  @override
  _WidgetLifeCyclePageState createState() => _WidgetLifeCyclePageState();
}

class _WidgetLifeCyclePageState extends State<WidgetLifeCyclePage> {
  int _count = 0;

  //创建widget时调用的除构造方法外的第一个方法 通常会做一些初始化工作 比如监听器的初始化
  @override
  void initState() {
    super.initState();
    print("------生命周期：initState");
  }

  // 当依赖的state改变时调用
  // 第一次构建时 在instance()之后立即调用此方法
  // 如果StatefulWidget依赖于InheritedWidget,当当前的state所依赖的InheritedWidget中的变量改变时会再次调用它
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("------生命周期：didChangeDependencies");
  }

  // 这是一个必须实现的方法 这个生命周期实现要呈现的页面内容
  // 会在didChangeDependencies之后调用
  // 当调用setState后也会再次调用该方法
  @override
  Widget build(BuildContext context) {
    print("------生命周期：build");
    return Scaffold(
      appBar: AppBar(
        title: Text("生命周期"),
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
            Text("查看log 生命周期执行时机"),
            Text("当前Count的值：$_count"),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
              child: Text("点击计数器"),
            )
          ],
        ),
      ),
    );
  }

  // 不常用的生命周期 父组件需要重新绘制会被调用
  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("------生命周期：didUpdateWidget");
    // if(oldWidget.xxx != widget.xxx) {}
  }

  // 很少用到 组件被移除时被调用 在dispose调用之前调用
  @override
  void deactivate() {
    super.deactivate();
    print("------生命周期：deactivate");
  }

  // 常用 组件被销毁时调用 释放资源比如监听器的卸载
  @override
  void dispose() {
    super.dispose();
    print("------生命周期：dispose");
  }
}
