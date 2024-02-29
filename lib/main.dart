
import 'package:evergreen_seed/purchase_courses.dart';
import 'package:evergreen_seed/searching.dart';
import 'package:evergreen_seed/signup.dart';
import 'package:evergreen_seed/splash_sc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:shared_preferences/shared_preferences.dart';

import 'explore.dart';
import 'get_started.dart';
import 'login.dart';

void main(){

  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:  SplashSc(),
      title: 'Evergreen Seed',
    );
  }
}
class HomeSc extends StatefulWidget {
  final String? username;

  const HomeSc({Key? key, this.username}) : super(key: key);

  @override
  State<HomeSc> createState() => _HomeScState();
}



class _HomeScState extends State<HomeSc> {



@override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        //used for blur app
          //systemOverlayStyle: SystemUiOverlayStyle(systemStatusBarContrastEnforced: true),

        title: const Text ('Find the best courses for you !',style: TextStyle(fontSize: 25,color: Color.fromRGBO(
            46, 74, 153, 1.0),fontFamily: 'FontMain'),),


        toolbarHeight: 50,
        backgroundColor: const Color.fromRGBO(229, 210, 241, 1.0),
        surfaceTintColor: Colors.transparent,




        actions:[
          // IconButton(onPressed: (){
          //   Navigator.push(context, MaterialPageRoute(builder: (context) => const Searching(),));
          // }, icon:const Icon(Icons.search),color: Colors.black,),

          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications,color: Colors.black,)),

          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:(context) => const LoginSc() ));
            }, icon: const Icon(Icons.login_rounded,color: Colors.black,))
        ],

      ),


      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(225, 214, 245, 1.0),
        child: ListView(
          children: [

            DrawerHeader(decoration: const BoxDecoration(
                image:DecorationImage(image: AssetImage('assets/images/bg1.png'),fit: BoxFit.cover),

              ),

              child:
              Column(
                children: [

                  const SizedBox(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/phd.png',),
                    ),
                  ),

                  Text('${widget.username}',style: const TextStyle(color: Colors.white),),

                ],
              ),

            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.dark_mode),
                      SizedBox(width: 10,),
                      Text('Dark Mode',style: TextStyle(fontSize: 17,)),
                    ],
                  ),
                  SizedBox(height: 10,),

                  Row(
                    children: [
                      Icon(Icons.document_scanner_sharp),
                      SizedBox(width: 10,),
                      Text('Test Series',style: TextStyle(fontSize: 17),),
                    ],
                  ),
                  SizedBox(height: 10,),

                  Row(
                    children: [
                      Icon(Icons.edit_calendar_sharp),
                      SizedBox(width: 10,),
                      Text('About Us',style: TextStyle(fontSize: 17),),
                    ],
                  ),
                  SizedBox(height: 10,),

                  Row(
                    children: [
                      Icon(Icons.contact_phone_sharp),
                      SizedBox(width: 10,),
                      Text('Contact Us',style: TextStyle(fontSize: 17),),
                    ],
                  ),
                  SizedBox(height: 10,),

                  Row(
                    children: [
                      Icon(Icons.notifications_active),
                      SizedBox(width: 10,),
                      Text('Notification',style: TextStyle(fontSize: 17),),
                    ],
                  ),
                ],
              ),
            ),
             const Divider(
               //height: 200,
             ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Logout'),
                ),
                IconButton(onPressed: () async {
                  SharedPreferences pref= await SharedPreferences.getInstance();
                  pref.remove('uniqueId');
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const GetStarted()));

                }, icon: const Icon(Icons.logout)),
              ],
            )
          ],
        ),
      ),


      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/bg1.png'),fit: BoxFit.cover),
        ),

        child: SingleChildScrollView(

          child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(229, 210, 241, 1.0),
                  borderRadius : BorderRadius.only(bottomLeft:Radius.circular(40),
                      bottomRight:Radius.circular(40))
              ),
            ),
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Container(
                          width: 110,
                          height: 150,
                          decoration: BoxDecoration(
                            boxShadow: const [BoxShadow(color: Colors.black12,
                                offset: Offset(0,0),
                                blurRadius: 21
                                ,
                                spreadRadius: 5)],
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Image.asset("assets/images/library.png",width: 90,),
                                const SizedBox(height: 5,),
                                const Text('My Library',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 110,
                          height: 150,
                          decoration: BoxDecoration(
                            boxShadow: const [BoxShadow(color: Colors.black12,
                              offset: Offset(0, 0),
                            blurRadius: 10,
                            spreadRadius: 5)],
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/notes.png"),
                              const SizedBox(height: 5,),
                              const Text('Notes',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                            ],
                          ),
                        ),
                        ),
                        Container(
                          width: 110,
                          height: 150,
                          decoration: BoxDecoration(
                            boxShadow: const [BoxShadow(color: Colors.black12,
                                offset: Offset(0, 0),
                                blurRadius: 10,
                                spreadRadius: 5)],
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/test.png"),
                              const SizedBox(height: 5,),
                              const Text('Test',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                            ],
                          ),
                        ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 20,),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(229, 210, 241, 1.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const Text('Popular Courses :',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Container(
                                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const ListTile(
                                        leading: Image(image: AssetImage('assets/images/phd.png')),
                                        title: Text('Prof. Rose '),
                                        subtitle:Text('Some details about course')
                                    
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  Container(
                                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const ListTile(
                                        leading: Image(image: AssetImage('assets/images/phd.png')),
                                        title: Text('Prof. Rose '),
                                        subtitle:Text('Some details about course')
                  
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  Container(
                                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const ListTile(
                                        leading: Image(image: AssetImage('assets/images/phd.png')),
                                        title: Text('Prof. Rose '),
                                        subtitle:Text('Some details about course')
                  
                                    ),
                                  ),
                                  const SizedBox(height: 10,),

                                  Container(
                                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const ListTile(
                                        leading: Image(image: AssetImage('assets/images/phd.png')),
                                        title: Text('Prof. Rose '),
                                        subtitle:Text('Some details about course')

                                    ),
                                  ),
                                  const SizedBox(height: 10,),

                                  Container(
                                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const ListTile(
                                        leading: Image(image: AssetImage('assets/images/phd.png')),
                                        title: Text('Prof. Rose '),
                                        subtitle:Text('Some details about course')

                                    ),
                                  ),
                                  const SizedBox(height: 10,),

                                  Container(
                                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const ListTile(
                                        leading: Image(image: AssetImage('assets/images/phd.png')),
                                        title: Text('Prof. Rose '),
                                        subtitle:Text('Some details about course')

                                    ),
                                  ),
                                  const SizedBox(height: 10,),

                                  Container(
                                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const ListTile(
                                        leading: Image(image: AssetImage('assets/images/phd.png')),
                                        title: Text('Prof. Rose '),
                                        subtitle:Text('Some details about course')

                                    ),
                                  ),
                                  const SizedBox(height: 10,),

                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    );
  }


}
