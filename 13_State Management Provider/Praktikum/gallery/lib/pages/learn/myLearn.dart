import 'package:flutter/material.dart';
import 'package:gallery/provider/MyProvider.dart';
import 'package:provider/provider.dart';

class MyLearn extends StatefulWidget {
  const MyLearn({super.key});

  @override
  State<MyLearn> createState() => _MyLearnState();
}

class _MyLearnState extends State<MyLearn> {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProvider>(context);
    return ListView.builder(
      itemCount: prov.listMyLearn.length,
      itemBuilder: (context, index) {
        final item = prov.listMyLearn[index]["item"];
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
