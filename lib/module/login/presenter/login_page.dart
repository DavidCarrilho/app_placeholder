import 'package:app_placeholder/module/login/components/custom_login_button_component.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = LoginController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: MediaQuery.of(context).size.height * 0.2),
            TextField(
              decoration: const InputDecoration(
                label: Text('Login'),
              ),
              onChanged: _controller.setLogin,
            ),
            TextField(
              decoration: const InputDecoration(label: Text('Senha')),
              obscureText: true,
              onChanged: _controller.setPass,
            ),
            const SizedBox(height: 15),
            CustomLoginButtonComponent(
              loginController: _controller,
            )
          ],
        ),
      ),
    );
  }
}
