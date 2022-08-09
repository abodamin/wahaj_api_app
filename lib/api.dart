import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:wahaj_api_app/erqa_response.dart';


/// API class to call all apis here 
class MApi {

Map<String, String> _myHeader = {
    "Content-type":"application/json",
};

///
///Future is a return type saying that we Promise that will return what is between the brackets <here>.
///
Future<ErqaResponse> signIn(String username, String password) async {
  var _url = Uri.parse("https://erqa.app/api/signIn");

    var _body = {
      "username": username,
      "password": password,
    };

  http.Response _mReponse = await http.post( // actual request
    _url,
    headers: _myHeader,
    body: jsonEncode(_body), //we encode body before sending to BackEnd.
  );

  print("RESPONCE>> ${_mReponse.body}"); // just to show full responce.

  var decodedJson = jsonDecode(_mReponse.body); //now we have the JSON responce, we must decode it first.
  return ErqaResponse.fromJson(decodedJson);  // convert decodedJson to normal object that can be used in Flutter easily. 
  }

}