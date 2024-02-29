import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'get_started.dart';

class UserSc extends StatefulWidget {
  //final String? username;
  const UserSc({super.key});

  @override
  State<UserSc> createState() => _UserScState();
}

class _UserScState extends State<UserSc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/bg1.png"),fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 90),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(229, 210, 241, 0.8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(child: Icon(Icons.account_circle,size:50)),
                const SizedBox(height: 10,),
                const Text('User Name',style: TextStyle(fontSize: 20),),
                const SizedBox(height: 10,),
                const Text("Email",style: TextStyle(fontSize: 20)),
                const SizedBox(height: 10,),
                const Text("Purchase Courses",style: TextStyle(fontSize: 20)),
                TextButton(onPressed: () async {
                    SharedPreferences pref= await SharedPreferences.getInstance();
                    pref.remove('uniqueId');
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const GetStarted()));
                }, child: const Text('LogOut your account',style: TextStyle(color: Colors.black87,fontSize: 21),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
