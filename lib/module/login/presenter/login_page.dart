import '../components/custom_login_button_component.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_text_field_widget.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = LoginController();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 44),
            Column(
              children: [
                CustomTextFieldWidget(
                  label: 'Login',
                  onChanged: (_controller.setLogin),
                ),
                CustomTextFieldWidget(
                  label: 'Senha',
                  onChanged: (_controller.setPass),
                  obscureText: true,
                ),
                const SizedBox(height: 40),
                CustomLoginButtonComponent(loginController: _controller)
              ],
            )
          ],
        ),
      ),
    );
  }
}
