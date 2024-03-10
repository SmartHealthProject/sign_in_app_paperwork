import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:application_paperwork/components/my_button.dart';
import 'package:application_paperwork/components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  // sign user up method
  void signUserUp() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    // try creating the user

    // check if password is confirmed
    if (passwordController.text == confirmPasswordController.text) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } else {
      // pop the loading circle
      Navigator.pop(context);
      // show error message passwords do not match
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text('Passwords do not match.'),
              ));
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
              "Welcome!",
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
            // confirm password textfield
            MyTextField(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
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
              text: "Sign Up",
              onTap: signUserUp,
            ),

            const SizedBox(height: 50),
            //or continue with

            //not a member, register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?',
                    style: TextStyle(color: Colors.grey[700])),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text('Login now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold)),
                ),
              ],
            )
          ],
        ));
  }
}
