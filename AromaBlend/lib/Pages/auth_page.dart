import 'package:aroma_blend_app/Pages/login_page.dart';
import 'package:aroma_blend_app/Pages/register_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // intially show the login page
  bool showLoginPage = true;

  void toggleScreens (){
    setState(() {
      showLoginPage = !showLoginPage;
    });

  }


  @override
  Widget build(BuildContext context) {
      if(showLoginPage){
        return LogInPage(showRegisterPage: toggleScreens);

      } else {
        return RegisterPage(showLoginPage: toggleScreens);
      }
    }
}