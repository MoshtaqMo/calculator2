import 'package:calculator2/bottuns.dart';
import 'package:calculator2/functions.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with functions<Home>{
  
  @override
  Widget build(BuildContext context) {
    final screenSized = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // output display
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    "$number1$operato$number2".isEmpty
                        ? '0'
                        : "$number1$operato$number2",
                    style: const TextStyle(
                        fontSize: 48, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),

            // button row 1
            Wrap(
              children: [
                ...Btn.buttons.map((value) => SizedBox(
                    width: value == Btn.cal
                        ? screenSized.width / 2
                        : (screenSized.width / 4),
                    height: screenSized.width / 5,
                    child: buildButton(value))),
                // .toList(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton(String value) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Material(
        color: buttonsColor(value),
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(100)),
        child: InkWell(
            onTap: () {
              onBtnTap(value);
            },
            child: Center(
                child: Text(
              value,
              style: const TextStyle(fontSize: 24),
            ))),
      ),
    );
  }

  

}
