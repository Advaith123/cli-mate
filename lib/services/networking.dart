import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    print(url);
    http.Response response = await http.get(url);
    // get returns future
    if (response.statusCode == 200) {
      String data = response.body;
      // print(data);
      // print(data);
      //temp and shiz
      return jsonDecode(data);
    } else {
      print("Error");
      print(response.statusCode);
    }
  }
}
