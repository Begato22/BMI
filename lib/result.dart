import 'package:bmi_app/topic_result_compnant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {Key? key, required this.result, required this.isMale, required this.age})
      : super(key: key);

  //this will make error in constructor line becuse thr final varibale must will be get from our constructor.
  final double result;
  final bool isMale;
  final int age;

  String get resultPhrase {
    String resultText = "";

    if (result >= 30) {
      resultText = "Obese";
    } else if (result > 25 && result < 30) {
      resultText = "Overweight";
    } else if (result >= 18.5 && result <= 24.9) {
      resultText = "Normal";
    } else {
      resultText = "Thin";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TopicResultCompnnt(
                  topicHeaderText: "Gander",
                  topicValueText: isMale ? "Male" : "Female"),
              TopicResultCompnnt(
                  topicHeaderText: "Age", topicValueText: "$age"),
              TopicResultCompnnt(
                  topicHeaderText: "Result",
                  topicValueText: result.toStringAsFixed(2)),
              TopicResultCompnnt(
                  topicHeaderText: "Healthiness", topicValueText: resultPhrase),
            ],
          ),
        ),
      ),
    );
  }
}
