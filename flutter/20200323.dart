import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(title: 'FlatButton的应用', home: FirstPage()));
}


class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FlatButton的应用')),
      body: Center(
        child: FlatButtonIconDefault(),
      ),
    );
  }
}


class FlatButtonDefault extends StatelessWidget {
  final bool isDisabled;
  const FlatButtonDefault([this.isDisabled = true]):assert(isDisabled != null),super();

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: const Text('默认按钮',semanticsLabel: 'FLAT BUTTON1'),
      onPressed: isDisabled?(){}:null
    );
  }
}


class FlatButtonIconDefault extends StatelessWidget {
  final bool isDisabled;
  final IconData icon;

  const FlatButtonIconDefault([this.isDisabled = true,this.icon = Icons.add_circle]):super();

  Color _randomColor(){
    var red =  Random.secure().nextInt(255);
    var greed = Random.secure().nextInt(255);
    var blue = Random.secure().nextInt(255);
    return Color.fromARGB(255, red, greed, blue);
  }


  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
        onPressed: isDisabled?(){
          //点击了Flat button
        }:null,
        icon: Icon(icon,size:25.0,color: _randomColor()),
        label: Text('默认按钮',semanticsLabel: 'FLAT BUTTON 2')
    );
  }
}


