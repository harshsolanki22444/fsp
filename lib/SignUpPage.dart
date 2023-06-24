import 'package:flutter/material.dart';
import 'package:fsp/HomePage.dart';
import 'package:fsp/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController emailController  = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController fullnameController = new TextEditingController();

  // Method to save user credentials
  Future<bool> signUp(String username, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('password', password);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child:  Column(
            children: <Widget>[
              TextFormField(
                controller: fullnameController,
                validator: (val){
                  print(val);
                  if(val == null || val == ''){
                    return 'Please enter fullname';
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                ),
              ),
              TextFormField(
                controller: emailController,
                validator: (val){
                  if(val == null || val == ''){
                    return 'Please enter email';
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextFormField(
                controller: passwordController,
                validator: (val){
                  if(val == null || val == ''){
                    return 'Please enter password';
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                child: const Text('Sign Up'),
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    signUp(emailController.text, passwordController.text);
                  }
                },
              ),
              TextButton(
                child: const Text(
                  'Have an account?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  // Navigate to sign-up page
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()), (route) => false
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
