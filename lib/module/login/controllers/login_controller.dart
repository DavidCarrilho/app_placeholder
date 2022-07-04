import 'package:app_placeholder/services/prefs_service.dart';
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
    if (_login == 'admin' && _pass == '123') {
      PrefsService.save(_login!);
    }
    return false;
  }
}
