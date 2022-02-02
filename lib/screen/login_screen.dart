import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat_app/screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LOGIN_SCREEN';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;
  
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                onChanged: (newValue) {
                  //! Do some thing with user input
                  email = newValue;
                },
                style:const TextStyle(
                  color: Colors.black
                ),
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    textBaseline: TextBaseline.alphabetic
                  ),
                  hintText: 'Enter yout email',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0))
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0))
                  )
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                onChanged: (newValue){
                  //! Do something with user input
                  password = newValue;
                },
                style:const TextStyle(
                  color: Colors.black
                ),
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    textBaseline: TextBaseline.alphabetic
                  ),
                  hintText: 'Enter yout password',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0))
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0))
                  )
                ),
              ),
             const SizedBox(
                height: 24.0,
              ),
              Padding(
                padding:const EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.lightBlueAccent,
                  borderRadius:const BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {
                      //! implement login functionality
                      setState(() {
                        showSpinner = true;
                      });
                      try{
                        await _auth.signInWithEmailAndPassword(email: email, password: password);
                       
                          Navigator.pushNamed(context, ChatScreen.id);
                          setState(() {
                            showSpinner = false;
                          });
                        
                      }catch (e){
                        print(e);
                      }
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child:const Text(
                      'Login',
                      style: TextStyle(color: Colors.white)
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
