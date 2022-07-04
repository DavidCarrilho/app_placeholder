import 'package:app_placeholder/services/prefs_service.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.wait([PrefsService.isAuth(), Future.delayed(const Duration(seconds: 2))]).then((value) =>
        value[0]
            ? Navigator.of(context).pushReplacementNamed('/home')
            : Navigator.of(context).pushReplacementNamed('/login'));
    // Future.delayed(const Duration(seconds: 3))
    //     .then((_) => Navigator.of(context).pushReplacementNamed('/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Splash',
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 44),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
