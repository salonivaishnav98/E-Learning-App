
import 'package:evergreen_seed/signup.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class GetStarted extends StatefulWidget{
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/bg1.png'),fit:BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/images/getstart.png')),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginSc(),));
                }, child: const Text('Login')),

                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp(),));
                }, child: const Text('SignUp'))

              ],
            ),

          ],
        ),
      ),
    );
  }
}