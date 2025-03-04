import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:project/Login.dart';
import 'package:project/auth_service.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: _signin(context),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
              const SizedBox(height: 80),
              _username(),
              const SizedBox(height: 20),
              _emailAddress(),
              const SizedBox(height: 20),
              _password(),
              const SizedBox(height: 50),
              _signup(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _username() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
            hintText: 'username',
            prefixIconColor: Colors.blue,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _emailAddress() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            prefixIconColor: Colors.blue,
            hintText: 'user@gmail.com',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _password() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock),
            prefixIconColor: Colors.blue,
            hintText: "Password",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
          ),
        ),
      ],
    );
  }

  Widget _signup(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff0D6EFD),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        minimumSize: const Size(double.infinity, 60),
        elevation: 0,
      ),
      onPressed: () async {
        await AuthService().signup(
          email: _emailController.text,
          password: _passwordController.text,
          context: context,
        );
      },
      child: const Text("Sign Up"),
    );
  }

  Widget _signin(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            const TextSpan(
              text: "Already Have Account? ",
              style: TextStyle(
                color: Color(0xff6A6A6A),
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: "Log In",
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
              recognizer:
                  TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
            ),
          ],
        ),
      ),
    );
  }
}
