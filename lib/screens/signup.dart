import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_app/screens/login.dart';
import 'package:otp_app/services/auth_service.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
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
              'Create a new Account for free',
              style: GoogleFonts.actor(fontSize: size.width * 0.1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: emailcontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: passwordcontroller,
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
                if (emailcontroller.text == '' ||
                    passwordcontroller.text == '') {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Invalid Email or Password')));
                  return;
                }
                context.read<AuthenticationService>().signUp(
                    email: emailcontroller.text,
                    password: passwordcontroller.text);
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
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Text('Already a User?',
                  style: GoogleFonts.notoSansAdlamUnjoined(fontSize: 22)),
              Padding(
                padding: const EdgeInsets.all(10),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Login();
                    }));
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
            ]),
          )
        ]),
      ),
    );
  }
}
