import 'package:flutter/material.dart';
import 'package:gallery/pages/image/alert_dialog.dart';
import 'package:gallery/pages/image/buttom_sheet.dart';
import 'package:gallery/provider/my_provider.dart';
import 'package:provider/provider.dart';

class MyImagePage extends StatefulWidget {
  const MyImagePage({super.key});
  @override
  State<MyImagePage> createState() => _MyImagePageState();
}

class _MyImagePageState extends State<MyImagePage> {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: prov.listImage.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                context: context,
                isDismissible: true,
                builder: (context) => GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return MyAlertPage(img: prov.listImage[index]);
                      },
                    );
                  },
                  child: MyButtomSheetPage(img: prov.listImage[index]),
                ),
              );
            },
            child: Image.asset(
              prov.listImage[index],
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
