//import 'dart:isolate';

import 'package:chat_app/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'Methods.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({ Key? key }) : super(key: key);
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  var isLoading = false;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body:  isLoading  ?
           Center(
             child: Container(
               height: size.height/20,
               width: size.width/20,
               child: CircularProgressIndicator(),
             ),
           )
           : SingleChildScrollView(
              child: Column(
                children: 
                [  SizedBox(height:size.height/50),
                   Container(
                     width: size.width/0.5,
                     alignment: Alignment.centerLeft,
                     child: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios),
                   ),
                   ),
                    SizedBox(height: size.height/30),
                    Container(
                    width: size.width/1.1,
                    child: Text('Welcome', style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      width: size.width/1.1,
                      child: Text('Create Acconut to continue:', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.blue),),
                    ),
                    SizedBox(height: size.height/20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: size.width,
                        child: field(size,"Name",Icons.account_box,_name),
                         ),
                       ),
                      Container(
                        alignment: Alignment.center,
                        width: size.width,
                        child: field(size,"Email",Icons.account_box,_email),
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 18.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: size.width,
                        child: field(size,"Password",Icons.lock,_password),
                      ),
                      ),
                      SizedBox(height: size.height/20,),
                      customButton(size),
                      Padding(padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                         onTap: (){ Navigator.pop(context);},
                        child: Text('Login', style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.blue),
                        ),
                        ),
                      ),
                ],
              ),
           ),     
    );
  }
Widget customButton(Size size)
{  
    return GestureDetector(
      onTap: (){
        if(_name.text.isNotEmpty && _email.text.isNotEmpty && _password.text.isNotEmpty)
        {
          setState(() {
            isLoading=true;
          });

          createAccount(_name.text,_email.text,_password.text)
            .then((user)
            {
              if (user!=null)
              {  
                
                 setState((){isLoading = false;});
                 Navigator.push(context,MaterialPageRoute(builder:(_)=> HomeScreen()));
                 print("Account Created Succeesfully");
                  
              }
              else
              {    print("Login Failed");
                   setState((){isLoading = false;});
              }
            });
        }
        else
        {
           print("Please Enter Fields");
        }
      },
      child: Container(
        height: size.height/14,
        width: size.width/1.2,
        decoration: BoxDecoration(color: Colors.blue, borderRadius:  BorderRadius.circular(5),),
        alignment: Alignment.center,
        child: Text('Create Account', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),),
      ),
    );
  }
  
}

Widget field(Size size,String hintText,IconData icon,TextEditingController cont)
  {
       return Container(
         height: size.height/14,
         width: size.width/1.1,
        child: TextField(
          controller:  cont,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
       );
  }