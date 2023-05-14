
// ignore_for_file: use_build_context_synchronously



import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:homepage/home.dart';
import 'package:homepage/login.dart';
import 'package:shared_preferences/shared_preferences.dart';



const SAVE_KEY_NAME ='UserLoggedIn';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
   
    checkUserLoggedIn();
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.pink,
      body:Center(
      
        child: Text("ChatMe",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        
        
      ) ,
    );
    
  }

  Future<void> gotologin()async{
   
    Navigator.of(context)
    .pushReplacement(
      MaterialPageRoute(builder: (ctx){
    return Login();
    } ));
  }

  Future <void> checkUserLoggedIn() async{
        Future.delayed(const Duration(seconds: 3));

final _sharedprefs = await SharedPreferences.getInstance();
final _userLoggedIn = _sharedprefs.getBool(SAVE_KEY_NAME);
if (_userLoggedIn==null){
  gotologin();
}else{
 Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  Home(),
));
}
  }
}


