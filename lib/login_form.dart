import 'package:flutter/material.dart';
import 'package:form/LoginFormPojo.dart';

class LoginForm extends StatefulWidget {
LoginFormPojo loginFormPojo;

  LoginForm(this.loginFormPojo, {Key? key}) : super(key: key) ;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name : ${widget.loginFormPojo.name}"),
              Text("Email : ${widget.loginFormPojo.email}"),
              Text("Country : ${widget.loginFormPojo.country}"),
              Text("Language : ${widget.loginFormPojo.language}"),
              Text("Gender : ${widget.loginFormPojo.gender}")
            ],
          ),
        ),
      ),
    );
  }
}
