import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/http_exception.dart';
import 'package:shop_app/providers/auth.dart';
import 'package:shop_app/screens/menu.dart';

import '../widgets/auth_background.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  var _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey();

  final Map<String, String> _authData = {
    'email': '',
    'password': '',
    'username': ''
  };
  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('An Error Occured :('),
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text('Try Again!'),
                )
              ],
            ));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if (isLogin) {
        await Provider.of<Auth>(context, listen: false)
            .signin(_authData['email']!, _authData['password']!);
        Navigator.of(context).pushNamed(Menu.routeName);
      } else {
        await Provider.of<Auth>(context, listen: false).signup(
            _authData['email']!,
            _authData['password']!,
            _authData['username']!);
      }
    } on HttpException catch (error) {
      var errorMessage = 'Authentication Failed!';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'Email already exists.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'Invalid email.';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'Weak password.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Email not found.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password';
      }

      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage =
          'Could not authenticate you. Please try again later!';
      _showErrorDialog(errorMessage);
    }
    setState(() {
      _isLoading = false;
    });
  }

  Container authTextField(String textField) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: TextFormField(
        key: ValueKey(textField),
        style: const TextStyle(color: Colors.white),
        keyboardType: textField == "Email"
            ? TextInputType.emailAddress
            : textField == "Username"
                ? TextInputType.name
                : TextInputType.text,
        decoration: InputDecoration(
            fillColor: Colors.black54,
            prefixIcon: Icon(
              textField == "Username"
                  ? Icons.person
                  : textField == "Email"
                      ? Icons.email
                      : Icons.lock,
              color: Colors.grey,
            ),
            hintStyle: const TextStyle(color: Colors.grey),
            labelStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide.none,
            ),
            hintText: textField,
            labelText: textField,
            filled: true),
        obscureText: textField == "Password" ? true : false,
        validator: (value) {
          if (textField == "Email") {
            if (value!.isEmpty || !value.contains('@')) {
              return 'Invalid email!';
            }
            return null;
          } else if (textField == "Username") {
            if (value!.isEmpty || value.length < 5) {
              return 'Username is too short!';
            }
            return null;
          } else {
            if (value!.isEmpty || value.length < 5) {
              return 'Username is too short!';
            }
            return null;
          }
        },
        onSaved: (value) {
          if (textField == "Email") {
            _authData['email'] = value!;
          }
          if (textField == "Username") {
            _authData['username'] = value!;
          }
          if (textField == "Password") {
            _authData['password'] = value!;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Stack(
        children: [
          authBackground(),
          Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.all(40),
                          margin: EdgeInsets.only(top: 50, bottom: 0),
                          width: double.infinity,
                          child: Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.high,
                          )),
                      Text(
                        isLogin ? "Welcome Back!" : "Sign Up Now!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            letterSpacing: 2),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                          isLogin
                              ? " Sign in to your account"
                              : "Become a part of QueenTech's Familia!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              letterSpacing: 0.5)),
                      const SizedBox(
                        height: 20,
                      ),
                      authTextField("Email"),
                      if (!isLogin) authTextField("Username"),
                      authTextField("Password"),
                      const SizedBox(height: 10),
                      if (isLogin)
                        InkWell(
                          onTap: () {},
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            _submit();
                          },
                          child: Text(
                            isLogin ? "LOGIN" : "SIGN UP",
                            style: TextStyle(fontSize: 16),
                          ),
                          style: TextButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            isLogin ? "Don't have an account? Sign Up" : "",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
