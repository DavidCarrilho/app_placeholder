import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: MediaQuery.of(context).size.height * 0.2),
            const TextField(decoration: InputDecoration(label: Text('Login'))),
            const TextField(decoration: InputDecoration(label: Text('Senha')), obscureText: true),
            const SizedBox(height: 15),
            ElevatedButton(onPressed: () {}, child: const Text('LOGIN'))
          ],
        ),
      ),
    );
  }
}
