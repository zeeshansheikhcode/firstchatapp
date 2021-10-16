import 'package:chat_app/Authenticate/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'Authenticate.dart';
 
//  Future<User?> createAccount (String name, String email,String  password)
//  async 
//    {
//       FirebaseAuth  _auth = FirebaseAuth.instance;
//       FirebaseFirestore _firestore = FirebaseFirestore.instance;
//       try
//       {  
//            User? user = (await _auth.createUserWithEmailAndPassword(email: email, password: password)).user;
//            if(user!=null)
//            { 
//              print("Account Created Successful");
//              user.updateProfile(displayName: name);          
//            await 
//            _firestore.collection('users').doc(_auth.currentUser!.uid).set({
//              "name" : name,
//              "email" : email,
//              "status" : "Unavalible",
//              "uid" : _auth.currentUser!.uid,
//            });
//            return user;
//            }
//            else
//            {
//              print("Account Creation failed");
//              return user;
//            }
//       }
//       catch(e)
//       {
//         print(e);
//         return null;
//       }
//  } 

Future<User?> createAccount(String name,String email,String password) async
{    
        FirebaseAuth auth = FirebaseAuth.instance;
        FirebaseFirestore  firestore = FirebaseFirestore.instance;
    try
     {  User? user  = (await auth.signInWithEmailAndPassword(email: email, password: password)).user;
        if(user!=null)
        {
          print('Account Created successfully');
          user.updateProfile(displayName: name);

          await firestore.collection('users').doc(auth.currentUser!.uid).set(
            {
                "name"   : name,
                "email"  : email,
                "status" : "Unavailable",
                 "uid"   : auth.currentUser!.uid,

            });
              return user;
        }
        else
        {
          print('Account creation Failed');
          return user;
        }
       

     }
     catch(e)
     {
        print(e);
        return null;

     }

}
// Future<User?> logIn(String email,String password) async
// {
//      FirebaseFirestore  _firestore  = FirebaseFirestore.instance;
//      FirebaseAuth _auth = FirebaseAuth.instance;
//       try
//       {  User? user = (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
//          if(user!=null)
//          {
//            print('Login Successful');
//            _firestore
//              .collection('user')
//              .doc(_auth.currentUser!.uid)
//              .get()
//              .then((value) => user.updateProfile(displayName: value['name']));
//              return user;
//          }
//          else
//          {
//            print('Login Failde');
//            return user;
//          }
         
//       }
//       catch(e)
//       {
//         print(e);
//         return null;
//       }
// }
Future<User?> logIn(String email,String password) async
{  FirebaseFirestore firestore = FirebaseFirestore.instance;
   FirebaseAuth auth = FirebaseAuth.instance;
   try
   { User? user = (await auth.signInWithEmailAndPassword(email: email, password: password)).user;
     
     
     if(user!=null)
     { 
       print('Login Successful');
       await 
       firestore
      .collection('users')
      .doc(auth.currentUser!.uid)
      .get()
      .then((value) => user.updateProfile(displayName: value['name']));
       return user;
     }
     else
     {
       print('Login Feiled');
       return user;
     }
    
   }
   catch(e)
   {
     print(e);
     return null;
   }

}

// Future logOut (BuildContext context) async
// {
//    FirebaseAuth _auth = FirebaseAuth.instance;
//    try
//    {
//       await _auth.signOut().then((value) => 
//       Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()))
//       );
//    }
//    catch(e)
//    {
//      print(e);
//    }
// }
Future logOut (BuildContext context) async
 {
   FirebaseAuth auth = FirebaseAuth.instance;
   try
   {
     await auth.signOut().then((value) => 
     Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()))
     );
   }
   catch(e) 
  {
     print(e);
   }
 }