import 'dart:convert';

import 'package:http/http.dart' as http;


class ApiData {

  Future<dynamic> getMyMainList() async {
    final url = "https://covid19.mathdro.id/api";
    try {
      // the await is for waiting the response and not pass it if there is any delay
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        print("------------------------------------- response -------------------------------------- ");
        print(responseData);
        return responseData;
      }
      else{
        return "no response !!";
      }

    } catch (error) {}
  }

}