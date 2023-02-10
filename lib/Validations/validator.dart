import 'package:flutter/material.dart';
import 'package:travelpay/Routes/router.dart';


class Validator {
  static bool emailValidation(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static bool passwordValidation(String password) {
    return password.length > 5;
  }

  

  static logoutAction(BuildContext context) {
    // SharedData.setLoggedIn(false);
    // SharedData.setUserId('');
    // SharedData.setIdentifyUserId('');
    // SharedData.setUsername('');
    // SharedData.setManager(false);
   // prefs.remove(Constants.isLoggedInKey);
    
    Navigator.of(context)
        .pushNamedAndRemoveUntil(LoginRoute, (route) => false);
  }
}
