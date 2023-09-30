import 'package:flutter/material.dart';

class MyLearn extends StatefulWidget {
  const MyLearn({super.key});

  @override
  State<MyLearn> createState() => _MyLearnState();
}
class _MyLearnState extends State<MyLearn> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> myLearn = [
      {"item": "Learn Flutter"},
      {
        "item": ["Learn ReactJS", "Learn VueJS"]
      },
      {"item": "Learn Tailwind CSS"},
      {"item": "Learn UI/UX"},
      {"item": "Learn Figma"},
      {"item": "Learn Digital Marketing"}
    ];
    return ListView.builder(
      itemCount: myLearn.length,
      itemBuilder: (context, index) {
        final item = myLearn[index]["item"];
        List<Widget> widgets = [];

        if (item is List<String>) {
          for (var subItem in item) {
            widgets.add(
              ListTile(
                title: Text(
                  subItem,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            );
          }
        } else {
          widgets.add(
            ListTile(
              title: Text(
                item.toString(),
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          );
        }
        widgets.add(const Divider(
          thickness: 1,
        ));

        return Column(
          children: widgets,
        );
      },
    );
  }
}