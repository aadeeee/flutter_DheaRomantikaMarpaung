import 'package:flutter/material.dart';
import 'package:gallery/pages/image/alert_dialog.dart';
import 'package:gallery/pages/image/buttom_sheet.dart';
class MyImagePage extends StatefulWidget {
  const MyImagePage({super.key});
  @override
  State<MyImagePage> createState() => _MyImagePageState();
}

class _MyImagePageState extends State<MyImagePage> {
   final List<String> images = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpg',
    'assets/images/img3.jpg',
    'assets/images/img4.jpg',
    'assets/images/img5.jpg',
    'assets/images/img6.jpg',
    'assets/images/img7.jpg',
    'assets/images/img8.jpg',
    'assets/images/img9.jpg',
    'assets/images/img10.jpg',
    'assets/images/img11.jpg',
    'assets/images/img12.jpg',
    'assets/images/img13.jpg',
    'assets/images/img14.jpg',
    'assets/images/img15.jpg',
    'assets/images/img16.jpg',
    'assets/images/img17.jpg',
    'assets/images/img18.jpg',
    'assets/images/img19.jpg',
    'assets/images/img20.jpg',
   
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: images.length,
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
                        return MyAlertPage(img: images[index]);
                      },
                    );
                  },
                  child: MyButtomSheetPage(img: images[index]),
                ),
              );
            },
            child: Image.asset(
              images[index],
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
