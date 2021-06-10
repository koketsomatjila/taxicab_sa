import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Calculator extends StatefulWidget {
  Calculator({Key key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  TextEditingController fareController = TextEditingController();
  TextEditingController passengerController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  double firstValue = 0;
  double secondValue = 0;
  double thirdValue = 0;

  double amountDue = 0;
  double change = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.orange,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.orange),
        backgroundColor: Colors.white.withOpacity(0.8),
        title: Text(
          'Taxi Cab SA',
          textAlign: TextAlign.center,
          style: GoogleFonts.aclonica(color: Colors.orange, fontSize: 25),
        ),
      ),
      body: Stack(
        children: [
          Image.asset('images/taxi1.jpg',
              fit: BoxFit.fitHeight,
              height: double.infinity,
              width: double.infinity,
              color: Colors.amber[200].withOpacity(0.8),
              colorBlendMode: BlendMode.srcOver),
          Container(
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'Taxi Fare Calculator',
                      style: GoogleFonts.aclonica(
                        fontSize: 30,
                        color: Colors.orange[700],
                        shadows: [
                          Shadow(
                            offset: Offset(-2.0, -1.0),
                            blurRadius: 2.0,
                            color: Colors.black,
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 8, 0),
                child: Text(
                  "Taxi Fare Amount:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        offset: Offset(-1.0, -1.0),
                        blurRadius: 2.0,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 150, 0),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TextField(
                        keyboardType: TextInputType.number,
                        controller: fareController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "R",
                        ),
                        onChanged: (value) {
                          if (value.isEmpty) {
                            setState(() => firstValue = 0);
                          } else {
                            setState(() {
                              firstValue = double.parse(value);
                            });
                          }
                        }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 28, 8, 0),
                child: Text(
                  "Number of Passengers:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        offset: Offset(-1.0, -1.0),
                        blurRadius: 2.0,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 150, 0),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TextField(
                        keyboardType: TextInputType.number,
                        controller: passengerController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          if (value.isEmpty) {
                            setState(() => secondValue = 0);
                          } else {
                            setState(() {
                              secondValue = double.parse(value);
                            });
                          }
                        }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 28, 8, 0),
                child: Text(
                  "Amount Given by Passengers:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        offset: Offset(-1.0, -1.0),
                        blurRadius: 2.0,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 150, 0),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: amountController,
                      onChanged: (value) {
                        if (value.isEmpty) {
                          setState(() => thirdValue = 0);
                        } else {
                          setState(() {
                            thirdValue = double.parse(value);
                          });
                        }
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "R",
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 40,
                color: Colors.transparent,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Amount Due:\b\b\b",
                        style: GoogleFonts.aclonica(
                          color: Colors.black,
                          fontSize: 20,
                          shadows: [
                            Shadow(
                              offset: Offset(-1.0, -1.0),
                              blurRadius: 2.0,
                              color: Colors.black45,
                            ),
                          ],
                        ),
                      ),
                      TextSpan(
                        text: 'R  ${firstValue * secondValue}',
                        style: GoogleFonts.aclonica(
                            color: Colors.black, fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),

              Divider(
                height: 10,
                color: Colors.transparent,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Change:\b\b\b",
                        style: GoogleFonts.aclonica(
                          color: Colors.black,
                          fontSize: 20,
                          shadows: [
                            Shadow(
                              offset: Offset(-1.0, -1.0),
                              blurRadius: 2.0,
                              color: Colors.black45,
                            ),
                          ],
                        ),
                      ),
                      TextSpan(
                        text: "R  ${thirdValue - (firstValue * secondValue)}",
                        style: GoogleFonts.aclonica(
                            color: Colors.black, fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
              //calculate button
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(8, 28, 150, 20),
              //   child: MaterialButton(
              //     height: 50,
              //     elevation: 5,
              //     child: Text(
              //       'Calculate',
              //       style: TextStyle(fontSize: 25),
              //     ),
              //     color: Colors.red,
              //     textColor: Colors.white,
              //     onPressed: () async {
              //       amountDue = firstValue * secondValue;
              //       change = thirdValue - (firstValue * secondValue);
              //     },
              //   ),
              // ),
            ]),
          ),
        ],
      ),
    );
  }

  // void calculate() {
  //   // if (fareController.text.trim().isNotEmpty &&
  //   //     passengerController.text.trim().isNotEmpty &&
  //   //     amountController.text.trim().isNotEmpty) {
  //   final firstValue = double.parse(fareController.text);
  //   final secondValue = double.parse(passengerController.text);
  //   final thirdValue = double.parse(amountController.text);

  //   amountDue = (firstValue * secondValue).toString();

  //   // _change = amountDue - thirdValue.toString();
  // }
}
// if (fareController.text.trim().isNotEmpty &&
//         passengerController.text.trim().isNotEmpty &&
//         amountController.text.trim().isNotEmpty) {
//       final firstValue = double.parse(fareController.text);
//       final secondValue = double.parse(passengerController.text);
//       // final thirdValue = double.parse(amountController.text);

//       amountDue = (firstValue * secondValue).toString();

//       // _change = amountDue - thirdValue.toString();
