import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_app/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';
import 'package:otp_app/global/globals.dart' as globals;

class Otpscreen extends StatefulWidget {
  const Otpscreen({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title:
            Text('OTP', style: GoogleFonts.cabin(fontSize: size.width * 0.08)),
        actions: [
          MaterialButton(
            onPressed: () {
              context.read<AuthenticationService>().signOut();
            },
            child: Row(
              children: [
                const Icon(Icons.logout),
                SizedBox(
                  width: size.width * 0.01,
                ),
                Text(
                  'Sign Out',
                  style: GoogleFonts.cabin(fontSize: size.width * 0.06),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.15,
            ),
            Text(
              'Your current OTP',
              style: GoogleFonts.varelaRound(fontSize: size.width * 0.1),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              globals.res.substring(7, 13),
              style: GoogleFonts.spaceMono(fontSize: size.width * 0.07),
            ),
            SizedBox(
              height: size.height * 0.15,
            ),
            // Text(
            //   'This will refresh in',
            //   style: GoogleFonts.varelaRound(fontSize: size.width * 0.06),
            // ),
            SizedBox(
              height: size.height * 0.02,
            ),
            // Text(
            //   '28',
            //   style: GoogleFonts.spaceMono(fontSize: size.width * 0.04),
            // ),
          ],
        ),
      ),
    );
  }
}

Future<Response> makePostReq(
    {required String email, required DateTime delay}) async {
  var s = delay.second;
  String sec = s.toString();
  final url = Uri.parse('http://10.0.2.2:8888/test');
  Response res = await post(url, body: {'ID': email, 'seconds': sec});
  res.body;
  // print(res.statusCode);
  // print(res.body);
  return res;
}
