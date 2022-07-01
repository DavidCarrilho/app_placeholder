// import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';

class LoginController {
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  String? _login;
  setLogin(String value) => _login = value;
  String? _pass;
  setPass(String value) => _pass = value;

  Future<bool> auth() async {
    inLoader.value = true;
    // developer.log('Login: $_login, Password: $_pass');
    await Future.delayed(const Duration(seconds: 3));
    inLoader.value = false;
    return (_login == 'admin' && _pass == '123');
  }
}
