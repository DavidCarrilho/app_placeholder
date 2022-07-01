import 'package:app_placeholder/module/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class CustomLoginButtonComponent extends StatelessWidget {
  final LoginController loginController;
  const CustomLoginButtonComponent({
    Key? key,
    required this.loginController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: loginController.inLoader,
      builder: (_, inLoader, __) => inLoader
          ? const CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                loginController.auth().then(
                  (result) {
                    if (result) {
                      developer.log('Sucesso!');
                      Navigator.of(context).pushReplacementNamed('/home');
                    } else {
                      developer.log('Falha!');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Falha ao realizar login!'),
                          duration: Duration(seconds: 5),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                );
              },
              child: const Text('LOGIN'),
            ),
    );
  }
}
