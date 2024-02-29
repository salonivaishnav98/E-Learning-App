import 'dart:async';

import 'package:evergreen_seed/bottonNavSc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'get_started.dart';
import 'main.dart';

class SplashSc extends StatefulWidget{
  const SplashSc({super.key});

  @override
  State<SplashSc> createState() => _SplashScState();
}

class _SplashScState extends State<SplashSc> {
  @override

  void initState(){
    super.initState();
    splashTime();

  }
  void splashTime(){
    Timer(const Duration(seconds: 3),() async {

      SharedPreferences pref = await SharedPreferences.getInstance();

      String? uniqueId = pref.getString('uniqueId');
      String? username=pref.getString('username');

     // print("username.......$username");
     // print("username.......$uniqueId");

      if (uniqueId != null) {

        Get.offAll(()=>BottomNavBar(username: username));


      }
      else{
        Get.offAll(()=>const GetStarted());
      }

    },);
  }
 // Future<void> check() async {
 //   SharedPreferences pref= await SharedPreferences.getInstance();
 //
 //   String? uniqueId= pref.getString('uniqueId');
 //
 //   if(uniqueId!=null){
 //     Navigator.push(context, MaterialPageRoute(builder: (context) => HomeSc(),));
 //   }
 //   else{
 //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GetStarted(),));
 //   }
 //
 // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/bg1.png'),fit:BoxFit.fill,alignment: Alignment.center),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              ClipRRect(
                  borderRadius:BorderRadius.circular(100),
                  child: const Image(image: AssetImage('assets/images/tree_logo.png'),height: 200,width: 200,)),
              // const Text("Embark on a Journey of Knowledge with a Simple Click",style: TextStyle(color: Color.fromRGBO(
                //  154, 179, 185, 1.0),fontSize: 20),),
              const Text("Learn, Grow, Shine with Us !",style: TextStyle(color: Color.fromRGBO(
                  232, 170, 51, 1.0),fontSize: 25,fontWeight: FontWeight.bold, shadows: [
                    Shadow(color: Color.fromRGBO(
                        42, 42, 42, 0.9607843137254902),
                    offset: Offset(2, 2),
                    blurRadius: 3)
              ]),),
              const SizedBox(height: 20,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Welcome to ",style: TextStyle(color: Color.fromRGBO(
                      189, 204, 236, 1.0),fontSize: 25,fontFamily: 'FontMain',shadows: [
                        Shadow(color: Color.fromRGBO(44, 40, 40, 0.9),
                        offset: Offset(2 , 2),
                        blurRadius: 2)
                  ]),),

                  Text("Knowledge Nest!",style: TextStyle(color: Color.fromRGBO(
                      189, 204, 236, 1.0),fontSize: 28,fontFamily: 'FontMain',shadows: [
                        Shadow(color: Color.fromRGBO(
                            44, 40, 40, 0.9),
                        offset: Offset(3, 3),
                        blurRadius: 3),
                  ]),),
                ],
              ),
              const SizedBox(height: 50,),
              const CircularProgressIndicator(color: Colors.white),





            ],
          ),
        ),
      ),
    );
  }
}