import '../components/custom_login_button_component.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../../../core/widgets/custom_text_field_widget.dart';
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
            CustomTextFieldWidget(
              label: 'Login',
              onChanged: (_controller.setLogin),
            ),
            CustomTextFieldWidget(
              label: 'Senha',
              onChanged: (_controller.setPass),
              obscureText: true,
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
