import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TopicResultCompnnt extends StatelessWidget {
  const TopicResultCompnnt(
      {Key? key, required this.topicHeaderText, required this.topicValueText})
      : super(key: key);

  final String topicHeaderText;
  final String topicValueText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "$topicHeaderText: ",
          style: Theme.of(context).textTheme.headline1,
          textAlign: TextAlign.center,
        ),
        Text(
          topicValueText,
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
