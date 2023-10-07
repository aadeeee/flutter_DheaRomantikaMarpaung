// ignore_for_file: avoid_print

import 'package:api/view/view_model/image_view_model.dart';
import 'package:api/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MyImagePage extends StatefulWidget {
  const MyImagePage({Key? key}) : super(key: key);

  @override
  State<MyImagePage> createState() => _MyImagePageState();
}

class _MyImagePageState extends State<MyImagePage> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MyImageProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Generator"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: Consumer<MyImageProvider>(
                  builder: (context, prov, _) {
                    return SvgPicture.network(
                      prov.nama.text.isNotEmpty ? prov.imageUrl : Url.urlImage,
                      placeholderBuilder: (BuildContext context) =>
                          const CircularProgressIndicator(),
                      fit: BoxFit.contain,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: prov.nama,
                  decoration: const InputDecoration(labelText: 'Nama'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    await prov.fetchDataAndClearName();
                  },
                  child: const Text("Generated"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
