import 'package:api_key/models/open_ai.dart';
import 'package:flutter/material.dart';

class MyRecomendationScreen extends StatelessWidget {
  const MyRecomendationScreen({super.key, required this.getResponseData});

  final Data getResponseData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
        backgroundColor: Colors.blue,
      ),
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, top: 25),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Phone Recommendation",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: getResponseData.choices.isNotEmpty
              ? Text(
                  getResponseData.choices[0].text,
                  textAlign: TextAlign.justify,
                )
              : const Text("No recommendation available"),
        )
      ]),
    );
  }
}
