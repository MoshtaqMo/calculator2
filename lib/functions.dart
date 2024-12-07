import 'package:calculator2/bottuns.dart';
import 'package:flutter/material.dart';

mixin functions<T extends StatefulWidget>on State<T>{
  String number1 = '';
  String operato = '';
  String number2 = '';

 void appendValue(String value) {
    if (value != Btn.dot && int.tryParse(value) == null) {
      if (operato.isNotEmpty && number2.isNotEmpty) {
        calculate();
      }
        operato = value;

    } else if (number1.isEmpty || operato.isEmpty) {
      if (value == Btn.dot && number1.contains(Btn.dot)) return;
      if (value == Btn.dot && (number1.isEmpty || number1 == Btn.n0)) {
        value = '0.';
      }
      number1 += value;
    } else if (number2.isEmpty || operato.isNotEmpty) {
      if (value == Btn.dot && number2.contains(Btn.dot)) return;
      if (value == Btn.dot && (number2.isEmpty || number2 == Btn.n0)) {
        value = '0.';
      }
      number2 += value;
    }

    setState(() {});
  }

   void delete() {
    if (number2.isNotEmpty) {
      number2 = number2.substring(0, number2.length - 1);
    } else if (operato.isNotEmpty) {
      operato = '';
    } else if (number1.isNotEmpty) {
      number1 = number1.substring(0, number1.length - 1);
    }
    setState(() {});
  }

   void clearAll() {
    number1 = '';
    number2 = '';
    operato = '';
    setState(() {});
  }
  void convertToPrecentage(){
    if(number1.isNotEmpty&&operato.isNotEmpty&&number2.isNotEmpty){
      calculate();

    }
    if(operato.isNotEmpty){
      return;
    }
    final number=double.parse(number1);
    setState(() {
      number1="${number/100}";
      operato='';
      number2='';
    });

  }


   void calculate(){
    if(number1.isEmpty)return;
    if(number2.isEmpty)return;
    if(operato.isEmpty)return;

   final double num1=double.parse(number1);
   final double num2= double.parse(number2);

    var result=0.0;
    switch(operato){
      case Btn.add:
      result=num1 + num2;
      break;
      case Btn.sub:
      result=num1 - num2;
      break;
      case Btn.divi:
      result=num1 / num2;
      break;
case Btn.mult:
      result=num1 * num2;
      break;
      default:

    }
    setState(() {
      number1="$result";
      if(number1.endsWith(".0")){
        number1=number1.substring(0,number1.length-2);
      }
      operato='';
      number2='';
    });
  }


  void onBtnTap(String value) {
    if (value == Btn.del) {
      delete();
      return;
    }
    if (value == Btn.clr) {
      clearAll();
      return;
    }
   if(value==Btn.per){
    convertToPrecentage();
    return;
   }
   if(value==Btn.cal){
      calculate();
      return;
   }

    appendValue(value);
  }
  Color buttonsColor(value) {
    return [Btn.del, Btn.clr].contains(value)
        ? Colors.blueGrey
        : [Btn.per, Btn.add, Btn.sub, Btn.divi, Btn.mult, Btn.cal]
                .contains(value)
            ? Colors.orange
            : const Color.fromARGB(221, 17, 16, 16);
  }

}


