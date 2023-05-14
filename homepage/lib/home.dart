// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:homepage/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/src/material/circle_avatar.dart';


class Home extends StatelessWidget {
  
final List _namesub =[
    "Hai good morning",
    "Hai good morning",
    "Hai good morning",
    "Hai good morning",
    "Hai good morning",
    "Hai good morning",
    "Hai good morning",
    "Hai good morning",
    "Hai good morning",

  ];

  final List _name =[
    "Thanseeh",
    "Ali",
    "Deepak",
    "Afham",
    "Justin",
    "Basil",
    "Ashwin",
    "Bibin",
    "Rahil",
  

  ];
   final List<String> _imga=[
  "https://iso.500px.com/wp-content/uploads/2016/03/stock-photo-142984111-1500x1000.jpg",
  "https://www.shutterstock.com/image-photo/earth-crystal-glass-globe-ball-260nw-1500154991.jpg",
  "https://iso.500px.com/wp-content/uploads/2016/03/stock-photo-142984111-1500x1000.jpg",
  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
  "https://thumbs.dreamstime.com/b/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg",
  "https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=600",
  "https://images.pexels.com/photos/572897/pexels-photo-572897.jpeg?auto=compress&cs=tinysrgb&w=600",
  "https://images.pexels.com/photos/2770933/pexels-photo-2770933.jpeg?auto=compress&cs=tinysrgb&w=600",
  "https://images.pexels.com/photos/2832034/pexels-photo-2832034.jpeg?auto=compress&cs=tinysrgb&w=600",

  ];
  final List _time =[

    "12:00 pm",
    "10:20 am",
    "9:00 am",
    "8 : 50 am",
    "8 :30 am",
    "8 :20 am",
    "7 :30 am",
    "8 :20 am",
    "8 :10 am",
  
  ];



  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Colors.white,
      drawer:Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children:  [
            const UserAccountsDrawerHeader(accountName: Text("MUHAMMED NABEEL "),
             accountEmail: Text("nabeel@gmail.com"),
             currentAccountPicture: CircleAvatar(
            
              backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),

             

             ),
              decoration:BoxDecoration(color: Colors.pink)
            ),
            ListTile(
              title: const  Text("Profile"),
            textColor: Colors.pink,

              leading: IconButton(onPressed: () {
              }, 
              icon: const Icon(Icons.person,color: Colors.pink,)
              ),
            ),
            ListTile(
              title: const Text("New Group"),
               textColor: Colors.pink,
              leading: IconButton(onPressed: () {
                
              }, icon: const Icon(Icons.group,color: Colors.pink,),
              ),
            ),
             ListTile(
              title: const Text("Calls"),
               textColor: Colors.pink,
              leading: IconButton(onPressed: () {
                
              }, icon: const Icon(Icons.call,color: Colors.pink,)),

            ),
            ListTile(
              title: const Text("Settings"),
               textColor: Colors.pink,
              leading: IconButton(onPressed: () {
                
              }, icon: const Icon(Icons.settings,color: Colors.pink,)),
            ),
            ListTile(
              title: const Text("invite Friends"),
               textColor: Colors.pink,
              leading: IconButton(onPressed: () {
                
              }, icon:const Icon(Icons.person_add,color:Colors.pink,)),
            ),
            ListTile(
              title: const Text("Logout"),
               textColor: Colors.pink,
              leading: IconButton(onPressed: () {
                singout(context);
                
              }, 
              icon: const Icon(Icons.logout,color: Colors.pink,)),
            ),
            
          ],
        ),

      ),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title:  Text('ChatME'),
        actions:  [
          Padding(padding: EdgeInsets.only(top: 10,right: 15),
          child: IconButton(onPressed: () {
           
            
          }, icon: Icon(Icons.search))
          ),
        ],
       
      ),

//chat section.//

      body:Container(
        child: ListView.separated(
          separatorBuilder: ((context, index) => const Divider(thickness: 3,color: Colors.black,
          )),
          
          
          itemCount: _name.length,
          itemBuilder: (context,index)=>Container(
            child: ListTile(  
              leading: CircleAvatar(
                radius: 30,
               backgroundImage:  NetworkImage(
                          _imga[index],
                        ),
              ),
              
              
                   
                title: Text(_name[index]),
                subtitle:  Text(_namesub[index]),
                trailing:  Text(_time[index]),
              ),
          )
          ),
      ),
      );
      
  }

  singout(BuildContext ctx) async{
    final _sharedprefs =await SharedPreferences.getInstance();
   await  _sharedprefs.clear();
   Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx1) => Login()), (route) => false);
  }
}