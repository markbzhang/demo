import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(title: 'CheckboxListTile的应用', home: FirstPage()));
}


class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkbox的应用')),
      body: Center(
        child: CheckboxDefault(),
      ),
    );
  }
}


class CheckboxDefault extends StatefulWidget {
  final int index;
  final parent;
  const CheckboxDefault([this.parent,this.index = -1]):super();
  @override
  State<StatefulWidget>createState()=>_CheckboxDefault();
}

class _CheckboxDefault extends State{
  bool isChecked = false;
  Color color = _randomColor();
  @override
  Widget build(BuildContext context){
    return Checkbox(
      activeColor: color,
      tristate: false,
      value: isChecked,
      onChanged: (bool bol){
         if(mounted){
           setState(() {
             isChecked = bol;
           });
         }
      },
    );
  }
}


Color _randomColor(){
 var red = Random.secure().nextInt(200);
 var greed = Random.secure().nextInt(100);
 var blue = Random.secure().nextInt(50);
 return Color.fromARGB(255, red, greed, blue);
}