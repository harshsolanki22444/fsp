import 'package:flutter/material.dart';
import 'package:fsp/HomePage.dart';
import 'package:fsp/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: HomePage()
    );
  }
}

// class LoginPsage extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(70.0),
//         child: Column(
//           children: <Widget>[
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: const InputDecoration(
//                 labelText: 'Password',
//               ),
//               obscureText: true,
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               child: const Text('Login'),
//               onPressed: () async {
//                 String email = emailController.text;
//                 String password = passwordController.text;
//
//                 // Store the data using shared preferences
//                 SharedPreferences prefs = await SharedPreferences.getInstance();
//                 prefs.setString('email', email);
//                 prefs.setString('password', password);
//
//                 print('Email: $email, Password: $password');
//
//                 // Navigate to a new page after login
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => HomePage()),
//                 );
//               },
//             ),
//
//
//             TextButton(
//               child: const Text(
//                 'Forgot password?',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               onPressed: () {
//                 // Navigate to forgot password page
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
//                 );
//               },
//             ),
//             TextButton(
//               child: const Text(
//                 'Create an account',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               onPressed: () {
//                 // Navigate to sign-up page
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SignUpPage()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class SignUpPage extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign Up'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: const InputDecoration(
//                 labelText: 'Password',
//               ),
//               obscureText: true,
//             ),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               child: const Text('Sign Up'),
//               onPressed: () async {
//                 String email = emailController.text;
//                 String password = passwordController.text;
//
//                 // Store the data using shared preferences
//                 SharedPreferences prefs = await SharedPreferences.getInstance();
//                 prefs.setString('email', email);
//                 prefs.setString('password', password);
//
//                 print('Email: $email, Password: $password');
//
//                 // Navigate to a new page after sign-up
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => HomePage()),
//                 );
//               },
//             ),
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class HomePages extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
//
// class Homeui extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePages> {
//   List<String> selectedImages = [];
//
//   void _selectImage() async {
//     final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       setState(() {
//         selectedImages.add(pickedFile.path);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page'),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.yellow,
//               ),
//               child: Text(
//                 'Menu',
//                 style: TextStyle(
//                   color: Colors.black87,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text('Home'),
//               onTap: () {
//                 Navigator.pop(context); // Close the drawer
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('Settings'),
//               onTap: () {
//                 Navigator.pop(context); // Close the drawer
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'Welcome to the Home Page!',
//             style: TextStyle(fontSize: 24),
//           ),
//           SizedBox(height: 16),
//           GestureDetector(
//             onTap: _selectImage,
//             child: Container(
//               width: 80,
//               height: 80,
//               decoration: BoxDecoration(
//                 color: Colors.green,
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(
//                 Icons.add,
//                 color: Colors.white,
//                 size: 40,
//               ),
//             ),
//           ),
//           SizedBox(height: 16),
//           Text(
//             'Selected Images:',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 8),
//           Expanded(
//             child: ListView.builder(
//               itemCount: selectedImages.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: Image.file(
//                     File(selectedImages[index]),
//                     width: 50,
//                     height: 50,
//                     fit: BoxFit.cover,
//                   ),
//                   title: Text('Image ${index + 1}'),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
// class ForgotPasswordPage extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//
//   ForgotPasswordPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Forgot Password'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               child: const Text('Reset Password'),
//               onPressed: () {
//                 // Perform forgot password logic here
//                 String email = emailController.text;
//                 print('Email: $email');
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
