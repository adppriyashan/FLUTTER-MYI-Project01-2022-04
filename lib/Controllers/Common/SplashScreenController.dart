import 'package:myiproject/Controllers/Auth/AuthController.dart';

class SplashScreenController {
  Future<bool> checkAuth() async {
    return await AuthController().checkAuth();
  }
}
