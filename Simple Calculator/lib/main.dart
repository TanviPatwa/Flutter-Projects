import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String num = "";
  int resultint=0;
  double resultdouble=0.0;
  Color visible =Colors.black;
  double size=50;
  String op;
  int cnt=0;

  changeText() {
    setState(() {
      if(num.length>=12)
        num="Invalid num.";
      else if(num.length>=10)
        num = num;
      if(cnt>1)
        num="Invalid num.";

    });
  }

  changeResult() {
    setState(() {
      visible=Colors.white;
      if(resultdouble==resultdouble.toInt())
        resultint = resultdouble.toInt();
      print(resultint);
    });
  }

  void _reset(){
    setState(() {
      num="";
      resultdouble=0;
      resultint=0;
      cnt=0;
      visible=Colors.black;
    });
  }
  @override
  Widget build(BuildContext context) {
    List<String> number1 = ['7', '4', '1', '.'];
    List<String> number2 = ['8', '5', '2', '0'];
    List<String> number3 = ['9', '6', '3', '='];
    List<String> operators = ['C', '÷', 'x', '-', '+'];

    // TextEditingController num= TextEditingController();
    double operand1;
    double operand2;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                "$num",
                style: TextStyle(color: Colors.white, fontSize: size),
                textAlign: TextAlign.right,
              ),
              resultint!=0?Text("$resultint",style: TextStyle(color: visible, fontSize: 45,decorationThickness: 2),textAlign: TextAlign.right,):Text("$resultdouble",style: TextStyle(color: visible, fontSize: 45,decorationThickness: 2),textAlign: TextAlign.right,),
              FlatButton(),
              Divider(color: Colors.grey, height: 30.0,),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Container(
                      color: Colors.grey,
                      child: Center(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  for ( var i in number1 ) Expanded(
                                    child: FlatButton(
                                      onPressed: () {
                                        num = num + i;
                                        changeText();
                                      },
                                      child: i != '.'
                                          ? Text(i, style: TextStyle(
                                          color: Colors.white, fontSize: 30))
                                          : Text(i, style: TextStyle(fontSize: 30)),
                                    ),),
                                ],),
                            ),
                          Expanded(
                            child:Column(
                              children: [for ( var i in number2 ) Expanded(
                                  child: FlatButton(onPressed: () {
                                    num = num + i;
                                    changeText();
                                  },
                                    child: Text(i, style: TextStyle(
                                        color: Colors.white, fontSize: 30),),)),
                              ],),),
                          Expanded(
                            child:Column(
                              children: [for ( var i in number3 ) Expanded(
                                child: FlatButton(onPressed: () {
                                  if (i == '='){
                                    var arr = num.split(op);
                                    operand1 =double.parse(arr[0]);
                                    operand2=double.parse(arr[1]);
                                    resultdouble = calculator(operand1,operand2,op);
                                    changeResult();
                                  }
                                  else{
                                    num = num + i;
                                    changeText();
                                  }
                                },
                                  child: i != '=' ? Text(i, style: TextStyle(
                                      color: Colors.white, fontSize: 30)) : Text(
                                      i, style: TextStyle(fontSize: 30)),),
                              ),
                              ],),),
                          Expanded(
                            child:Column(
                              children: [
                                for ( var i in operators ) Expanded(
                                  child: FlatButton(color: Colors.deepOrange,onPressed: () {
                                    if(i=='C')
                                      _reset();
                                    else {
                                      op=i;
                                      cnt=cnt+1;
                                      num=num+i;
                                      changeText();
                                    }
                                  },
                                    child: Text(
                                      i, style: TextStyle(color: Colors.white,fontSize: 30),),),
                                ),
                              ],
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

double calculator(operand1,operand2,op){
  switch(op)
  {
    case '+': return operand1+operand2;
    case '÷': return operand1/operand2;
    case 'x': return operand1*operand2;
    case '-': return operand1-operand2;
  }
}

