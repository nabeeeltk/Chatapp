import 'package:flutter/material.dart';
import 'package:homepage/home.dart';
import 'package:homepage/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
   Login({super.key});


  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

   final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        title: const Text("ChatMe!" ,style: TextStyle(color: Colors.grey),),
        backgroundColor:  Colors.pink,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(1)),
        ),
        elevation: 20,
      ),
      backgroundColor: Colors.black,
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      
        children:  [
          const  Icon(Icons.lock, size: 80,color: Colors.white),
          
          const Text("Sign in"
          ,style: TextStyle(fontSize: 20,
          color: Color.fromARGB(255, 210, 12, 78),
        fontWeight: FontWeight.bold  ),
          
          ),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 30),
             child: Form(
              key: _formkey,
              child: Column(
                children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    
                    controller: _usernameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration:  InputDecoration(
                      labelText:"Emial",
                      hintText: 'Username',
                      prefixIcon: const Icon(Icons.email),
                      
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                 fillColor: Theme.of(context).secondaryHeaderColor.withOpacity(0.3),
                 filled: true,
                    ),
                    onChanged: (String value){},
                    validator: (value) {
                 if (value!.isEmpty)
                  {
                            return 'Username can not be empty';
                          } 
                          // else if (value.length < ) 
                          // {
                          //   return 'Must contain 6 characters';
                          // }
                           else
                            {
                            return null;
             }
                    },
                               
                  ),
                ),
                const SizedBox( height: 20),
           
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration:  InputDecoration(
                      
                      labelText: "Password",
                      hintText: "please enter Password",
                    
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: const Icon(Icons.remove_red_eye_sharp),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                    ),
                      fillColor:Theme.of(context).secondaryHeaderColor.withOpacity(0.3),
                      filled: true,
                    ),
                    onChanged: (String value){    
                    },
                    validator: (value) {
                     if (value!.isEmpty)
                  {
                            return 'password  can not be empty';
                          } 
                          else if (value.length < 6) 
                          {
                            return 'Must contain 6 characters';
                          }
                           else
                            {
                            return null;
             }
                           
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton
                    (onPressed:() { 
                      if(_formkey.currentState!.validate())
                      {
                        checklogin(context);
                      }else{
                        print('data empty');
                      }
                      
                     checklogin(context);
    
                    },
                  
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                
                    child: const Text("Login" ,style: TextStyle(color: Colors.white),
                    
                    ),
                    color: Colors.pink
                    
                    
                    ,),
                  ],
                )
                ],
              ),
             ),
           ),
        ],
      ),
    );
  }
  void checklogin(BuildContext ctx) async {
  final  _username = _usernameController.text;
  final  _password =_passwordController.text;
  if(_username== 'nabeel' && _password== '123456'){
    print("Username not match");

    final _sharedprefs = await SharedPreferences.getInstance();
    await  _sharedprefs.setBool(SAVE_KEY_NAME, true);


    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx1) => Home()
    ),
    );


  }

  else{

    final _errorMessage = 'Username  or password not match';

    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10),
      backgroundColor: Colors.red,
      content: Text(_errorMessage),
      duration: const Duration(seconds:3 ),
      ),
      );
      

  }
  }
  
}