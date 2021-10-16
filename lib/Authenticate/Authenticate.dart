import 'package:chat_app/Screens/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';

class Authenticate extends StatelessWidget {
 // const Authenticate({ Key? key }) : super(key: key);

final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    
      if(_auth.currentUser != null)
      {
        return  HomeScreen();
      }
      else
      {
         return  LoginScreen();
      }
      
    
  }
}