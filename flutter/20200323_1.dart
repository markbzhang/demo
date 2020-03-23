import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(title: 'RaisedButton的应用', home: FirstPage()));
}


class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RaisedButton的应用')),
      body: Center(
        child: RaisedButtonCustom(),
      ),
    );
  }
}

class RaisedButtonCustom extends StatelessWidget {
  final String txt;
  final Color color;
  final ShapeBorder shape;
  final VoidCallback onPressed;

  const RaisedButtonCustom([this.txt = '自定义按钮RaisedButton',this.color = Colors.blueAccent,this.shape,this.onPressed]):super();

  @override
  Widget build(BuildContext context) {
    final _onPressed = onPressed;
    return RaisedButton(
      child:Text(txt,semanticsLabel: 'FLAT BUTTON 2'),
      color:color,
      colorBrightness:Brightness.dark,
      disabledColor:Colors.grey,
      textColor:Colors.grey,
      disabledTextColor:Colors.grey,
      textTheme:ButtonTextTheme.normal,
      splashColor:Colors.deepPurple,
      clipBehavior:Clip.antiAlias,
      padding:EdgeInsets.only(bottom: 5.0,top:5.0,left:30.0,right:30.0),
      shape:(shape is ShapeBorder)
        ? shape:Border.all(
        color: Colors.grey,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      onPressed:(){
        if(_onPressed is VoidCallback)
          {
            _onPressed();
          }
      },
      onHighlightChanged:(isClick){
          print(isClick);
      }
    );
  }
}
