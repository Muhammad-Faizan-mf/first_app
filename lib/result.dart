import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  late final int resultScore;
  late VoidCallback? resetHandler;
  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are owesome.${resultScore}';
    } else if (resultScore <= 12) {
      resultText = 'pretty likeliable.';
    } else if (resultScore <= 16) {
      resultText = 'you are strange.';
    } else {
      resultText = 'You are so bad.';
    }
    return resultText;
  }

  Result(this.resultScore, this.resetHandler);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        FlatButton(
          child: Text('Reset Quiz!'),
          onPressed: resetHandler,
          textColor: Colors.blue,
          
        ),
      ],
    );
  }
}
