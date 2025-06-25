import 'package:flutter/material.dart';
import 'package:flutter_web_try/utils/calc_buttons.dart';
import 'package:flutter_web_try/utils/number_buttons.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState(); 
}

class HomePageState extends State<HomePage>{

var _displayText = '';
  
void onPressed(String val) {
  setState((){
    _displayText +=val;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: const Color.fromARGB(255, 244, 219, 130)
              ),
              child: Text(
                _displayText,
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          Expanded(
            flex: 8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: const Color.fromARGB(20, 20, 20, 20),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(child: NumberButton(val: '7', onPressed: () => onPressed('7'))),
                        Expanded(child: NumberButton(val: '8', onPressed: () => onPressed('8'))),
                        Expanded(child: NumberButton(val: '9', onPressed: () => onPressed('9'))),
                        Expanded(child: CalcButton(val: 'x', onPressed: () => onPressed('x'))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(child: NumberButton(val: '4', onPressed: () => onPressed('4'))),
                        Expanded(child: NumberButton(val: '5', onPressed: () => onPressed('5'))),
                        Expanded(child: NumberButton(val: '6', onPressed: () => onPressed('6'))),
                        Expanded(child: CalcButton(val: '-', onPressed: () => onPressed('-')))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(child: NumberButton(val: '1', onPressed: () => onPressed('1'))),
                        Expanded(child: NumberButton(val: '2', onPressed: () => onPressed('2'))),
                        Expanded(child: NumberButton(val: '3', onPressed: () => onPressed('3'))),
                        Expanded(child: CalcButton(val: '+', onPressed: () => onPressed('+')))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(child: NumberButton(val: '0', onPressed: () => onPressed('0'))),
                        Expanded(child: NumberButton(val: '.', onPressed: () => onPressed('.'))),
                        Expanded(child: CalcButton(val: 'C', onPressed: () {
                          setState(() {
                            _displayText = '';
                          });
                        })),
                        Expanded(child: CalcButton(val: '=', onPressed: () {
                          setState(() {
                            _displayText = _displayText;
                          });
                        })),
                        
                      ],
                    ),
                  ),
                ],
              ),

            ),
          )
        ]
      ),
    );
  }
  
}
