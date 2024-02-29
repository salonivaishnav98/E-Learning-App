
import 'dart:ui';

import 'package:evergreen_seed/statemanagement.dart';
import 'package:evergreen_seed/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'DbController.dart';
import 'login.dart';

import 'package:uuid/uuid.dart';

class SignUp extends StatefulWidget{
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final fNameController = TextEditingController();
  final emailController = TextEditingController();
  final uNameController = TextEditingController();
  final passController = TextEditingController();
  final rePassController = TextEditingController();
  final uuid = const Uuid();

  final userAuthController = Get.put(StateManage());




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/bg1.png'),fit:BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
              decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/signup.png'),alignment: Alignment.center),
              ),
              ),
          
              Padding(
                padding: const EdgeInsets.all(15.0),

                child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 10,sigmaX: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius :const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                                  
                                  
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10,),
                                  
                            const Text('Create your Account',style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'FontMain',wordSpacing: 2,fontWeight: FontWeight.bold),),
                                  
                                  
                            TextField(
                              controller: fNameController,
                              style: const TextStyle(
                                  color: Colors.white,fontSize: 20,fontFamily: 'FontMain'
                              ),
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                  label: Text('Full Name',style: TextStyle(fontSize: 20,color:  Colors.white)))
                              ),
                                  
                            TextField(
                              controller: uNameController,
                              style: const TextStyle(
                                  color:Colors.white,fontSize: 20,fontFamily: 'FontMain'
                              ),
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                label: Text('user name',style: TextStyle(fontSize: 20,color:  Colors.white,)),
                              ),
                            ),
                                  
                                  
                            TextField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  label: const Text('Email',style: TextStyle(fontSize: 20,color:  Colors.white)),
                                errorText: userAuthController.emailAuth.value ? null : 'Invalid email address',
                              ),
                              onChanged: (value){
                                userAuthController.emailValid(value);
                              },
                              style: const TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'FontMain'
                              ),
                            ),
                                  
                                  
                                  
                                  
                            Obx(()=>
                              TextField(
                                controller: passController,
                                style: const TextStyle(
                                    color:Colors.white,fontSize: 20,fontFamily: 'FontMain'
                                ),
                                obscureText: !userAuthController.showPass.value,
                                keyboardType: TextInputType.text,
                                decoration:  InputDecoration(
                                  suffixIcon: IconButton(onPressed: (){
                                  
                                      userAuthController.showPassFunc();
                                  
                                  }, icon: Icon(!userAuthController.showPass.value? Icons.visibility_off:Icons.visibility,color: Colors.white,),),
                                    label: const Text('Password',style: TextStyle(fontSize: 20,color:  Colors.white,)),
                                  errorText: userAuthController.passAuth.value?null : 'Invalid password',
                                ),
                                  onChanged: (value){
                                      userAuthController.passwordValid(value);
                                  }
                                ),
                            ),
                                  
                                  
                            Obx(()=>
                              TextField(
                                controller: rePassController,
                                style: const TextStyle(
                                    color:Colors.white,fontSize: 20,fontFamily: 'FontMain'
                                ),
                                obscureText: userAuthController.showRePass.value,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(onPressed: (){
                                      userAuthController.showRePassFunc();
                                  }, icon: Icon(!userAuthController.showRePass.value? Icons.visibility_off : Icons.visibility,color: Colors.black38,)),
                                  
                                    label: const Text('Re-type Password',style: TextStyle(fontSize: 20,color:  Colors.white))
                                ),
                              ),
                            ),
                                  
                                  
                            const SizedBox(height: 20,),
                                  
                                  
                            ElevatedButton(onPressed: (){
                                  
                              if(passController.text.isEmpty || uNameController.text.isEmpty || emailController.text.isEmpty || rePassController.text.isEmpty || fNameController.text.isEmpty) {
                                Utils().toastMsg(
                                    "Please fill all the fields", Colors.redAccent);
                              }
                              else{
                                DatabaseHelper.checkUserExistance(uNameController.text).then((value1){
                                  
                                  if(!value1) {
                                    DatabaseHelper.checkEmailExistance(emailController.text).then((email){
                                      if(!email){
                                        if (passController.text != rePassController.text) {
                                          Utils().toastMsg("Password didn't match", Colors.redAccent);
                                        }
                                  
                                        else {
                                          String uniqueId=const Uuid().v4();
                                          DatabaseHelper.createItem(
                                              fNameController.text, emailController.text,
                                              uNameController.text, passController.text,
                                              uniqueId);
                                          Utils().toastMsg("Account created successfully!",Colors.white);
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginSc(),));
                                        }
                                  
                                    }else{
                                        Utils().toastMsg('Email already exist!', Colors.redAccent);
                                      }
                        });
                                  
                                  }
                                  else{
                                    Utils().toastMsg("Username already Exist!",Colors.redAccent);
                                  
                                  }
                                  
                                });
                              }
                                  
                                  
                            },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(5)),
                                  fixedSize:const Size(400, 50),
                                  backgroundColor:  Colors.white),
                              child: const Text('Sign Up',style: TextStyle(color:Colors.black,fontSize: 20,fontFamily: 'FontMain')),
                            ),
                                  
                            const SizedBox(height: 30,),
                                  
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already have an account?",style: TextStyle(color:Colors.white,fontSize: 15,fontFamily: 'FontMain'),),
                                //Text('Sing Up',style: TextStyle(fontSize: 18,color: Color.fromRGBO(8, 149, 238, 1.0),fontWeight: FontWeight.w500),),
                                TextButton(onPressed: (){
                                  Navigator.push(context,MaterialPageRoute(builder: ((context) => const LoginSc())));
                                  
                                }, child: const Text('Sing In',style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: 'FontMain'),))
                              ],
                            ),
                            const SizedBox(height: 20,)
                          ],//children
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