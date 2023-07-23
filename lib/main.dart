import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home:  HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  HomePage({super.key}) ;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //var quote  = 'ยอมรับว่าไม่ใช่คนดี เพราะทุกวันนี้เป็นคนบ้า';
  static const List<String>_quoteList = [
    'เศร้าเป็นช่วงๆ แต่ง่วงเป็นประจำ',
    'อย่าให้เราเมินนะ แม่โทรมาไม่รับก็ทำมาแล้ว',
    'อดข้าวไม่ว่า เสื้อผ้าห้ามซ้ำ',
    'ในวันที่เราแย่ ยังมีเงินในบัญชีที่แย่กว่า',
    'ปกติเป็นคนไม่ถือตัว ส่วนมากถือแต่ของกิน',
  ];
  static const List<MaterialColor> _colorList = [
    Colors.blueGrey,Colors.teal,
  ];
  var _quote = _quoteList[0];
  var _color = _colorList[0];
  void handleClickGo(){
    var rand = Random();
    // String newQuote; //dynamic
    /*var randomIndex = rand.nextInt(_quoteList.length);
    String newQuote = _quoteList[randomIndex];
    while(newQuote == _quote){
      randomIndex = rand.nextInt(_quoteList.length);
      newQuote = _quoteList[randomIndex];
    }*/
    String newQuote;
    do{
      var randomIndex = rand.nextInt(_quoteList.length);
      newQuote = _quoteList[randomIndex];
    }while(newQuote == _quote);
    MaterialColor newColor;
    do{
      var randomIndex = rand.nextInt(_colorList.length);
      newColor = _colorList[randomIndex];
    }while(newColor == _color);

    setState(() {
      _quote = newQuote;
      _color = newColor;
    });
    //final List<Color> colors = <Color>[Colors.teal.shade300,Colors.pink.shade200];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('คำคม/แคปชั่นกวนๆ')),
      floatingActionButton : FloatingActionButton(
        child: Text('Next'),
        onPressed: handleClickGo,
      ),
      body: Center(
        child:  Text(
          _quote,
          style : TextStyle(
            color: _color,
            fontSize: 40,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}