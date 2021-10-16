import 'package:chat_app/Authenticate/CreateAccount.dart';
import 'package:chat_app/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

import 'Methods.dart';
class LoginScreen extends StatefulWidget {
  //const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   final TextEditingController _email = TextEditingController();
   final TextEditingController _password = TextEditingController();
     bool isLoading = false;
  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
    return Scaffold(
         body:  isLoading
           ?
           Center(
             child:  Container(
               height: size.height/20,
               width:  size.width/20,
               child: CircularProgressIndicator(),
             ),
           )
           :
           SingleChildScrollView(
             child:  Column(
                children: [
                     SizedBox(height: size.height/20,),
                     Container(
                     alignment: Alignment.centerLeft,
                     width: size.width/0.5,
                     child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios),
                     ),
                     ),
                     SizedBox(height: size.height/50,),
                     Container(
                       alignment: Alignment.centerLeft,
                       width: size.width/1.1,
                       child: Text('Welcome', style: TextStyle( fontSize: 34,fontWeight: FontWeight.bold,color: Colors.brown),),
                     ),
                     Container(
                       alignment: Alignment.centerLeft,
                       width: size.width/1.1,
                       child: Text('Sign into Continue', style:  TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: Colors.pink),),
                     ),
                     SizedBox(height: size.height/20,),
                     Container(
                     alignment: Alignment.center,
                     width: size.width,
                     child: field(size, "_email", Icons.account_box, _email),
                     ),
                     Padding(padding: const EdgeInsets.symmetric(vertical: 18.0),
                       child: Container(
                         alignment: Alignment.center,
                         width: size.width,
                         child: field(size, "_password", Icons.account_box, _password),
                       ),
                      ),
                      SizedBox(height: size.height/10,),
                      customButton(size),
                      SizedBox(height: size.height/40,),
                      GestureDetector(
                        onTap: () =>
                        
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => CreateAccount())),
                          child: Text('Create Account',
                              style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.red),
                           ),
                       ),
                ],
             ),
           )
    );
  }
  
    Widget customButton(Size size)
    {
       return GestureDetector(
           onTap: ()
           {
             if(_email.text.isNotEmpty && _password.text.isNotEmpty)
              {
                setState(() {
                  isLoading= true;
                });
                logIn(_email.text ,_password.text).then((user)
                { if(user!=null)
                   {
                     print('Login Successful');
                     setState((){
                      isLoading = false;
                     });
                     Navigator.push(context,MaterialPageRoute(builder: (_) => HomeScreen()));
                   }
                   else
                   {
                     print('Login Failed');
                     setState((){
                        isLoading =false;
                     });
                   }
                });
              }
              else
              {
                print('Please fill form correctly');
              }
              },
        
              child :Container(
                 width: size.width/1.1,
                 height: size.height/14,
                 decoration: BoxDecoration(
                   color: Colors.blue,
                   borderRadius: BorderRadius.circular(5)),
                   alignment: Alignment.center,
                   child: Text("Login",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.white,fontSize: 18),),
                ),
       );
    }
    Widget field( Size size, String hintText,IconData icon,TextEditingController cont)
    {
      return Container(
        width: size.width/1.1,
        height: size.height/14,
        child:  TextField(
          controller: cont,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon),
            hintStyle: TextStyle(color: Colors.yellow),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
        ),
      );
    }
}