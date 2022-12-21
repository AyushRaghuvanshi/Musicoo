import 'package:flutter/material.dart';
import 'package:musicoo/desgins.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
              CTextField(hinttext: 'First Name'),
              CTextField(hinttext: 'Last Name'),
              CTextField(hinttext: 'Email'),
              CTextField(
                hinttext: 'Password',
                hidden: true,
              ),
              
            ])),
      ),
    );
  }
}
