import 'package:flutter/material.dart';

class StateFullGroupPage extends StatefulWidget {
  @override
  _StateFullGroupPage createState() => _StateFullGroupPage();
}

class _StateFullGroupPage extends State<StateFullGroupPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatefulWidget与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("StatefulWidget与基础组件"),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.grey),
                activeIcon: Icon(Icons.home, color: Colors.blue),
                title: Text("首页"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list, color: Colors.grey),
                activeIcon: Icon(Icons.list, color: Colors.blue),
                title: Text("列表"),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            child: Text("点我"),
          ),
          body: _currentIndex == 0 ? buildHome() : buildList()),
    );
  }

  buildHome() {
    return RefreshIndicator(
      child: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: [
                Text("Home页面"),
                Image.network(
                  'https://img0.baidu.com/it/u=4200074749,1662716100&fm=253&fmt=auto&app=120&f=JPEG?w=889&h=500',
                  width: 200,
                  height: 300,
                ),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    hintText: "请输入",
                    hintStyle: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  height: 160,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(color: Colors.lightBlueAccent),
                  child: PageView(
                    children: [
                      _pageViewItem("view1", Colors.red),
                      _pageViewItem("view2", Colors.yellow),
                      _pageViewItem("view3", Colors.orange),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      onRefresh: _handleRefresh,
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return null;
  }

  buildList() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text("List页面"),
        ],
      ),
    );
  }

  _pageViewItem(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
