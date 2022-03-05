import 'package:flutter/material.dart';

var img = "http://www.devio.org/img/avatar.png";

// Flutter布局
class Layout extends StatefulWidget {
  @override
  _Layout createState() => _Layout();
}

class _Layout extends State<Layout> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter布局',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter布局"),
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
            decoration: BoxDecoration(color: Colors.orange),
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        img,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      // !!! 图标不是正方形或者宽高超过160都裁剪不成功，待研究 !!!
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Opacity(
                          opacity: 0.8,
                          child: Image.network(
                            img,
                            width: 120,
                            height: 120,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 160,
                  margin: EdgeInsets.all(10),
                  child: PhysicalModel(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                    clipBehavior: Clip.antiAlias, // 抗锯齿
                    child: PageView(
                      children: [
                        _pageViewItem("view1", Colors.red),
                        _pageViewItem("view2", Colors.yellow),
                        _pageViewItem("view3", Colors.orange),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.yellow),
                        child: Text('宽度撑满一行'),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Stack(
            children: [
              Image.network(
                img,
                width: 120,
                height: 120,
              ),
              Positioned(
                  left: 0,
                  bottom: 0,
                  child: Image.network(
                    img,
                    width: 80,
                    height: 80,
                  ))
            ],
          ),
          // 创建一个wrap布局，从左到右进行排列，会自动换行
          Wrap(
            spacing: 4, // 水平间距
            runSpacing: 6, // 垂直间距
            children: [
              _buildChip("flutter"),
              _buildChip("react-native"),
              _buildChip("react"),
              _buildChip("vue"),
              _buildChip("angular"),
            ],
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
    return Column(
      children: [
        Text("List页面"),
        // 拉伸填满高度
        Expanded(
            child: Container(
          decoration: BoxDecoration(color: Colors.red),
          child: Text("拉伸填满高度"),
        ))
      ],
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

  _buildChip(String label) {
    return Chip(
      label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900,
        child: Text(
          label.substring(0, 1),
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
