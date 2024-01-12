import 'package:http/http.dart' as http;

fetchdata(String url) async{
  http.Response resp= await http.get(Uri.parse(url));
  return resp.body;
}