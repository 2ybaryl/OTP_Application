import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_app/screens/signup.dart';
import 'package:otp_app/services/auth_service.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool signedin = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: GoogleFonts.cabin(fontSize: size.width * 0.08),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'Welcome Back!!',
              style: GoogleFonts.actor(fontSize: size.width * 0.1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: MaterialButton(
              onPressed: () {
                if (emailController.text == '' ||
                    passwordController.text == '') {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Invalid Email or Password')));
                  return;
                }
                context.read<AuthenticationService>().signIn(
                    email: emailController.text,
                    password: passwordController.text);
              },
              color: Colors.white,
              child: SizedBox(
                height: size.height * 0.06,
                width: size.width * 0.25,
                child: Row(children: [
                  const Icon(
                    Icons.login,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text(
                    'Login',
                    style: GoogleFonts.abel(
                        color: Colors.black, fontSize: size.width * 0.07),
                  )
                ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Text("Don't have an account?",
                  style: GoogleFonts.notoSansAdlamUnjoined(fontSize: 22)),
              Padding(
                padding: const EdgeInsets.all(10),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Signup();
                    }));
                  },
                  color: Colors.white,
                  child: SizedBox(
                    height: size.height * 0.06,
                    width: size.width * 0.25,
                    child: Row(children: [
                      SizedBox(
                        width: size.width * 0.025,
                      ),
                      Text(
                        'Sign Up',
                        style: GoogleFonts.abel(
                            color: Colors.black, fontSize: size.width * 0.07),
                      )
                    ]),
                  ),
                ),
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
