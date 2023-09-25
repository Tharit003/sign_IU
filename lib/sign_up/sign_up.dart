import 'package:flutter/material.dart';
import 'package:halo/component/myiconbutton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halo/component/mytextbutton.dart';
import 'package:halo/component/mytextfiled.dart';
import 'package:halo/component/mybutton.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});
  final fullnamelController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  createUserWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);

      if (e.code == 'invalid-login-credentials') {
        print('No user found for that email.');
      } else if (e.code == 'test') {
        print('Wrong password provided for that user.');
      }

    }
  }

  void SignUpUser() async {
    if (emailController.text != "" && passwordController.text != "") {
      print('it s ok');
    }else{
      print('Please input your email ad password');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 216, 247, 235),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Form(
          child: Column(
            children: [
              const Spacer(),
              Text(
                "Let start!!!\nPlease putting your name, email, password",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              

              const SizedBox(height: 20),
              mytextfiled(
                controller: fullnamelController,
                hintText: 'Enter your name', 
                labelText: 'Fullname', 
                obcureText: false),

              const SizedBox(height: 20),
              mytextfiled(
                controller: emailController,
                hintText: 'Enter your email', 
                labelText: 'Email', 
                obcureText: false),

              const SizedBox(height: 20),
              mytextfiled(
                controller: passwordController,
                hintText: 'Enter your password', 
                labelText: 'Password', 
                obcureText: true), 


                const SizedBox(height: 10,),
                MyButton(onTap: createUserWithEmailAndPassword, hinText: 'sign up'),
                const SizedBox(height: 10,),
                
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                        Expanded(child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),
                       Expanded(child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 5,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyIconButton(imagePath: "lib/assets/image/A.icon.png"),
                    SizedBox(width: 20,),
                    MyIconButton(imagePath: "lib/assets/image/F.icon.png"),

                  ],
                ),

                const SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Already a member?', style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.displaySmall,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),),
                    const MyTextButton(lableText: 'Login now!', pageRoute: 'login',),
                  ],
                ),
              ),
              const Spacer(),

                
            ],
          ),
        ),
      ),
    );
  }
}
