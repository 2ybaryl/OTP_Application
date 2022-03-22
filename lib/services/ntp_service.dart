import 'package:ntp/ntp.dart';

Future<DateTime> checkTime() async {
  DateTime _myTimes;
  DateTime _myTimee;
  DateTime _ntpTime;
  DateTime actual;

  _myTimes = DateTime.now();
  _ntpTime = await NTP.now();
  _myTimee = DateTime.now();

  final int diff = _myTimee.difference(_myTimes).inMilliseconds;
  actual = _ntpTime.subtract((Duration(milliseconds: diff)));
  return actual;
}
