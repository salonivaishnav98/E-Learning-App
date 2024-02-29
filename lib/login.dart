
import 'dart:ui';
import 'package:evergreen_seed/signup.dart';
import 'package:evergreen_seed/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DbController.dart';
import 'main.dart';


class LoginSc extends StatefulWidget{
  const LoginSc({super.key});

  @override
  State<LoginSc> createState() => _LoginScState();
}

class _LoginScState extends State<LoginSc> {

  final uNameController = TextEditingController();
  final passController = TextEditingController();

  bool showPassword = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/bg1.png'),fit: BoxFit.cover),
         ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                decoration: const BoxDecoration(
                  //color: Color.fromRGBO(120, 135, 196, 0.7411764705882353),
                  image: DecorationImage(image: AssetImage('assets/images/login2.png'),alignment: Alignment.center),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10,sigmaY: 30),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                            borderRadius : BorderRadius.all(Radius.circular(20))
                        ),

                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const Text("Welcome Back",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'FontMain',fontWeight: FontWeight.bold),),
                              const SizedBox(height: 30,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [

                                        TextField(
                                          controller: uNameController,
                                          style: const TextStyle(
                                            color:  Colors.white,fontSize: 20,fontFamily: 'FontMain'),

                                          keyboardType: TextInputType.text,

                                          decoration: const InputDecoration(
                                            prefixIcon: Icon(Icons.account_circle,color:  Colors.white,),
                                            label: Text('User name',style: TextStyle(fontSize: 20,color:  Colors.white),),
                                            contentPadding: EdgeInsets.only(left: 20),
                                            border: OutlineInputBorder(

                                               // borderSide: BorderSide(color: Colors.red),
                                            ),


                                          ),
                                        ),


                                        const SizedBox(height: 30,),

                                        TextField(
                                          controller: passController,
                                          style: const TextStyle(
                                              color:  Colors.white,fontSize: 20,fontFamily: 'FontMain',wordSpacing: 2
                                          ),

                                          obscureText: showPassword,
                                          obscuringCharacter: "*",
                                          keyboardType: TextInputType.text,

                                          decoration: InputDecoration(
                                              prefixIcon: const Icon(Icons.password_rounded,color:  Colors.white,),
                                              suffixIcon: IconButton(onPressed: (){
                                                setState(() {
                                                  showPassword = !showPassword;
                                                });
                                              }, icon: Icon(showPassword? Icons.visibility_off : Icons.visibility,color:  Colors.white,)),
                                            label: const Text('Password',style: TextStyle(fontSize: 20,color:  Colors.white),),
                                            contentPadding: const EdgeInsets.only(left: 20),
                                            border: const OutlineInputBorder(
                                              //borderSide: BorderSide(color: Colors.white),
                                            )
                                          ),
                                        ),
                                      ],),
                                  ),
                                      const SizedBox(
                                        width: 10,
                                      ),

                                      Expanded(
                                        flex: 1,
                                        child: ElevatedButton(onPressed: (){
                                          DatabaseHelper.authentication(uNameController.text, passController.text).then((value) async {
                                            //print("value is ....................$value");

                                            if (value.isNotEmpty) {
                                              String? uniqueId = value[0]['unique_id']; // Note the change in accessing the 'unique_id' field
                                              String? username = value[0]['username'];


                                              SharedPreferences pref= await SharedPreferences.getInstance();
                                              await pref.setString("uniqueId",uniqueId!);
                                              await pref.setString("username",username!);

                                              //print("unique id is............$username");

                                              Utils().toastMsg("login successfully", Colors.white);
                                              Get.offAll(HomeSc(username: username,));
                                              //Navigator.pop(context, MaterialPageRoute(builder:(context) => HomeSc(username: username),));
                                            }
                                            else{
                                              Utils().toastMsg("invalid User", Colors.redAccent);
                                            }
                                          });
                                        },
                                            style:ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              //padding: const EdgeInsets.symmetric(vertical: 20),
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

                                            ),
                                            child:
                                        const Icon(Icons.navigate_next,),

                                        ),),



                                        ],
                                      ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(height: 30),

                                TextButton(onPressed: (){},
                                    child: const Text('Forgot Password?',style: TextStyle(color:  Colors.white,fontSize: 15,fontFamily: 'FontMain'),),),

                                const SizedBox(height: 20),

                              Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Continue with Google   ",style: TextStyle(fontSize: 20,color:  Colors.white,fontFamily: 'FontMain'),),
                                     // ImageIcon(AssetImage('assets/images/google.jpeg'),alignment: Alignment.bottomCenter,height: 50)
                                      ElevatedButton(onPressed: (){}, child:const Image(image: AssetImage('assets/images/g_logo.png'),height: 40,),),
                                    ],
                                  ),
                              ],
                            ),

                            const SizedBox(height: 20,),

                            TextButton(onPressed: (){
                              Navigator.push(context,MaterialPageRoute(builder: ((context) => const SignUp())));

                            }, child: const Text('Sing Up',style: TextStyle(fontSize: 20,color:  Colors.white,fontWeight: FontWeight.w300,fontFamily: 'FontMain'),)),
                                  ],
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}