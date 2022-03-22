import 'package:http/http.dart';

Future<Response> makePostReq(
    {required String email, required DateTime delay}) async {
  var s = delay.second;
  String sec = s.toString();
  final url = Uri.parse('http://10.0.2.2:8888/test');
  Response res = await post(url, body: {'ID': email, 'seconds': sec});
  res.body;
  print(res.statusCode);
  print(res.body);
  return res;
}
