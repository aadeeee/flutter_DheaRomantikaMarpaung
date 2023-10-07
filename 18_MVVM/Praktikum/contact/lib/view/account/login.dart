import 'package:contact/view/main_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  late SharedPreferences loginData;
  late bool newUser;

  @override
  void initState() {
    super.initState();
    validateUser();
  }

  void validateUser() async {
    loginData = await SharedPreferences.getInstance();
    newUser = loginData.getBool('login') ?? true;

    if (newUser == false) {
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const MyMainPage(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                key: const Key('username'),
                controller: _nameController,
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Name",
                  hintText: "Insert Your Name",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name is required';
                  } 
                  return null;
                },
              ),
              TextFormField(
                key: const Key('password'),
                controller: _passwordController,
                cursorColor: Colors.black,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true, // Menyembunyikan kata sandi
                decoration: const InputDecoration(
                  labelText: "Password",
                  hintText: "Insert Your Password",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password is required';
                  } else if (value.length < 8) {
                    return 'Length min 8';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  final isValid = _key.currentState!.validate();
                  String username = _nameController.text;

                  if (isValid) {
                    loginData.setBool('login', false);
                    loginData.setString('username', username);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyMainPage(),
                      ),
                      (route) => false,
                    );
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class MyMainPage extends StatelessWidget {
//   const MyMainPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Main Page'),
//       ),
//       body: const Center(
//         child: Text('Welcome to the Main Page!'),
//       ),
//     );
//   }
// }
