import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(title: 'TextField的应用', home: FirstPage()));
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextField的应用')),
      body: Center(
        child: CustomTextField(),
      ),
    );
  }
}

//基本实例
class DefaultTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       padding:const EdgeInsets.all(30.0),
       child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,//文本是起始端对齐
          children: <Widget>[
            Text('下面是基本输入框',
            style: TextStyle(fontSize: 15.5,height: 1.2,color: Colors.blue),
            textAlign: TextAlign.left),
            TextField()
          ],
       )
    );
  }
}


//稍微复杂的TextField
class CustomTextField extends StatelessWidget {
  void _textFieldChanged(String str){
     print(str);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      child:TextField(
        keyboardType:TextInputType.number,
        decoration:InputDecoration(
          contentPadding: EdgeInsets.all(3.0),
          icon:Icon(Icons.text_fields),
          labelText:'请输入你的姓名',
          helperText: '请输入您的真实姓名',
        ),
        onChanged: _textFieldChanged,
        autofocus: true,
      )
    );
  }
}



