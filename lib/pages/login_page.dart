import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:application_paperwork/components/my_button.dart';
import 'package:application_paperwork/components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      // wrong email
      if (e.code == 'user-not-found') {
        // show error to user
        wrongEmailMessage();
        // wrong password
      } else if (e.code == 'wrong-password') {
        // show error to user
        wrongPasswordMessage();
      }
    }

    // pop the loading circle
    Navigator.pop(context);
  }

// wrong email message popup
  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Incorrect Email.'),
            ));
  }

// wrong email message popup
  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Incorrect Password.'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            const SizedBox(height: 25),
            //welcome back
            Text(
              "Welcome back!",
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),
            // email textfield
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),

            const SizedBox(height: 10),
            // password textfield
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),

            const SizedBox(height: 10),
            //forgot password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot Password',
                      style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),
            const SizedBox(height: 25),
            //sign in button
            MyButton(
              text: "Sign In",
              onTap: signUserIn,
            ),

            const SizedBox(height: 50),
            //or continue with

            //not a member, register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    'Register now',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
