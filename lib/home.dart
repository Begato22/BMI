import 'dart:math';

import 'package:bmi_app/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = false;
  int age = 18;
  int weight = 77;
  double height = 170;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Body Mass Index"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              //for Gender
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      m1Expanded(context, "male"),
                      const SizedBox(
                        width: 10,
                      ),
                      m1Expanded(context, "female"),
                    ],
                  ),
                ),
              ),
              //for Heigth
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blueGrey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Height",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              height.toStringAsFixed(1),
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            const Text(
                              " Cm",
                              style: TextStyle(
                                color: Color.fromRGBO(11, 22, 41, 1),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Slider(
                          value: height,
                          divisions: 180,
                          label: height.round().toString(),
                          onChanged: (newValue) => setState(() {
                            height = newValue;
                          }),
                          min: 70,
                          max: 250,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //for Weight & Age
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      m2Expanded(context, "weight"),
                      const SizedBox(
                        width: 10,
                      ),
                      m2Expanded(context, "age"),
                    ],
                  ),
                ),
              ),
              //Calculate Button
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.teal,
                ),
                child: TextButton(
                  onPressed: () {
                    var result = weight / pow(height / 100, 2);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return ResultScreen(
                            result: result, isMale: isMale, age: age);
                      }),
                    );
                  },
                  child: Text(
                    "Calculate",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //for Gender
  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = isMale ? false : true;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: (isMale && type == "male") || (!isMale && type == "female")
                  ? Colors.teal
                  : Colors.blueGrey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                type == "male" ? Icons.male : Icons.female,
                size: 70,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(type == "male" ? "Male" : "Femal",
                  style: Theme.of(context).textTheme.headline2),
            ],
          ),
        ),
      ),
    );
  }

  //for Weight & age
  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(type == "age" ? "Age" : "Weight",
                style: Theme.of(context).textTheme.headline2),
            const SizedBox(
              height: 5,
            ),
            Text(type == "age" ? "$age" : "$weight",
                style: Theme.of(context).textTheme.headline3),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: FloatingActionButton(
                    child: const Icon(Icons.remove),
                    heroTag: type == "age" ? 'age--' : 'weight--',
                    mini: true,
                    onPressed: () {
                      setState(() {
                        type == "age" ? age-- : weight--;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: FloatingActionButton(
                    child: const Icon(Icons.add),
                    heroTag: type == "age" ? 'age++' : 'weight++',
                    mini: true,
                    onPressed: () {
                      setState(() {
                        type == "age" ? age++ : weight++;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
