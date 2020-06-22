import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Calculator App",
      theme: new ThemeData(
        primarySwatch: Colors.red,
          brightness: Brightness.dark
      ),
      home:new HomePage(),

    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State createState()=>new HomePageState();

}


class HomePageState extends State<HomePage> {

  int a;
  int b;
  int result;
  String resultText="Result:";

  final TextEditingController t1 = TextEditingController();
  final TextEditingController t2 = TextEditingController();


  int sum(int a,int b){
    return a+b;
  }

  int minus(t1,t2){
    return (t1-t2);
  }

  int multiply(int a, int b){
    return (a*b);
  }

  double divide(int a, int b){
    return (a/b);
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text("Calculator"),
      ),
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
                 resultText,
                  style: TextStyle(
                  fontSize:40.0,
                  color:Colors.white,
                  fontWeight:FontWeight.bold,
                  ),
             ),
              new TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter first number",
                  fillColor: Colors.green,
                ),
                controller: t1,
              ),
              new TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter second number",
                  fillColor: Colors.orange,
                ),
                controller: t2,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    onPressed: (){
                      setState(() {
                        int result = sum(int.tryParse(t1.text),int.tryParse(t2.text));
                        resultText="Result: " + result.toString();
                        print(result);
                      });
                    },
                    child:Text("+"),
                    color: Colors.lightBlue,
                  ),
                  Padding(
                    padding: EdgeInsets.all(25.0),
                  ),
                  MaterialButton(
                    onPressed:(){
                      setState(() {
                        int result = minus(int.tryParse(t1.text),int.tryParse(t2.text));
                        resultText = "Result: " + result.toString();
                      });
                    },
                    child: Text("-"),
                    color: Colors.greenAccent,
                  ),
                ],
              ),
              
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  onPressed: (){
                    setState(() {
                      int result = multiply(int.tryParse(t1.text),int.tryParse(t2.text));
                      resultText="Result: " + result.toString();
                      print(result);
                    });
                  },
                  child:Text("*"),
                  color: Colors.amber,
                ),
                Padding(
                  padding: EdgeInsets.all(25.0),
                ),
                MaterialButton(
                  onPressed:(){
                    setState(() {
                      double result = divide(int.tryParse(t1.text),int.tryParse(t2.text));
                      resultText = "Result: " + result.toString();
                    });
                  },
                  child: Text("/"),
                  color: Colors.limeAccent,
                ),
              ],
            ),
              
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    onPressed: (){
                      setState(() {
                        t1.text="";
                        t2.text="";
                        resultText="Result: ";
                      });
                    },
                    child: Text("Clear"),
                    color: Colors.purpleAccent,
                    minWidth: 230.0,

                  ),
                ],
              ),
          ],
        ),
      ),


    );

  }
}