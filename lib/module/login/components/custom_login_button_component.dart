import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import '../controllers/login_controller.dart';

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
          ? const PrimaryButton(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
              ),
            )
          : PrimaryButton(
              loginController: loginController,
              child: const Text('LOGIN'),
            ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.loginController,
    this.child,
  }) : super(key: key);

  final LoginController? loginController;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          loginController!.auth().then(
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
        child: child,
      ),
    );
  }
}
