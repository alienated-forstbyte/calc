import 'dart:collection';

class Solution{
  double evaluate(String expr){
    List<String> tokens = _tokenize(expr);
    Queue<double> numbers = Queue<double>();
    Queue<String> operators = Queue<String>();

    int i = 0;
    while(i < tokens.length){
      String token = tokens[i];

      if(_isNumber(token)){
        numbers.addLast(double.parse(token));
        i++;
      }else if (_isOperator(token)){
        while(operators.isNotEmpty && _precedence(operators.last) >= _precedence(token)){
          _compute(numbers,operators);
        }
        operators.addLast(token);
        i++;
      }
      else{
        throw FormatException("Invalid character in expression: $token");
      }
    }

    while(operators.isNotEmpty){
      _compute(numbers, operators);
    }

    return numbers.single;

    }
  
  bool _isDigit(String ch) => RegExp(r'[0-9]').hasMatch(ch);
  bool _isNumber(String token) => double.tryParse(token) != null;
  bool _isOperator(String ch) => ['+', '-', 'x', '/'].contains(ch);

  int _precedence(String op) {
    if (op == '+' || op == '-') return 1;
    if (op == 'x' || op == '/') return 2;
    return 0;
  }
  
  List<String> _tokenize(String expr) {
    List<String> tokens = [];
    StringBuffer numberBuffer = StringBuffer();

    for(int i = 0 ; i < expr.length ; i++){
      String ch = expr[i];
      if(_isDigit(ch) || ch == '.'){
        numberBuffer.write(ch);
      }else if(_isOperator(ch)){
        if(numberBuffer.isNotEmpty){
          tokens.add(numberBuffer.toString());
          numberBuffer.clear();
        }
        tokens.add(ch);
      }else if(ch == ' '){
        continue;
      }else{
        throw  FormatException("Unsupported character: $ch");
      }
    }

    if(numberBuffer.isNotEmpty){
      tokens.add(numberBuffer.toString());
    }

    return tokens;

  }

  void _compute(Queue<double> numbers, Queue<String> operators) {
    double b = numbers.removeLast();
    double a = numbers.removeLast();
    String op = operators.removeLast();

    double result;
    switch (op) {
      case '+':
        result = a + b;
        break;
      case '-':
        result = a - b;
        break;
      case 'x':
        result = a * b;
        break;
      case '/':
        if (b == 0) throw ArgumentError("Division by zero");
        result = a / b;
        break;
      default:
        throw ArgumentError("Unknown operator: $op");
    }

    numbers.addLast(result);
  }

}