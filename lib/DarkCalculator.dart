import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class DarkCalculator extends StatefulWidget {
  const DarkCalculator({ Key? key }) : super(key: key);

  @override
  _DarkCalculatorState createState() => _DarkCalculatorState();
}

class _DarkCalculatorState extends State<DarkCalculator> {

  var result = "";

  Widget btn(number){
  return ElevatedButton(
      onPressed: (){
        setState(() {
          result = result + number;
        });
      }, 
      style: ElevatedButton.styleFrom(
        // minimumSize: Size(50, 40),
        // primary: Colors.teal,
        primary: Colors.orange[400],
        onPrimary: Colors.black,
        onSurface: Colors.red ,
        // shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),	
        // shadowColor: Colors.red,
        // elevation: 5,
        side: BorderSide(color: Colors.black, width: 5),
        shape: CircleBorder(),
        padding: EdgeInsets.only(top: 23, bottom: 23),  

      ),
      child: Text(number,
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700 
        ),
      )
    );
}

  dynamic output(){
    Parser pars = Parser();
    Expression exp = pars.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    }); 
  }

  clear(){
    setState(() {
      result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(title: Text("Calculator"),backgroundColor: Colors.grey[600]),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff232c52), Color(0xff502352)]
            )
          ),
          child: Container(
            margin: EdgeInsets.only( bottom: 20),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(result,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                    ),
                    ),
                  ),
                ),
                width: MediaQuery.of(context).size.width*0.94,
                height: MediaQuery.of(context).size.height*0.14,
                decoration: BoxDecoration(
                color: Color(0xff3e4b80),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                    width: 4,
                    color: Colors.black
                  )
                ),
              ),
              Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        btn("1"),
                        btn("2"),
                        btn("3"),
                        btn("+"),
                      ],
                    ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    btn("4"),
                    btn("5"),
                    btn("6"),
                    btn("-"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    btn("7"),
                    btn("8"),
                    btn("9"),
                    btn("*"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    btn("0"),
                    btn("."),
                    ElevatedButton(
                      onPressed: clear, 
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        onPrimary: Colors.black,        
                        shape: CircleBorder(),
                        padding: EdgeInsets.only(top: 18, bottom: 18),  
                        side: BorderSide(color: Colors.black, width: 5),
                      ),
                      child: Text("AC",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        )
                      )
                    ),
                    btn("/"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.92,
                      margin: EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                      onPressed: output,
                      style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              onPrimary: Colors.white,
                              padding: EdgeInsets.only(top: 8, bottom: 8),
                              side: BorderSide(color: Colors.red, width: 3),   
                              shape: StadiumBorder(),	
                              // shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                              // shadowColor: Colors.orange,
                              // elevation: 2,
                            ),
                      child: Text("=",
                      style: TextStyle(
                        fontSize: 40,
                      ),
                      )
                      ),
                    )
                  ],
                ),
            ],
        ),
          ),
        )
        ),
    );
  }
}

