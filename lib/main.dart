
import 'package:firebase_chat_app/screen/chat_screen.dart';
import 'package:firebase_chat_app/screen/login_screen.dart';
import 'package:firebase_chat_app/screen/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screen/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) =>const WelcomeScreen(),
        RegistrationScreen.id: (context) =>const RegistrationScreen(),
        LoginScreen.id: (context) =>const LoginScreen(),
        ChatScreen.id: (context) =>const ChatScreen()
      },
    );
  }
}