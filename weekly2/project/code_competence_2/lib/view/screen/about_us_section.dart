import 'package:code_competence_2/view/screen/card_section.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(children: [
        const Text(
          "About Us",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
        Image.asset(
          "assets/images/bc.png",
          height: 250,
          width: 300,
        ),
        const SizedBox(height: 16.0),
        const CardPage()
      ]),
    );
  }
}
