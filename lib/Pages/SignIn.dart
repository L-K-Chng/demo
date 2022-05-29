import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projecttest1/Pages/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Form(
        key: _formKey,
        //TODO: Implement key
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 60,
            ),
            //TODO: Implement fields
            TextFormField(
              validator: (input) {
                if (input != null && input.isEmpty) {
                  return 'Please type in an email.';
                }
              },
              onSaved: (input) => _email = input!,
              decoration: InputDecoration(
                  labelText: ' Email'
              ),
            ),
            TextFormField(
              validator: (input) {
                if (input!.length < 6) {
                  return 'Your password needs to be at least 6 characters long.';
                }
              },
              onSaved: (input) => _password = input!,
              decoration: InputDecoration(
                  labelText: ' Password'
              ),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('Sign in'),
            ),
          ],
        ),
      ),
    );
  }
}
  void signIn() async{
    //TODO Validate fields
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        //TODO Navigate to home
      }catch(e){
        print(e.message);
      }
  }
}


