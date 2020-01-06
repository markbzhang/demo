import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "导航演示-导航父子页面的跳转返回",
    home: new FirstScreen(),
  ));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('导航演示'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('查看商品详情页'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => new SecondScreen()
                  )
              );
            },
          ),
        ));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('goods detail page')),
      body: Center(
        child: RaisedButton(
          child: Text('返回'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
