import 'package:flutter/material.dart';

class MyLogoSection extends StatelessWidget {
  const MyLogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 10),
          child: Image.asset(
            "assets/images/logo.png",
            height: 100,
            width: 200,
          ),
        ),
        const Text(
          "Welcome to Wardiere Inc.",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10, bottom: 20),
          child: Text(
            "Wardiere Inc. is a company that operates in various business fields. With a focus on innovation, integrity, and customer service, Wardiere Inc. has become a leader in diverse industries.",
            textAlign: TextAlign.center,
          ),
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Contact us",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 10),
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text:
                      "Need to get in touch with us? Either fill out the form with your inquiry or find the ",
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: "Department email",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: " you'd like to contact below.",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
