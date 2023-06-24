import 'package:flutter/material.dart';
import 'package:fsp/HomePage.dart';
import 'package:fsp/SignUpPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  var _formKey = GlobalKey<FormState>();

  static Future<bool> login(String username, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? savedUsername = prefs.getString('username');
    final String? savedPassword = prefs.getString('password');

    // Check if stored credentials match the input
    return (savedUsername == username && savedPassword == password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (val){
                  print(val);
                  if(val == null || val == ''){
                    return 'Please enter email';
                  }
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                validator: (val){
                  print(val);
                  if(val == null || val == ''){
                    return 'Please enter password';
                  }
                },
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: const Text('Login'),
                onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    if(await login(emailController.text, passwordController.text)){
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()), (route) => false
                      );
                    }
                    else{

                    }
                  }
                },
              ),

              TextButton(
                child: const Text(
                  'Create an account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  // Navigate to sign-up page
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()), (route) => false
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
