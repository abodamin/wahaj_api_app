import 'package:flutter/material.dart';
import 'package:wahaj_api_app/api.dart';
import 'package:wahaj_api_app/erqa_response.dart';

//Main Entry for application
void main() {
  //special function that starts our first Widget
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


final TextEditingController _usernameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final MApi _mApi = MApi();


late String username, password;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // --username
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _usernameController,
                  decoration: InputDecoration(
                      labelText: 'username',
                      border: OutlineInputBorder(),
                      hintText: 'Enter your username',
                      ),
                ),
          ),
          // -- password
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      hintText: 'Enter your Password',
                      ),
                ),
          ),
          //--button
          TextButton(
            child: Text("LOGIN"),
            onPressed: () async {
              //get values from TextFields using controllers.
              username = _usernameController.text;
              password = _passwordController.text;

              print("___Username >>> $username");
              print("___Password >>> $password");


              //1- Call signIn Api.
              //2- Use responce object.
              ErqaResponse signInResponce = await _mApi.signIn(username, password);
              
            }, 
            ),
        ],
      )
    );
  }
}
